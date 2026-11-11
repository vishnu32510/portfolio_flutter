#!/usr/bin/env node
import { execSync } from 'node:child_process'
import { writeFileSync } from 'node:fs'
import { resolve } from 'node:path'

const PROJECT_ID = 'vishnupriyan-ss'
const ENDPOINT = `https://firestore.googleapis.com/v1/projects/${PROJECT_ID}/databases/(default)/documents/wedding_rsvps`

async function main() {
  console.log('🌸 Fetching Wedding RSVPs from Firestore...')

  let token = process.env.GCLOUD_TOKEN
  if (!token) {
    try {
      token = execSync('gcloud auth print-access-token', { encoding: 'utf8' }).trim()
    } catch {
      console.error('❌ Error: Could not get gcloud access token. Please run `gcloud auth login` or set GCLOUD_TOKEN.')
      process.exit(1)
    }
  }

  const res = await fetch(ENDPOINT, {
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: 'application/json',
    },
  })

  if (!res.ok) {
    const errorText = await res.text()
    console.error(`❌ Firestore API responded with HTTP ${res.status}:`, errorText)
    process.exit(1)
  }

  const data = await res.json()
  const documents = data.documents || []

  if (documents.length === 0) {
    console.log('ℹ️  No RSVPs found in Firestore yet.')
    return
  }

  const rows = documents.map((doc) => {
    const f = doc.fields || {}
    return {
      submittedAt: f.submittedAt?.stringValue || '',
      guestName: f.guestName?.stringValue || '',
      email: f.email?.stringValue || '',
      attending: f.attending?.stringValue || '',
      attendees: Number(f.attendees?.integerValue || 0),
      dietaryPreference: f.dietaryPreference?.stringValue || 'N/A',
      notes: f.notes?.stringValue || '',
    }
  })

  // Sort by submission date descending
  rows.sort((a, b) => new Date(b.submittedAt) - new Date(a.submittedAt))

  // Escape CSV value
  const esc = (val) => {
    const str = String(val ?? '')
    if (str.includes(',') || str.includes('"') || str.includes('\n')) {
      return `"${str.replace(/"/g, '""')}"`
    }
    return str
  }

  const headers = [
    'Submitted At',
    'Guest Name',
    'Email Address',
    'Attending',
    'Guests Count',
    'Dietary Preference',
    'Blessings & Notes',
  ]

  const csvLines = [
    headers.map(esc).join(','),
    ...rows.map((r) =>
      [
        r.submittedAt ? new Date(r.submittedAt).toLocaleString() : '',
        r.guestName,
        r.email,
        r.attending === 'yes' ? 'Joyfully Attending' : 'Sending Wishes From Afar',
        r.attending === 'yes' ? r.attendees : 0,
        r.dietaryPreference,
        r.notes,
      ]
        .map(esc)
        .join(','),
    ),
  ]

  // Add UTF-8 BOM (\uFEFF) so Excel on Windows & Mac immediately recognizes UTF-8 formatting
  const csvContent = '\uFEFF' + csvLines.join('\n')
  const outputPath = resolve(process.cwd(), 'wedding_rsvps.csv')
  writeFileSync(outputPath, csvContent, 'utf8')

  // Print Summary Stats
  const attendingGuests = rows
    .filter((r) => r.attending === 'yes')
    .reduce((sum, r) => sum + (r.attendees || 1), 0)
  const vegCount = rows
    .filter((r) => r.attending === 'yes' && r.dietaryPreference === 'Vegetarian')
    .reduce((sum, r) => sum + (r.attendees || 1), 0)
  const nonVegCount = rows
    .filter((r) => r.attending === 'yes' && r.dietaryPreference === 'Non-Vegetarian')
    .reduce((sum, r) => sum + (r.attendees || 1), 0)
  const declinedCount = rows.filter((r) => r.attending === 'no').length

  console.log(`\n🎉 Successfully exported ${rows.length} RSVP response(s) to:`)
  console.log(`📁 ${outputPath}\n`)
  console.log('📊 RSVP Summary:')
  console.log(`   • Total RSVPs: ${rows.length}`)
  console.log(`   • Attending Guests: ${attendingGuests}`)
  console.log(`     - Vegetarian: ${vegCount}`)
  console.log(`     - Non-Vegetarian: ${nonVegCount}`)
  console.log(`   • Well-Wishers From Afar: ${declinedCount}`)
}

main().catch((err) => {
  console.error('Unexpected error:', err)
  process.exit(1)
})
