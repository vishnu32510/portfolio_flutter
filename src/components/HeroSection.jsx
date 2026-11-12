import { useEffect, useState } from 'react'
import { motion } from 'framer-motion'
import { ChevronDown, Printer, Sparkles } from 'lucide-react'
import { WEDDING_CONFIG } from '../data/weddingConfig'
import {
  BananaLeafMotif,
  HangingTempleBell,
  KuthuvilakkuIcon,
  MarigoldThoranam,
  PulliKolamMandala,
  ZariLotusDivider,
} from './TraditionalMotifs'

function computeCountdown(targetIso) {
  const diff = new Date(targetIso).getTime() - Date.now()
  if (diff <= 0) {
    return null
  }
  const days = Math.floor(diff / (1000 * 60 * 60 * 24))
  const hours = Math.floor((diff / (1000 * 60 * 60)) % 24)
  const minutes = Math.floor((diff / (1000 * 60)) % 60)
  const seconds = Math.floor((diff / 1000) % 60)
  return { days, hours, minutes, seconds }
}

const fadeUp = {
  hidden: { opacity: 0, y: 22 },
  visible: (delay = 0) => ({
    opacity: 1,
    y: 0,
    transition: { duration: 0.85, delay, ease: [0.22, 1, 0.36, 1] },
  }),
}

