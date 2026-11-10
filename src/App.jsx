import { MotionConfig, motion, useScroll, useSpring } from 'framer-motion'
import { EventDetailsSection } from './components/EventDetailsSection'
import { FooterSection } from './components/FooterSection'
import { HeroSection } from './components/HeroSection'
import { IntroductionSection } from './components/IntroductionSection'
import { RsvpSection } from './components/RsvpSection'

export default function App() {
  const { scrollYProgress } = useScroll()
  const scaleX = useSpring(scrollYProgress, {
    stiffness: 120,
    damping: 28,
    restDelta: 0.001,
  })

  return (
    <MotionConfig reducedMotion="user">
      {/* Accessible Skip Link */}
      <a
        href="#introduction"
        className="visually-hidden focus:not-sr-only focus:fixed focus:top-4 focus:left-4 focus:z-50 focus:rounded-full focus:bg-turmeric-400 focus:px-5 focus:py-2.5 focus:text-sm focus:font-semibold focus:text-maroon-950 focus:shadow-lg"
      >
        Skip to invitation details
      </a>

      {/* Subtle Antique Gold Zari Scroll Progress Hairline */}
      <motion.div
        aria-hidden="true"
        style={{ scaleX, transformOrigin: '0%' }}
        className="fixed top-0 left-0 right-0 z-50 h-[3px] bg-gradient-to-r from-gold-500 via-turmeric-400 to-gold-300"
      />

      <div className="min-h-dvh flex flex-col bg-maroon-950">
        <HeroSection />
        <main className="flex-1">
          <IntroductionSection />
          <EventDetailsSection />
          <RsvpSection />
        </main>
        <FooterSection />
      </div>
    </MotionConfig>
  )
}
