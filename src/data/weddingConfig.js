export const WEDDING_CONFIG = {
  greeting: {
    tamil: 'வாழ்க வளமுடன்',
    transliteration: 'Vaazhga Valamudan',
    meaning: 'May you live long and prosper with divine grace',
  },
  bride: {
    shortName: 'Noviya',
    fullName: 'Noviya Balasubramanian',
    natchatram: 'Kettai Natchatram',
    rasi: 'Viruchigam Rasi',
    sister: 'Janashruthi Balasubramanian',
    parents: {
      father: 'Balasubramanian Velu',
      mother: 'Muthulakshmi Subbiah',
      proseFallback: "the bride's parents",
      cardFallback: 'Beloved Parents of Noviya',
    },
  },
  groom: {
    shortName: 'Vishnu Priyan',
    fullName: 'Vishnu Priyan Sellam Shanmugavel',
    natchatram: 'Uthiram Natchatram',
    rasi: 'Simmam Rasi',
    parents: {
      father: 'Shanmugavel Sellamuthu',
      mother: 'Jothikanmani Duraisamy',
    },
  },
  event: {
    title: 'Wedding Ceremony & Celebrations',
    subtitle: 'Subha Muhurtham & Kalyana Virundhu',
    tamilSubtitle: 'சுப முகூர்த்தம் • கல்யாண விருந்து',
    dateDisplay: 'Sunday, December 13, 2026',
    shortDate: 'December 13, 2026',
    isoStart: '2026-12-13T08:00:00-05:00',
    isoEnd: '2026-12-13T14:30:00-05:00',
    muhurthamIsoStart: '2026-12-13T10:00:00-05:00',
    ceremonyTime: '8:00 AM to 2:00 PM EST',
    muhurthamWindow: '10:00 AM – 11:00 AM',
    venueName: 'Serene Springs Farm',
    cityState: 'Hillsborough Township, NJ',
    addressLine: '121 S Branch Rd, Hillsborough Township, NJ 08844',
    mapsUrl: 'https://maps.app.goo.gl/d6DG2rNsGL6nSmCr5',
    feastTitle: 'Kalyana Virundhu (Wedding Feast)',
    templeNote:
      'Following the auspicious Muhurtham rituals, we will visit the temple for blessings, which is 20 mins away from the venue.',
    feastNote:
      'Following the auspicious Muhurtham rituals, we will visit the temple for blessings (20 mins away from the venue) and return to Serene Springs Farm for lunch at 1:00 PM.',
    agenda: [
      {
        time: '8:00 AM',
        title: 'Morning Breakfast',
        tamilTitle: 'காலை உணவு',
        location: 'Serene Springs Farm',
        description: 'Begin the celebratory day with morning breakfast at the farm.',
      },
      {
        time: '10:00 AM – 11:00 AM',
        title: 'Subha Muhurtham',
        tamilTitle: 'சுப முகூர்த்தம்',
        location: 'Serene Springs Farm',
        description: 'Sacred wedding ceremony and auspicious vows uniting Vishnu Priyan & Noviya.',
        highlight: true,
      },
      {
        time: 'After Muhurtham',
        title: 'Temple Visit for Blessings',
        tamilTitle: 'கோவில் தரிசனம்',
        location: 'Temple (20 mins away)',
        description: 'Following the auspicious Muhurtham rituals, we will visit the temple for blessings (20 mins away from the venue).',
      },
      {
        time: '1:00 PM',
        title: 'Kalyana Virundhu (Wedding Feast)',
        tamilTitle: 'கல்யாண விருந்து',
        location: 'Serene Springs Farm',
        description: 'Traditional wedding feast and celebrations upon returning from the temple.',
      },
    ],
  },
  // Google Apps Script Web App connected to user's Google Sheet
  rsvpWebhookUrl:
    import.meta.env.VITE_RSVP_WEBHOOK_URL ||
    'https://script.google.com/macros/s/AKfycbyPBDCX6uPfGiBqTtYgv1zKsbp8EPaZM8QcKWlU32sT7FKCSWvMWg2SbhHu8xonJUY/exec',
}

export function getBrideParentsDisplay(mode = 'card') {
  const { father, mother, proseFallback, cardFallback } = WEDDING_CONFIG.bride.parents
  const cleanFather = father?.trim()
  const cleanMother = mother?.trim()

  if (cleanFather && cleanMother) {
    return `${cleanFather} & ${cleanMother}`
  }
  if (cleanFather || cleanMother) {
    return cleanFather || cleanMother
  }
  return mode === 'prose' ? proseFallback : cardFallback
}

export function downloadWeddingIcs() {
  const icsLines = [
    'BEGIN:VCALENDAR',
    'VERSION:2.0',
    'PRODID:-//Noviya & Vishnu Wedding//EN',
    'CALSCALE:GREGORIAN',
    'METHOD:PUBLISH',
    'BEGIN:VEVENT',
    'UID:noviya-vishnu-wedding-20261213@einvite',
    'DTSTAMP:20261110T000000Z',
    'DTSTART:20261213T130000Z',
    'DTEND:20261213T193000Z',
    'SUMMARY:Wedding of Vishnu Priyan & Noviya (Subha Muhurtham & Kalyana Virundhu)',
    'DESCRIPTION:Wedding Celebration of Vishnu Priyan & Noviya:\\n• 8:00 AM: Morning Breakfast at Serene Springs Farm\\n• 10:00 AM - 11:00 AM: Auspicious Subha Muhurtham\\n• Following Muhurtham: Temple visit for blessings (20 mins away)\\n• 1:00 PM: Kalyana Virundhu (Wedding Feast / Lunch)\\nVaazhga Valamudan!',
    'LOCATION:Serene Springs Farm\\, 121 S Branch Rd\\, Hillsborough Township\\, NJ 08844',
    'END:VEVENT',
    'END:VCALENDAR',
  ].join('\r\n')

  const blob = new Blob([icsLines], { type: 'text/calendar;charset=utf-8' })
  const url = URL.createObjectURL(blob)
  const link = document.createElement('a')
  link.href = url
  link.download = 'Noviya-and-Vishnu-Wedding.ics'
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
  URL.revokeObjectURL(url)
}