export function HeroSection() {
  const [countdown, setCountdown] = useState(() =>
    computeCountdown(WEDDING_CONFIG.event.muhurthamIsoStart),
  )

  const isLocal =
    import.meta.env.DEV ||
    (typeof window !== 'undefined' &&
      (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'))

  useEffect(() => {
    const timer = setInterval(() => {
      setCountdown(computeCountdown(WEDDING_CONFIG.event.muhurthamIsoStart))
    }, 1000)
    return () => clearInterval(timer)
  }, [])

  return (
    <header className="print-page-hero relative min-h-dvh flex flex-col justify-between overflow-hidden bg-gradient-to-b from-maroon-950 via-maroon-900 to-maroon-950 text-turmeric-50">
      {/* Subtle radial Kanchipuram silk & turmeric lamp glow (web only) */}
      <div
        className="no-print print:hidden pointer-events-none absolute inset-0"
        aria-hidden="true"
        style={{
          background:
            'radial-gradient(circle at 50% 42%, rgba(244, 184, 41, 0.14) 0%, rgba(107, 20, 35, 0.32) 38%, rgba(38, 5, 11, 0.92) 82%)',
        }}
      />

      {/* Slow-rotating giant Pulli Kolam Mandala watermark */}
      <motion.div
        aria-hidden="true"
        animate={{ rotate: 360 }}
        transition={{ duration: 140, repeat: Infinity, ease: 'linear' }}
        className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 opacity-[0.075]"
      >
        <PulliKolamMandala
          className="w-[30rem] h-[30rem] sm:w-[42rem] sm:h-[42rem] lg:w-[54rem] lg:h-[54rem] 2xl:w-[68rem] 2xl:h-[68rem] text-gold-300"
        />
      </motion.div>

      {/* Subtle Banana Leaf silhouettes framing lower corners */}
      <BananaLeafMotif className="hidden sm:block absolute -left-8 bottom-0 w-36 md:w-48 2xl:w-64 h-auto opacity-35" />
      <BananaLeafMotif
        flip
        className="hidden sm:block absolute -right-8 bottom-0 w-36 md:w-48 2xl:w-64 h-auto opacity-35"
      />

      {/* Vertical Zari silk border rails on wide & 4K screens */}
      <div
        aria-hidden="true"
        className="hidden xl:block pointer-events-none absolute inset-y-0 left-6 2xl:left-12 w-px bg-gradient-to-b from-transparent via-gold-400/35 to-transparent"
      />
      <div
        aria-hidden="true"
        className="hidden xl:block pointer-events-none absolute inset-y-0 right-6 2xl:right-12 w-px bg-gradient-to-b from-transparent via-gold-400/35 to-transparent"
      />

      {/* Top Marigold Garland (Thoranam) + Hanging Brass Temple Bells */}
      <div className="relative z-10 w-full">
        <MarigoldThoranam />
        <div className="pointer-events-none mx-auto max-w-7xl 2xl:max-w-[96rem] relative">
          <HangingTempleBell
            chainLength={42}
            delay={0}
            className="absolute left-3 sm:left-10 lg:left-16 -top-3 w-9 sm:w-12 md:w-14 h-28 sm:h-36"
          />
          <HangingTempleBell
            chainLength={64}
            delay={1.1}
            className="hidden md:block absolute left-28 lg:left-36 -top-3 w-10 h-40 opacity-90"
          />
          <HangingTempleBell
            chainLength={64}
            delay={0.6}
            className="hidden md:block absolute right-28 lg:right-36 -top-3 w-10 h-40 opacity-90"
          />
          <HangingTempleBell
            chainLength={42}
            delay={1.7}
            className="absolute right-3 sm:right-10 lg:right-16 -top-3 w-9 sm:w-12 md:w-14 h-28 sm:h-36"
          />
        </div>
      </div>

      {/* Main Hero Centerpiece */}
      <div className="relative z-10 mx-auto flex w-full max-w-5xl 2xl:max-w-6xl flex-1 flex-col items-center justify-center safe-inline-pad py-8 sm:py-12 text-center">
        {/* Prominent Auspicious Tamil Greeting: வாழ்க வளமுடன் */}
        <motion.div
          variants={fadeUp}
          initial="hidden"
          animate="visible"
          custom={0.05}
          className="mb-6 sm:mb-8 inline-flex flex-col items-center"
        >
          <div className="inline-flex items-center gap-3 sm:gap-4 rounded-full border border-gold-400/60 print:border-[#D4AF37] ring-1 ring-gold-400/25 ring-offset-2 ring-offset-maroon-950 print:ring-0 bg-maroon-950/70 print:bg-transparent px-5 py-2 sm:px-7 sm:py-2.5 overflow-hidden">
            <KuthuvilakkuIcon className="w-5 h-7 sm:w-6 sm:h-8 shrink-0" />
            <div className="flex flex-col items-center">
              <span
                lang="ta"
                className="tamil-blessing-text font-semibold tracking-wide text-turmeric-300"
              >
                {WEDDING_CONFIG.greeting.tamil}
              </span>
              <span className="text-[0.7rem] sm:text-xs uppercase tracking-[0.26em] text-gold-200/85 font-medium">
                {WEDDING_CONFIG.greeting.transliteration}
              </span>
            </div>
            <KuthuvilakkuIcon className="w-5 h-7 sm:w-6 sm:h-8 shrink-0" />
          </div>
        </motion.div>

        {/* Invitation Overline */}
        <motion.p
          variants={fadeUp}
          initial="hidden"
          animate="visible"
          custom={0.18}
          className="mb-3 text-xs sm:text-sm uppercase tracking-[0.32em] text-gold-300/90 font-medium"
        >
          Together with our families, we invite you to celebrate as
        </motion.p>

        {/* Couple's Names: Noviya / weds / Vishnu Priyan (stacked vertically) */}
        <motion.h1
          variants={fadeUp}
          initial="hidden"
          animate="visible"
          custom={0.3}
          className="hero-couple-title flex flex-col items-center font-normal tracking-tight py-1"
        >
          <span className="block text-gold-shimmer">{WEDDING_CONFIG.bride.shortName}</span>
          <span className="my-1.5 sm:my-2.5 inline-flex items-center gap-3 font-heading italic font-normal text-[0.44em] tracking-[0.1em] text-turmeric-400">
            <span
              aria-hidden="true"
              className="h-px w-7 sm:w-10 bg-gradient-to-r from-transparent to-gold-400/75"
            />
            <span>weds</span>
            <span
              aria-hidden="true"
              className="h-px w-7 sm:w-10 bg-gradient-to-l from-transparent to-gold-400/75"
            />
          </span>
          <span className="block text-gold-shimmer">{WEDDING_CONFIG.groom.shortName}</span>
        </motion.h1>

        <motion.div
          variants={fadeUp}
          initial="hidden"
          animate="visible"
          custom={0.42}
          className="my-6 sm:my-7 w-full"
        >
          <ZariLotusDivider light />
        </motion.div>

        {/* Wedding Date & Temple Badge */}
        <motion.div
          variants={fadeUp}
          initial="hidden"
          animate="visible"
          custom={0.58}
          className="flex flex-col items-center gap-2"
        >
          <p className="font-heading text-2xl sm:text-3xl md:text-4xl text-turmeric-100 tracking-wide">
            {WEDDING_CONFIG.event.shortDate}
          </p>
          <p className="text-sm sm:text-base text-gold-200/90 tracking-wider">
            Sunday • {WEDDING_CONFIG.event.venueName}, {WEDDING_CONFIG.event.cityState}
          </p>
        </motion.div>

        {/* Subtle Countdown Pills to Subha Muhurtham (Web only, hidden in PDF) */}
        {countdown && (
          <motion.div
            variants={fadeUp}
            initial="hidden"
            animate="visible"
            custom={0.68}
            aria-label={`Countdown to Muhurtham: ${countdown.days} days, ${countdown.hours} hours, ${countdown.minutes} minutes, and ${countdown.seconds} seconds`}
            className="no-print print:hidden mt-7 inline-flex items-center gap-2.5 sm:gap-4 md:gap-5 rounded-2xl border border-gold-400/25 bg-maroon-950/50 px-4 py-3 sm:px-5"
          >
            {[
              { label: 'Days', value: countdown.days },
              { label: 'Hours', value: countdown.hours },
              { label: 'Mins', value: countdown.minutes },
              { label: 'Secs', value: countdown.seconds },
            ].map((item, idx) => (
              <div key={item.label} className="flex items-center gap-2.5 sm:gap-4 md:gap-5">
                {idx > 0 && (
                  <span className="h-7 w-px bg-gold-400/25" aria-hidden="true" />
                )}
                <div className="text-center min-w-[2.8rem] sm:min-w-[3.1rem]">
                  <div className="font-heading text-lg sm:text-2xl font-semibold text-turmeric-300 tabular-nums">
                    {String(item.value).padStart(2, '0')}
                  </div>
                  <div className="text-[0.62rem] sm:text-[0.65rem] uppercase tracking-[0.18em] sm:tracking-[0.2em] text-gold-200/75">
                    {item.label}
                  </div>
                </div>
              </div>
            ))}
          </motion.div>
        )}

        {/* Quick Action Anchor Buttons (Web only, hidden in PDF) */}
        <motion.div
          variants={fadeUp}
          initial="hidden"
          animate="visible"
          custom={0.78}
          className="no-print mt-8 flex flex-wrap items-center justify-center gap-3.5 sm:gap-4"
        >
          <a
            href="#rsvp"
            className="inline-flex items-center justify-center gap-2 rounded-full bg-gradient-to-r from-turmeric-400 via-gold-400 to-turmeric-400 px-7 py-3.5 text-sm sm:text-base font-semibold text-maroon-950 shadow-[0_8px_28px_rgba(244,184,41,0.28)] transition-transform duration-200 hover:scale-[1.02] active:scale-[0.99]"
          >
            <Sparkles className="w-4 h-4" aria-hidden="true" />
            <span>RSVP Now</span>
          </a>
          <a
            href="#event-details"
            className="inline-flex items-center justify-center rounded-full border border-gold-400/50 bg-maroon-900/50 px-6 py-3.5 text-sm sm:text-base font-medium text-turmeric-100 transition-colors duration-200 hover:bg-gold-400/15 hover:border-gold-300"
          >
            View Muhurtham Details
          </a>
          {isLocal && (
            <button
              type="button"
              onClick={() => window.print()}
              className="inline-flex items-center justify-center gap-2 rounded-full border border-gold-400/50 bg-maroon-950/65 px-6 py-3.5 text-sm sm:text-base font-medium text-gold-200 transition-colors duration-200 hover:bg-gold-400/15 hover:border-turmeric-300 cursor-pointer"
            >
              <Printer className="w-4 h-4 text-turmeric-300" aria-hidden="true" />
              <span>Save as PDF</span>
            </button>
          )}
        </motion.div>
      </div>

      {/* Subtle Animated Scroll-Down Indicator */}
      <div className="relative z-10 pb-5 sm:pb-7 flex flex-col items-center">
        <a
          href="#introduction"
          aria-label="Scroll down to read our wedding invitation"
          className="no-print group inline-flex flex-col items-center gap-1.5 px-4 py-2 text-gold-200/80 hover:text-turmeric-300 transition-colors"
        >
          <span className="text-[0.68rem] uppercase tracking-[0.28em] font-medium">
            Scroll to Explore
          </span>
          <motion.span
            animate={{ y: [0, 6, 0] }}
            transition={{ duration: 2, repeat: Infinity, ease: 'easeInOut' }}
            className="inline-flex h-9 w-9 items-center justify-center rounded-full border border-gold-400/40 bg-maroon-950/60 group-hover:border-turmeric-300/80"
          >
            <ChevronDown className="w-4 h-4" aria-hidden="true" />
          </motion.span>
        </a>
        <div className="zari-temple-border-top h-3 w-full mt-2" aria-hidden="true" />
      </div>
    </header>
  )
}

