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
    title: 'Traditional Tamil Wedding',
    subtitle: 'Subha Muhurtham',
    tamilSubtitle: 'சுப முகூர்த்தம்',
    dateDisplay: 'Sunday, December 13, 2026',
    shortDate: 'December 13, 2026',
    isoStart: '2026-12-13T08:30:00-05:00',
    isoEnd: '2026-12-13T13:30:00-05:00',
    muhurthamIsoStart: '2026-12-13T10:00:00-05:00',
    ceremonyTime: '8:30 AM to 1:30 PM EST',
    muhurthamWindow: '10:00 AM – 11:00 AM',
    hall: 'Kalyana Mandapam',
    venueName: 'Sri Venkateswara Temple (Balaji Mandir)',
    addressLine: '1 Balaji Temple Drive, Bridgewater, NJ 08807',
    mapsUrl:
      'https://www.google.com/maps/search/?api=1&query=Sri+Venkateswara+Temple+1+Balaji+Temple+Drive+Bridgewater+NJ+08807',
    details:
      'Traditional South Indian Hindu wedding ceremony followed by an authentic vegetarian lunch.',
    feastTitle: 'Kalyana Virundhu (Wedding Feast)',
    feastNote:
      'Following the auspicious Muhurtham rituals, please join us for an authentic traditional South Indian vegetarian lunch.',
  },
  // Optional endpoint (e.g., Google Apps Script Web App or Formspree URL) for cloud RSVP storage
  rsvpWebhookUrl: import.meta.env.VITE_RSVP_WEBHOOK_URL || '',
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
    'DTSTART:20261213T133000Z',
    'DTEND:20261213T183000Z',
    'SUMMARY:Wedding of Vishnu Priyan & Noviya (Subha Muhurtham)',
    'DESCRIPTION:Traditional Tamil Hindu Wedding (Auspicious Muhurtham: 10:00 AM - 11:00 AM EST) followed by an authentic vegetarian lunch. Vaazhga Valamudan!',
    'LOCATION:Kalyana Mandapam\\, Sri Venkateswara Temple (Balaji Mandir)\\, 1 Balaji Temple Drive\\, Bridgewater\\, NJ 08807',
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

