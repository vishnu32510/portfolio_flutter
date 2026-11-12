import { useRef } from 'react'
import { motion } from 'framer-motion'

export function EditorialStoryStack() {
  const videoRef = useRef(null)

  return (
    <section
      id="our-story"
      aria-label="The Proposal"
      className="relative min-h-[85vh] sm:min-h-screen w-full overflow-hidden flex items-center justify-center bg-[#16100C]"
    >
      {/* Background Video with Rich Warm Beige / Dark-Toned Film Contrast */}
      <div className="absolute inset-0 w-full h-full overflow-hidden">
        <video
          ref={videoRef}
          autoPlay
          loop
          muted
          playsInline
          poster="/videos/proposal-poster.jpg"
          className="w-full h-full object-cover object-center select-none will-change-transform sepia-[0.30] saturate-[0.90] brightness-[0.92] contrast-[1.05]"
        >
          <source src="/videos/proposal-moment.mp4" type="video/mp4" />
        </video>

        {/* Thin Warm Beige Tone Layer */}
        <div
          aria-hidden="true"
          className="pointer-events-none absolute inset-0 bg-[#E6D9C8]/35 mix-blend-multiply"
        />
        {/* Subtle cinematic edge vignette for rich dark-toned depth */}
        <div
          aria-hidden="true"
          className="pointer-events-none absolute inset-0 bg-gradient-to-b from-black/50 via-transparent to-black/60"
        />
      </div>

      {/* Whole written as "The Proposal" in dark-toned lettering */}
      <div className="relative z-20 w-full text-center px-4 select-none pointer-events-none my-auto">
        <motion.div
          initial={{ opacity: 0, scale: 0.96, y: -10 }}
          whileInView={{ opacity: 1, scale: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 0.9, ease: [0.16, 1, 0.3, 1] }}
          className="max-w-5xl mx-auto flex flex-col items-center justify-center"
        >
          {/* Dark-toned "The Proposal" - bold, stately, and legible over the beige film */}
          <h2 className="font-heading font-black text-4xl sm:text-6xl md:text-7xl lg:text-8xl tracking-[0.14em] sm:tracking-[0.18em] text-[#143D27] drop-shadow-[0_2px_16px_rgba(255,255,255,0.75)] select-none">
            The Proposal
          </h2>
        </motion.div>
      </div>
    </section>
  )
}
