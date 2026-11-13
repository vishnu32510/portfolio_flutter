import { useState, useEffect } from 'react'
import { MotionConfig } from 'framer-motion'
import { EditorialHero } from './components/EditorialHero'
import { EditorialInvitation } from './components/EditorialInvitation'
import { EditorialJoinUs } from './components/EditorialJoinUs'
import { EditorialIntroduction } from './components/EditorialIntroduction'
import { EditorialEventDetails } from './components/EditorialEventDetails'
import { EditorialRsvp } from './components/EditorialRsvp'
import { EditorialFooter } from './components/EditorialFooter'
import { EditorialPrintableInvite } from './components/EditorialPrintableInvite'
import { EditorialRsvpExitModal } from './components/EditorialRsvpExitModal'

export default function App() {
  const [isPrintMode, setIsPrintMode] = useState(() => {
    if (typeof window === 'undefined') return false
    const params = new URLSearchParams(window.location.search)
    return params.get('print') === 'true' || window.location.hash === '#print'
  })

  useEffect(() => {
    const handlePopState = () => {
      const params = new URLSearchParams(window.location.search)
      setIsPrintMode(params.get('print') === 'true' || window.location.hash === '#print')
    }
    window.addEventListener('popstate', handlePopState)
    window.addEventListener('hashchange', handlePopState)
    return () => {
      window.removeEventListener('popstate', handlePopState)
      window.removeEventListener('hashchange', handlePopState)
    }
  }, [])

  if (isPrintMode) {
    return <EditorialPrintableInvite />
  }

  return (
    <MotionConfig reducedMotion="user">
      <div className="min-h-[100svh] flex flex-col bg-[#EBE2DB] text-[#143D27]">
        {/* Page 1: Candid B&W Cover with Alex Brush "Noviya & Vishnu" in beige at top, and "Scroll to enter" at bottom */}
        <EditorialHero />

        {/* Page 2: Kalyana Mandapam with New Background & Dynamic Garlands on scroll */}
        <EditorialInvitation />

        {/* Page 3: "Join us for our Big Day on" / "December 13, 2026" / Countdown Timer */}
        <EditorialJoinUs />

        {/* Page 4: Auspicious Beginning - Mandapam background, Garland & parent blessings */}
        <EditorialIntroduction />

        {/* Page 5: Wedding Ceremony Details & Agenda (Breakfast, Subha Muhurtham, Kalyana Virundhu) */}
        <EditorialEventDetails />

        {/* Page 6: RSVP Form matching the warm beige Mandapam theme */}
        <EditorialRsvp />

        {/* Page 7: Editorial Footer & Family Blessings */}
        <EditorialFooter />

        {/* Exit-Intent RSVP Prompt (Desktop Mouseleave & Mobile Back Navigation) */}
        <EditorialRsvpExitModal />
      </div>
    </MotionConfig>
  )
}

