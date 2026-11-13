import { useState, useEffect, useRef } from 'react'
import { motion } from 'framer-motion'
import { Sparkles } from 'lucide-react'
import { WEDDING_CONFIG } from '../data/weddingConfig'
import { SikkuBrahmaMudiKolam, ZariLotusDivider } from './TraditionalMotifs'

function computeCountdown(targetIso) {
  const diff = new Date(targetIso).getTime() - Date.now()
  if (diff <= 0) {
    return { days: 0, hours: 0, minutes: 0, seconds: 0 }
  }
  const days = Math.floor(diff / (1000 * 60 * 60 * 24))
  const hours = Math.floor((diff / (1000 * 60 * 60)) % 24)
  const minutes = Math.floor((diff / (1000 * 60)) % 60)
  const seconds = Math.floor((diff / 1000) % 60)
  return { days, hours, minutes, seconds }
}

export function EditorialJoinUs() {
  const sectionRef = useRef(null)
  const [countdown, setCountdown] = useState(() =>
    computeCountdown(WEDDING_CONFIG.event.muhurthamIsoStart)
  )

  const scrollToRsvp = (e) => {
    e.preventDefault()
    const el = document.getElementById('rsvp')
    if (el) {
      el.scrollIntoView({ behavior: 'smooth' })
      window.history.pushState(null, '', '#rsvp')
    }
  }

  useEffect(() => {
    const timer = setInterval(() => {
      setCountdown(computeCountdown(WEDDING_CONFIG.event.muhurthamIsoStart))
    }, 1000)
    return () => clearInterval(timer)
  }, [])

  return (
    <section
      ref={sectionRef}
      id="join-us"
      aria-label="Save the Date and Countdown"
      className="relative min-h-[100svh] w-full flex flex-col justify-center py-12 sm:py-16 px-4 bg-[#EBE2DB] text-[#143D27] overflow-hidden border-t border-[#C5A059]/30"
    >
      {/* Central Subtly Glowing Brahma Mudi Kolam in the Background */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 opacity-[0.26] sm:opacity-[0.30]"
      >
        <SikkuBrahmaMudiKolam
          glowing
          withGlide
          overdraw
          className="w-[30rem] h-[26rem] sm:w-[46rem] sm:h-[40rem]"
        />
      </div>

      <div className="relative z-10 mx-auto w-full max-w-4xl flex flex-col items-center text-center">
        {/* Overline */}
        <motion.p
          initial={{ opacity: 0, y: 15 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8 }}
          className="font-editorial text-xs sm:text-sm md:text-base uppercase tracking-[0.28em] text-[#7A5A18] font-medium mb-1 sm:mb-2"
        >
          Join us for our Big Day on
        </motion.p>

        {/* Huge Elegant Cursive: December 13, 2026 */}
        <motion.h2
          initial={{ opacity: 0, scale: 0.95 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true }}
          transition={{ duration: 0.9, delay: 0.1 }}
          className="font-cursive text-[2.35rem] min-[380px]:text-[2.75rem] sm:text-7xl md:text-8xl lg:text-9xl text-[#B83227] tracking-normal leading-tight py-2 sm:py-4 drop-shadow-[0_4px_16px_rgba(184,50,39,0.12)] select-none whitespace-nowrap"
        >
          December 13, 2026
        </motion.h2>

        {/* Lotus Divider */}
        <div className="my-3 sm:my-5 max-w-xs w-full">
          <ZariLotusDivider />
        </div>

        {/* Live Countdown Timer */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, delay: 0.3 }}
          className="mt-3 sm:mt-5 flex flex-nowrap items-center justify-center gap-1.5 sm:gap-3 md:gap-4 w-full max-w-sm sm:max-w-md md:max-w-xl mx-auto"
          role="timer"
          aria-label={`Countdown to Muhurtham: ${countdown.days} days, ${countdown.hours} hours, ${countdown.minutes} minutes, ${countdown.seconds} seconds`}
        >
          {[
            { label: 'Days', value: countdown.days },
            { label: 'Hours', value: countdown.hours },
            { label: 'Minutes', value: countdown.minutes },
            { label: 'Seconds', value: countdown.seconds },
          ].map((item, idx) => (
            <div key={item.label} className="flex-1 min-w-0 flex items-center gap-1.5 sm:gap-3 md:gap-4">
              <div className="w-full flex flex-col items-center justify-center rounded-2xl border border-[#C5A059]/40 bg-[#FAF6EE]/90 backdrop-blur-sm px-1.5 py-2.5 sm:px-4 sm:py-3.5 md:px-5 md:py-4 shadow-[0_8px_24px_rgba(140,106,20,0.08)]">
                <span className="font-editorial text-2xl sm:text-4xl md:text-5xl font-medium text-[#163E26] tracking-tight">
                  {String(item.value).padStart(2, '0')}
                </span>
                <span className="text-[0.52rem] sm:text-[0.65rem] md:text-xs uppercase tracking-[0.14em] sm:tracking-[0.22em] text-[#8C6A14] font-semibold mt-0.5 sm:mt-1">
                  {item.label}
                </span>
              </div>
              {idx < 3 && (
                <span className="text-xl sm:text-2xl text-[#8C6A14]/40 font-editorial select-none -mt-4 hidden sm:inline shrink-0">
                  :
                </span>
              )}
            </div>
          ))}
        </motion.div>

        {/* Direct RSVP Action Button */}
        <motion.div
          initial={{ opacity: 0, y: 15 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.8, delay: 0.45 }}
          className="mt-7 sm:mt-9"
        >
          <a
            href="#rsvp"
            onClick={scrollToRsvp}
            aria-label="RSVP for Noviya and Vishnu Priyan wedding"
            className="group inline-flex items-center gap-2.5 rounded-full border border-[#C5A059]/75 bg-[#163E26] hover:bg-[#1E5233] px-7 sm:px-9 py-2.5 sm:py-3 text-xs sm:text-sm font-semibold uppercase tracking-[0.22em] text-[#FAF6EE] shadow-[0_6px_22px_rgba(22,62,38,0.22)] hover:shadow-[0_10px_28px_rgba(22,62,38,0.32)] transition-all duration-300 hover:scale-[1.03] active:scale-[0.98] cursor-pointer select-none"
          >
            <Sparkles className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-[#C5A059] group-hover:rotate-12 transition-transform duration-300 shrink-0" aria-hidden="true" />
            <span>RSVP</span>
          </a>
        </motion.div>
      </div>
    </section>
  )
}

