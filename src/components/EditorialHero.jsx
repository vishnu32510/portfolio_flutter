import { useEffect, useRef } from 'react'
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

  // Single-scroll gesture: On one scroll down from the first page, glide and land squarely on the invitation page.
  //
  // The glide is driven by our own requestAnimationFrame loop (instead of
  // scrollIntoView({ behavior: 'smooth' })) and all wheel / touch input is
  // swallowed while it runs. Previously the native trackpad/touch momentum kept
  // scrolling on top of the browser's smooth scroll, so the two fought each
  // other frame-by-frame, which showed up as jitter / flicker / overshoot.
  const glideRef = useRef({ active: false, rafId: 0, lastWheelAt: 0, justGlided: false })

  const glideToInvitation = () => {
    const target = document.getElementById('invitation')
    const state = glideRef.current
    if (!target || state.active) return

    const startY = window.scrollY
    const endY = startY + target.getBoundingClientRect().top
    const distance = endY - startY

    const prefersReducedMotion = window.matchMedia?.('(prefers-reduced-motion: reduce)').matches
    if (prefersReducedMotion || Math.abs(distance) < 2) {
      window.scrollTo({ top: endY, behavior: 'instant' })
      return
    }

    state.active = true
    const duration = 900
    const startTime = performance.now()
    // easeInOutCubic: gentle start, gentle landing
    const ease = (t) => (t < 0.5 ? 4 * t * t * t : 1 - Math.pow(-2 * t + 2, 3) / 2)

    const step = (now) => {
      const t = Math.min(1, (now - startTime) / duration)
      // behavior: 'instant' overrides the global `html { scroll-behavior: smooth }`,
      // otherwise every per-frame scrollTo would itself be smoothed and lag behind.
      window.scrollTo({ top: startY + distance * ease(t), behavior: 'instant' })
      if (t < 1) {
        state.rafId = requestAnimationFrame(step)
      } else {
        state.active = false
        state.rafId = 0
      }
    }
    state.rafId = requestAnimationFrame(step)
  }

  useEffect(() => {
    const state = glideRef.current
    const inHeroZone = () => window.scrollY < window.innerHeight * 0.45
    // Trackpads keep emitting momentum wheel events for a while after the
    // gesture; keep swallowing them until they stop so they don't carry the
    // page past the invitation once the glide lands.
    const MOMENTUM_QUIET_MS = 250

    const handleWheel = (e) => {
      const now = performance.now()
      const sinceLastWheel = now - state.lastWheelAt
      state.lastWheelAt = now

      if (state.active || (state.justGlided && sinceLastWheel < MOMENTUM_QUIET_MS)) {
        e.preventDefault()
        return
      }
      state.justGlided = false

      // If user is anywhere in the hero section and scrolls down, trigger full slide transition to invitation
      if (inHeroZone() && e.deltaY > 3) {
        e.preventDefault()
        state.justGlided = true
        glideToInvitation()
      }
    }

    let touchStartY = 0
    let touchStartX = 0
    const handleTouchStart = (e) => {
      if (e.touches.length === 1) {
        touchStartY = e.touches[0].clientY
        touchStartX = e.touches[0].clientX
      }
    }

    const handleTouchEnd = (e) => {
      if (state.active) return
      if (inHeroZone() && e.changedTouches.length === 1) {
        const touchEndY = e.changedTouches[0].clientY
        const touchEndX = e.changedTouches[0].clientX
        const deltaY = touchStartY - touchEndY
        const deltaX = Math.abs(touchStartX - touchEndX)

        // When user swipes up (scrolling down) predominantly vertically
        if (deltaY > 25 && deltaY > deltaX) {
          state.justGlided = true
          glideToInvitation()
        }
      }
    }

    window.addEventListener('wheel', handleWheel, { passive: false })
    window.addEventListener('touchstart', handleTouchStart, { passive: true })
    window.addEventListener('touchend', handleTouchEnd, { passive: true })
    return () => {
      window.removeEventListener('wheel', handleWheel)
      window.removeEventListener('touchstart', handleTouchStart)
      window.removeEventListener('touchend', handleTouchEnd)
      if (state.rafId) cancelAnimationFrame(state.rafId)
      state.active = false
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [])

  const scrollToInvitation = (e) => {
    e.preventDefault()
    glideToInvitation()
  }

  return (
    <header
      ref={containerRef}
      className="relative min-h-dvh w-full flex flex-col justify-between overflow-hidden bg-[#0A0705] text-[#FAF8F5]"
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
          className="h-full w-full object-cover object-[center_30%] filter contrast-[1.05] brightness-[0.88]"
        />

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
