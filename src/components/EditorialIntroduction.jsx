import { useRef } from 'react'
import { motion, useScroll, useTransform } from 'framer-motion'
import { WEDDING_CONFIG } from '../data/weddingConfig'
import {
  CornerKolamFlourish,
  KuthuvilakkuIcon,
  LampGlitters,
  SikkuBrahmaMudiKolam,
  ZariLotusDivider,
} from './TraditionalMotifs'

export function EditorialIntroduction() {
  const sectionRef = useRef(null)
  const { groom, bride } = WEDDING_CONFIG

  // Track scroll through the introduction section
  const { scrollYProgress } = useScroll({
    target: sectionRef,
    offset: ['start end', 'end start'],
  })

  // Garlands appear on scroll into this page, and remove when scrolled down to Muhurtham details
  const garlandY = useTransform(scrollYProgress, [0.05, 0.28, 0.68, 0.92], [-120, 0, 0, -140])
  const garlandOpacity = useTransform(scrollYProgress, [0.05, 0.28, 0.68, 0.92], [0, 1, 1, 0])

  // Bottom Mandapam decor gently fades as you leave towards event details
  const bottomDecorOpacity = useTransform(scrollYProgress, [0.05, 0.25, 0.70, 0.92], [0, 1, 1, 0])

  return (
    <section
      ref={sectionRef}
      id="introduction"
      aria-labelledby="intro-heading"
      className="relative min-h-dvh flex flex-col justify-center overflow-hidden bg-[#EBE2DB] text-[#143D27] py-12 sm:py-16 md:py-20 border-t border-[#C5A059]/30"
    >
      {/* 1. Top Garland & Toranam with Hanging Jasmine, Lotus Buds & Brass Lamps */}
      {/* Appears after scrolling from story stack, and removes when scrolled down to event details */}
      <motion.div
        style={{ y: garlandY, opacity: garlandOpacity }}
        className="pointer-events-none absolute top-0 left-0 right-0 z-10 flex justify-center overflow-hidden"
        aria-hidden="true"
      >
        <div className="relative w-full max-w-5xl h-[34vh] sm:h-[40vh] max-h-[380px]">
          <img
            src="/images/mandapam-top-garland.jpg"
            alt="Traditional floral garland with jasmine and hanging brass lamps"
            className="w-full h-full object-cover object-top select-none"
            style={{
              maskImage: 'linear-gradient(to bottom, black 75%, transparent 100%)',
              WebkitMaskImage: 'linear-gradient(to bottom, black 75%, transparent 100%)',
            }}
          />
          {/* Small shiny lights / glittering sparkles on the hanging brass lamps */}
          <LampGlitters />
        </div>
      </motion.div>

      {/* 2. Bottom Mandapam Decor (Brass Elephant on Stool, Lotus Bowls, Marble Floor) */}
      <motion.div
        style={{ opacity: bottomDecorOpacity }}
        className="pointer-events-none absolute bottom-0 left-0 right-0 z-0 flex justify-center overflow-hidden"
        aria-hidden="true"
      >
        <img
          src="/images/mandapam-bottom-decor.jpg"
          alt="Traditional brass elephant, pink lotus flowers and marble floor"
          className="w-full max-w-5xl h-[24vh] sm:h-[30vh] max-h-[300px] object-cover object-bottom select-none"
          style={{
            maskImage: 'linear-gradient(to top, black 70%, transparent 100%)',
            WebkitMaskImage: 'linear-gradient(to top, black 70%, transparent 100%)',
          }}
        />
      </motion.div>

      {/* Authentic Tamil Brahma Mudi / Sikku Kolam (5-to-1 diamond) with overlaid drawing & golden shimmer animation */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 opacity-[0.16] sm:opacity-[0.18]"
      >
        <SikkuBrahmaMudiKolam className="w-[32rem] h-[28rem] sm:w-[44rem] sm:h-[38rem] text-[#8C6A14]" />
      </div>

      <div className="relative z-20 mx-auto w-full max-w-4xl px-4 sm:px-8 safe-inline-pad">
        {/* Regal Auspicious Beginning Framed Alabaster Canvas (Centered, Text-only, No couple photo) */}
        <div className="relative mx-auto w-full rounded-3xl border border-[#C5A059]/50 bg-[#E6D9C8]/95 backdrop-blur-md text-[#143D27] p-6 sm:p-8 md:p-10 shadow-[0_20px_50px_rgba(20,61,39,0.14)] overflow-hidden">
          {/* Ornate Gold Corner Flourishes */}
          <CornerKolamFlourish className="absolute top-3.5 left-3.5 sm:top-5 sm:left-5 w-7 h-7 sm:w-9 sm:h-9" color="#8C6A14" />
          <CornerKolamFlourish
            className="absolute top-3.5 right-3.5 sm:top-5 sm:right-5 w-7 h-7 sm:w-9 sm:h-9 -scale-x-100"
            color="#8C6A14"
          />
          <CornerKolamFlourish
            className="absolute bottom-3.5 left-3.5 sm:bottom-5 sm:left-5 w-7 h-7 sm:w-9 sm:h-9 -scale-y-100"
            color="#8C6A14"
          />
          <CornerKolamFlourish
            className="absolute bottom-3.5 right-3.5 sm:bottom-5 sm:right-5 w-7 h-7 sm:w-9 sm:h-9 scale-[-1]"
            color="#8C6A14"
          />

          {/* Title Header: இரு மனம் இணையும் திருநாள் • An Auspicious Beginning */}
          <div className="text-center max-w-4xl mx-auto pb-3">
            <h2
              id="intro-heading"
              lang="ta"
              className="font-tamil text-sm sm:text-base md:text-lg text-[#163E26] font-bold tracking-wide"
            >
              இரு மனம் இணையும் திருநாள்
            </h2>
            <p className="font-editorial text-xs sm:text-sm italic uppercase tracking-[0.24em] text-[#8C6A14] font-semibold mt-1">
              An Auspicious Beginning
            </p>

            <div className="my-3 sm:my-4 max-w-xs mx-auto">
              <ZariLotusDivider />
            </div>

            {/* Formal Invitation Prose - Single continuous paragraph */}
            <p className="font-editorial text-sm sm:text-base md:text-[0.95rem] lg:text-base leading-relaxed md:leading-relaxed text-[#143D27]/95 font-normal text-center max-w-2xl sm:max-w-3xl mx-auto">
              Moments become memories because of the people we share them with. With the warm blessings of our loving parents, we cordially invite you to grace our wedding ceremony, and shower us with your prayers and{' '}
              <span lang="ta" className="font-tamil text-[#163E26] font-semibold">
                ஆசீர்வாதம்
              </span>{' '}
              (Blessings) as we step into a lifetime of togetherness.
            </p>
          </div>

          {/* Side by Side Lineage Cards: The Groom & The Bride */}
          <div className="relative mt-9 sm:mt-10 pt-5 border-t border-[#C5A059]/30 w-full max-w-3xl mx-auto">
            <div className="relative grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-8 lg:gap-10 items-stretch">
              {/* Desktop Sacred Nuptial Knot Overlay exactly in the middle between the two cards */}
              <div
                aria-hidden="true"
                className="hidden md:flex absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-20 pointer-events-none items-center justify-center w-28 lg:w-32"
              >
                <img
                  src="/images/sacred-wedding-knot-reversed.png"
                  alt="Sacred Nuptial Knot tying Groom and Bride"
                  className="w-full h-auto object-contain drop-shadow-[0_10px_24px_rgba(40,15,5,0.30)]"
                />
              </div>

              {/* The Groom Card */}
              <div className="w-full rounded-2xl border border-[#C5A059]/35 bg-[#FAF6EE]/85 px-4 sm:px-5 pb-5 pt-6 sm:pt-7 text-center shadow-sm flex flex-col justify-between">
                <div>
                  <span className="inline-block text-[0.6rem] sm:text-[0.68rem] uppercase tracking-[0.26em] text-[#8C6A14] font-semibold mb-1">
                    <span lang="ta" className="font-tamil mr-1">மணமகன்</span> • The Groom
                  </span>
                  <h3 className="font-editorial text-lg sm:text-xl text-[#163E26] font-normal tracking-wide leading-snug">
                    <span className="block whitespace-nowrap">Vishnu Priyan</span>
                    <span className="block whitespace-nowrap mt-0.5">Sellam Shanmugavel</span>
                  </h3>
                  <div className="my-2 flex items-center justify-center gap-2">
                    <span className="h-px w-7 bg-[#8C6A14]/30" />
                    <span className="text-[0.56rem] uppercase tracking-[0.22em] text-[#8C6A14] font-medium">Son of</span>
                    <span className="h-px w-7 bg-[#8C6A14]/30" />
                  </div>
                  <div className="font-editorial text-sm sm:text-base text-[#143D27] font-medium leading-snug">
                    <span className="block whitespace-nowrap">Shanmugavel Sellamuthu</span>
                    <span className="block text-xs text-[#8C6A14] font-normal my-0.5">&amp;</span>
                    <span className="block whitespace-nowrap">Jothikanmani Duraisamy</span>
                  </div>
                </div>
              </div>

              {/* Mobile Sacred Knot: Same horizontal orientation as desktop (white on left, red saree on right) */}
              <div
                aria-hidden="true"
                className="md:hidden my-2.5 z-20 flex items-center justify-center pointer-events-none"
              >
                <img
                  src="/images/sacred-wedding-knot-reversed.png"
                  alt="Sacred Nuptial Knot tying Groom and Bride"
                  className="w-24 sm:w-28 h-auto object-contain drop-shadow-[0_8px_20px_rgba(40,15,5,0.30)]"
                />
              </div>

              {/* The Bride Card */}
              <div className="w-full rounded-2xl border border-[#C5A059]/35 bg-[#FAF6EE]/85 px-4 sm:px-5 pb-5 pt-6 sm:pt-7 text-center shadow-sm flex flex-col justify-between">
                <div>
                  <span className="inline-block text-[0.6rem] sm:text-[0.68rem] uppercase tracking-[0.26em] text-[#8C6A14] font-semibold mb-1">
                    <span lang="ta" className="font-tamil mr-1">மணமகள்</span> • The Bride
                  </span>
                  <h3 className="font-editorial text-lg sm:text-xl text-[#163E26] font-normal tracking-wide leading-snug">
                    <span className="block whitespace-nowrap">Noviya</span>
                    <span className="block whitespace-nowrap mt-0.5">Balasubramanian</span>
                  </h3>
                  <div className="my-2 flex items-center justify-center gap-2">
                    <span className="h-px w-7 bg-[#8C6A14]/30" />
                    <span className="text-[0.56rem] uppercase tracking-[0.22em] text-[#8C6A14] font-medium">Daughter of</span>
                    <span className="h-px w-7 bg-[#8C6A14]/30" />
                  </div>
                  <div className="font-editorial text-sm sm:text-base text-[#143D27] font-medium leading-snug">
                    <span className="block whitespace-nowrap">Balasubramanian Velu</span>
                    <span className="block text-xs text-[#8C6A14] font-normal my-0.5">&amp;</span>
                    <span className="block whitespace-nowrap">Muthulakshmi Subbiah</span>
                  </div>
                </div>
                <div className="mt-2.5 pt-2 border-t border-[#C5A059]/20">
                  <span className="text-[0.56rem] uppercase tracking-[0.22em] text-[#8C6A14] font-medium block">
                    Sister of
                  </span>
                  <p className="font-editorial text-xs sm:text-sm text-[#143D27] font-medium mt-0.5">
                    Janashruthi Balasubramanian
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}
