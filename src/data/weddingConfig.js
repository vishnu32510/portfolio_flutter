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
    muhurthamWindow: '10:00 AM – 11:30 AM',
    venueName: 'Serene Springs Farm',
    cityState: 'Hillsborough Township, NJ',
    addressLine: '121 S Branch Rd, Hillsborough Township, NJ 08844',
    mapsUrl: 'https://maps.app.goo.gl/d6DG2rNsGL6nSmCr5',
    feastTitle: 'Kalyana Virundhu (Wedding Feast)',
    templeNote:
      'Following the Muhurtham rituals, a visit to the Balaji temple (20 mins away from the venue) and return to Serene Springs Farm for lunch at 1:00 PM.',
    feastNote:
      'Following the Muhurtham rituals, a visit to the Balaji temple (20 mins away from the venue) and return to Serene Springs Farm for lunch at 1:00 PM.',
    agenda: [
      {
        time: '8:00 AM',
        title: 'Breakfast',
        tamilTitle: 'காலை உணவு',
        location: 'Serene Springs Farm',
        description: 'Beginning the celebratory day with morning breakfast.',
      },
      {
        time: '10:00 AM – 11:30 AM',
        title: 'Wedding Ceremony',
        tamilTitle: 'சுப முகூர்த்தம்',
        location: 'Serene Springs Farm',
        description: 'Sacred wedding ceremony and auspicious vows uniting Noviya & Vishnu Priyan.',
        highlight: true,
      },
      {
        time: '1:00 PM',
        title: 'Wedding Lunch',
        tamilTitle: 'கல்யாண விருந்து',
        location: 'Serene Springs Farm',
        description: 'Traditional wedding feast and celebrations at Serene Springs Farm.',
      },
    ],
  },
  coupleStory: {
    caption: '2 people who found each other',
    subcaption: 'From candid smiles to lifelong promises — everyday moments that brought us here.',
    row1: [
      { src: '/images/gallery/noviya-vishnu-chicago-lights.jpg', caption: 'From Chennai to Chicago..', alt: 'Noviya and Vishnu in Chicago' },
      { src: '/images/gallery/noviya-vishnu-new-york.jpg', caption: '..to New York', alt: 'Noviya and Vishnu in New York' },
      { src: '/images/gallery/noviya-vishnu-alpine-lake.jpg', caption: 'Holding on to each other', alt: 'Noviya and Vishnu at alpine lake' },
      { src: '/images/gallery/noviya-vishnu-graduation.jpg', caption: 'Two Degrees Later', alt: 'Noviya and Vishnu graduation day' },
    ],
    row2: [
      { src: '/images/gallery/vishnu-final-2.jpg', caption: 'The proposal', alt: 'Vishnu proposing to Noviya' },
      { src: '/images/gallery/noviya-vishnu-proposal-box.jpg', caption: 'The proposal', alt: 'Vishnu presenting the ring box' },
      { src: '/images/gallery/noviya-vishnu-proposal-hug.jpg', caption: 'The proposal', alt: 'Noviya and Vishnu embracing' },
      { src: '/images/gallery/noviya-vishnu-ring-chicago.jpg', caption: 'The easiest yes ever', alt: 'Noviya and Vishnu engagement ring' },
      { src: '/images/gallery/noviya-vishnu-family-chicago.jpg', caption: "Stepping into what's next..", alt: 'Both families together in Chicago' },
    ],
  },
  proposal: {
    headline: 'The Proposal',
    dateDisplay: 'May 16th',
    caption: 'On May 16th, Vishnu proposed to Noviya.',
    story: 'Beneath the open sky, a simple question turned a beautiful journey into forever.',
    photos: [
      { src: '/images/gallery/vishnu-final-2.jpg', title: 'The proposal', date: 'May 16', location: 'Chicago' },
      { src: '/images/gallery/noviya-vishnu-proposal-box.jpg', title: 'The proposal', date: 'May 16', location: 'Chicago' },
      { src: '/images/gallery/noviya-vishnu-proposal-hug.jpg', title: 'The proposal', date: 'May 16', location: 'Chicago' },
      { src: '/images/gallery/noviya-vishnu-ring-chicago.jpg', title: 'The easiest yes ever', date: 'May 16', location: 'Chicago' },
      { src: '/images/gallery/noviya-vishnu-family-chicago.jpg', title: "Stepping into what's next..", date: 'May 16', location: 'Chicago' },
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
    'SUMMARY:Wedding of Noviya & Vishnu Priyan (Subha Muhurtham & Kalyana Virundhu)',
    'DESCRIPTION:Wedding Celebration of Noviya & Vishnu Priyan:\\n• 8:00 AM: Morning Breakfast at Serene Springs Farm\\n• 10:00 AM - 11:30 AM: Auspicious Subha Muhurtham\\n• Following Muhurtham: Temple visit for blessings (20 mins away)\\n• 1:00 PM: Kalyana Virundhu (Wedding Feast / Lunch)\\nVaazhga Valamudan!',
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
