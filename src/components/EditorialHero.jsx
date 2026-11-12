import { useRef } from 'react'
import { motion, useScroll, useTransform } from 'framer-motion'
import { ChevronDown } from 'lucide-react'

export function EditorialHero() {
  const containerRef = useRef(null)
  const { scrollY } = useScroll()

  // Graceful parallax & soft fade (no harsh black cut)
  const photoY = useTransform(scrollY, [0, 600], [0, 70])
  const photoScale = useTransform(scrollY, [0, 600], [1.01, 1.04])
  const titleY = useTransform(scrollY, [0, 350], [0, -45])
  const titleOpacity = useTransform(scrollY, [0, 280], [0.85, 0])
  const promptOpacity = useTransform(scrollY, [0, 120], [1, 0])

  const scrollToInvitation = (e) => {
    e.preventDefault()
    document.getElementById('invitation')?.scrollIntoView({ behavior: 'smooth' })
  }

  return (
    <header
      ref={containerRef}
      className="relative min-h-[100svh] h-[100svh] w-full flex flex-col justify-between overflow-hidden bg-[#0A0705] text-[#FAF8F5]"
    >
      {/* Background Candid Black & White Photograph */}
      <motion.div
        style={{ y: photoY, scale: photoScale }}
        className="absolute inset-0 z-0 overflow-hidden will-change-transform"
        aria-hidden="true"
      >
        <img
          src="/images/noviya-vishnu-candid-bw.jpg"
          alt="Noviya and Vishnu running hand in hand in sunlight along a tree-lined path"
          className="h-full w-full object-cover object-[center_30%]"
        />

        {/* Soft Contrast & Tonal Wash (replaces expensive CSS filter for 120fps hardware acceleration) */}
        <div className="absolute inset-0 bg-black/15 pointer-events-none" />

        {/* Ambient Top Vignette for Lettering Contrast */}
        <div className="absolute inset-0 bg-gradient-to-t from-transparent via-[#0A0705]/20 to-[#0A0705]/55" />
      </motion.div>

      {/* Seamless Transition Gradient from Black (#0A0705) to Beige (#EBE2DB) to enter Page 2 smoothly */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute bottom-0 left-0 right-0 h-56 sm:h-72 z-[5] bg-gradient-to-b from-transparent via-[#0A0705]/65 via-50% to-[#EBE2DB]"
      />

      {/* Top spacing spacer */}
      <div className="relative z-10 w-full pt-12 sm:pt-16" aria-hidden="true" />

      {/* Main Centerpiece: Refined, slightly smaller & semi-translucent Alex Brush Cursive "Noviya & Vishnu" */}
      <motion.div
        style={{ opacity: titleOpacity, y: titleY }}
        className="relative z-10 mx-auto flex w-full max-w-5xl flex-1 flex-col items-center justify-start pt-8 sm:pt-14 md:pt-18 px-4 sm:px-6 text-center"
      >
        <div className="relative py-2 px-1 max-w-full">
          <h1 className="font-alex text-[2.35rem] xs:text-4xl sm:text-5xl md:text-6xl lg:text-[4.75rem] xl:text-[5.25rem] font-normal leading-none tracking-wide text-[#F3EBD8]/85 drop-shadow-[0_2px_18px_rgba(0,0,0,0.65)] whitespace-nowrap select-none">
            Noviya &amp; Vishnu
          </h1>

          {/* Under-glow ambient highlight for soft warm radiance */}
          <div
            className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 h-20 w-48 sm:w-[26rem] rounded-full blur-2xl opacity-20"
            style={{
              background: 'radial-gradient(circle, rgba(243, 235, 216, 0.4) 0%, transparent 70%)',
            }}
          />
        </div>
      </motion.div>

      {/* Bottom Editorial Scroll Prompt */}
      <motion.div
        style={{ opacity: promptOpacity }}
        className="relative z-10 pb-8 sm:pb-10 flex flex-col items-center"
      >
        <a
          href="#invitation"
          onClick={scrollToInvitation}
          aria-label="Scroll to enter"
          className="group inline-flex flex-col items-center gap-1.5 text-[#F3EBD8]/75 hover:text-[#FFFDF8] transition-colors cursor-pointer"
        >
          <span className="text-[0.62rem] sm:text-[0.68rem] tracking-[0.32em] uppercase font-medium drop-shadow-[0_1px_8px_rgba(0,0,0,0.85)]">
            Scroll to enter
          </span>
          <motion.div
            animate={{ y: [0, 4, 0] }}
            transition={{ duration: 2.2, repeat: Infinity, ease: 'easeInOut' }}
          >
            <ChevronDown className="w-3.5 h-3.5 text-[#F3EBD8]/80 drop-shadow-[0_1px_4px_rgba(0,0,0,0.8)]" aria-hidden="true" />
          </motion.div>
        </a>
      </motion.div>
    </header>
  )
}
