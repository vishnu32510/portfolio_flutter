# Noviya & Vishnu — Traditional Tamil Wedding E-Invite

**வாழ்க வளமுடன் (Vaazhga Valamudan)**

Single-page wedding RSVP e-invite built with **React**, **Tailwind CSS**, and **Framer Motion** for the traditional Tamil Hindu wedding (*Muhurtham*) of **Noviya Balasubramaniyan** & **Vishnu Priyan** on **Sunday, December 13, 2026** at **Sri Venkateswara Temple (Balaji Mandir), Bridgewater, NJ**.

## Quick Start

```bash
npm install
npm run dev
```

## Customizing Wedding Details

All couple, family, astrological (*Natchatram* & *Rasi*), and ceremony details live in [`src/data/weddingConfig.js`](./src/data/weddingConfig.js):

- **Update the Bride's Parents' Names**: Fill in `bride.parents.father` and `bride.parents.mother` in `src/data/weddingConfig.js` and both the welcoming invitation paragraph and the Bride's blessing card will update automatically.
- **Connect Cloud RSVP Storage (Optional)**: Set `VITE_RSVP_WEBHOOK_URL` in a `.env` file (for example, pointing to a Google Apps Script Web App or Formspree endpoint) to forward RSVP JSON submissions to Google Sheets or email in addition to browser persistence.
