import { useRef } from 'react'
import { motion, useScroll, useTransform } from 'framer-motion'
import { FallingRosePetals } from './FallingRosePetals'
import {
  KuthuvilakkuIcon,
  LampGlitters,
  ZariLotusDivider,
} from './TraditionalMotifs'

export function EditorialInvitation() {
  const sectionRef = useRef(null)

  // Track scroll through the invitation section:
  // - Entering from the first page: 'start end' to 'start start'
  // - Exiting to the photo stack: 'start start' to 'end start'
  const { scrollYProgress } = useScroll({
    target: sectionRef,
    offset: ['start end', 'end start'],
  })

  // Garlands are solid and stable when scrolling in from first page;
  // gently slide up and exit when scrolling down to the photo stack
  const garlandY = useTransform(scrollYProgress, [0.58, 0.85], [0, -140])
  const garlandOpacity = useTransform(scrollYProgress, [0.58, 0.85], [1, 0])

  // Bottom Mandapam decor stays grounded, gently fades when scrolling down
  const bottomDecorOpacity = useTransform(scrollYProgress, [0.58, 0.82], [1, 0])
  const bottomDecorY = useTransform(scrollYProgress, [0.58, 0.85], [0, 60])

  // Content is solid when entering, gently fades out and lifts when scrolling down to story stack
  const contentOpacity = useTransform(scrollYProgress, [0.55, 0.78], [1, 0])
  const contentY = useTransform(scrollYProgress, [0.55, 0.78], [0, -45])

  return (
    <section
      ref={sectionRef}
      id="invitation"
      aria-label="Wedding Invitation"
      className="relative min-h-dvh w-full flex flex-col justify-between overflow-hidden bg-[#EBE2DB] text-[#143D27] py-5 sm:py-7 border-t border-[#C5A059]/40 shadow-inner"
    >
      {/* 1. Top Garland & Toranam with Hanging Jasmine, Lotus Buds & Brass Lamps */}
      {/* Appears after scrolling the first page, and removes when scrolled down */}
      <motion.div
        style={{ y: garlandY, opacity: garlandOpacity }}
        className="pointer-events-none absolute top-0 left-0 right-0 z-10 flex justify-center overflow-hidden"
        aria-hidden="true"
      >
        <div className="relative w-full max-w-5xl h-[32vh] sm:h-[36vh] max-h-[340px] md:max-h-[270px] lg:max-h-[290px]">
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
        style={{ y: bottomDecorY, opacity: bottomDecorOpacity }}
        className="pointer-events-none absolute bottom-0 left-0 right-0 z-10 flex justify-center overflow-hidden"
        aria-hidden="true"
      >
        <div className="relative w-full max-w-5xl h-[20vh] sm:h-[22vh] md:h-[20vh] lg:h-[22vh] max-h-[195px] md:max-h-[210px]">
          <img
            src="/images/mandapam-bottom-decor.jpg"
            alt="Traditional brass elephant, pink lotus flowers and marble floor"
            className="w-full h-full object-cover object-bottom select-none"
            style={{
              maskImage: 'linear-gradient(to top, black 72%, transparent 100%)',
              WebkitMaskImage: 'linear-gradient(to top, black 72%, transparent 100%)',
            }}
          />
        </div>
      </motion.div>

      {/* Background Video: Traditional Mandapam with Hanging Jasmine & Lotus Buds (replaces Kolam) */}
      <div className="pointer-events-none absolute inset-0 z-0 overflow-hidden">
        <video
          autoPlay
          loop
          muted
          playsInline
          className="w-full h-full object-cover"
        >
          <source src="/videos/mandapam-jasmine-lotus.mp4" type="video/mp4" />
        </video>
        {/* Soft alabaster wash for high contrast & perfect text readability */}
        <div className="absolute inset-0 bg-[#EBE2DB]/80" />
      </div>

      {/* Gentle Falling Rose Petals Shower (sparse, slow snowfall drift) */}
      <motion.div style={{ opacity: contentOpacity }} className="pointer-events-none">
        <FallingRosePetals count={6} />
      </motion.div>

      {/* Top spacer below hanging garland */}
      <div className="relative z-10 w-full h-[6vh] sm:h-[8vh] shrink-0" aria-hidden="true" />

      {/* 3. Main Centerpiece Invitation Content Canvas - unified and centered */}
      <motion.div
        style={{ opacity: contentOpacity, y: contentY }}
        className="relative z-20 mx-auto flex w-full max-w-4xl flex-1 flex-col items-center justify-center px-4 sm:px-8 text-center pt-2 sm:pt-4"
      >
        {/* Top: Sacred Namaste Hands, then Auspicious Tamil Blessing */}
        <div className="flex flex-col items-center">
          {/* Sacred Namaste / Vanakkam Hands with Bangles & Roses */}
          <div className="mb-2 sm:mb-2.5 flex justify-center">
            <img
              src="/images/namaste-hands.png"
              alt="Sacred Vanakkam / Namaste hands adorned with wedding bangles and rose garland"
              className="w-16 h-auto sm:w-20 md:w-22 object-contain drop-shadow-[0_2px_8px_rgba(139,30,45,0.18)]"
            />
          </div>

          <div className="inline-flex items-center gap-2 sm:gap-3 z-20 text-center whitespace-nowrap">
            <KuthuvilakkuIcon className="w-3.5 h-5.5 sm:w-4.5 sm:h-6.5 shrink-0 text-[#8C6A14] drop-shadow-[0_1px_8px_rgba(255,255,255,0.95)]" />
            <div className="flex flex-col items-center">
              <span
                lang="ta"
                className="font-tamil text-base sm:text-lg md:text-xl lg:text-2xl text-[#163E26] font-bold tracking-wide drop-shadow-[0_1px_10px_rgba(255,255,255,0.95)]"
              >
                வாழ்க வளமுடன்
              </span>
              <span className="text-[0.62rem] sm:text-xs md:text-xs uppercase tracking-[0.28em] text-[#8C6A14] font-semibold drop-shadow-[0_1px_8px_rgba(255,255,255,0.85)] mt-0.5">
                Vaazhga Valamudan
              </span>
            </div>
            <KuthuvilakkuIcon className="w-3.5 h-5.5 sm:w-4.5 sm:h-6.5 shrink-0 text-[#8C6A14] drop-shadow-[0_1px_8px_rgba(255,255,255,0.95)]" />
          </div>
        </div>

        {/* Center: Overline and Noviya weds Vishnu Priyan */}
        <div className="mt-5 sm:mt-7 mb-2 py-1 flex flex-col items-center">
          {/* Overline */}
          <p className="font-editorial text-xs sm:text-sm md:text-base uppercase tracking-[0.20em] text-[#7A5A18] font-bold mb-3 sm:mb-4 max-w-2xl mx-auto whitespace-normal sm:whitespace-nowrap px-2">
            Together with our families, we invite you to celebrate as
          </p>

          {/* Couple's Names: Stacked at center */}
          <div className="py-1 flex flex-col items-center justify-center">
            <h2 className="font-editorial text-4xl sm:text-5xl md:text-5xl lg:text-6xl font-bold tracking-wide text-[#163E26] drop-shadow-[0_2px_14px_rgba(22,62,38,0.16)] whitespace-nowrap">
              Noviya
            </h2>

            <div className="my-2 sm:my-2.5 inline-flex items-center justify-center gap-2.5 font-cursive text-2xl sm:text-3xl text-[#B83227] font-bold drop-shadow-[0_2px_10px_rgba(184,50,39,0.18)]">
              <span className="h-px w-8 sm:w-10 bg-[#8C6A14]/40" />
              <span className="italic">weds</span>
              <span className="h-px w-8 sm:w-10 bg-[#8C6A14]/40" />
            </div>

            <h2 className="font-editorial text-4xl sm:text-5xl md:text-5xl lg:text-6xl font-bold tracking-wide text-[#163E26] drop-shadow-[0_2px_14px_rgba(22,62,38,0.16)] whitespace-nowrap">
              Vishnu Priyan
            </h2>

            {/* Grounding Antique Gold Zari Lotus Divider */}
            <div className="mt-5 sm:mt-7 w-full max-w-xs opacity-85">
              <ZariLotusDivider />
            </div>
          </div>
        </div>
      </motion.div>

      {/* Bottom spacer for vertical balance */}
      <div className="relative z-10 w-full pb-3 sm:pb-5" aria-hidden="true" />
    </section>
  )
}
