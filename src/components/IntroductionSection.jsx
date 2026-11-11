import { useState } from 'react'
import { motion } from 'framer-motion'
import { Sparkles } from 'lucide-react'
import { WEDDING_CONFIG, getBrideParentsDisplay } from '../data/weddingConfig'
import {
  CornerKolamFlourish,
  KuthuvilakkuIcon,
  ZariLotusDivider,
} from './TraditionalMotifs'

const revealProps = {
  initial: { opacity: 0, y: 24 },
  whileInView: { opacity: 1, y: 0 },
  viewport: { once: true, amount: 0.15 },
  transition: { duration: 0.75, ease: [0.22, 1, 0.36, 1] },
}

const ARCH_ILLUSTRATION_MODES = [
  {
    id: 'embrace',
    label: 'Romantic Embrace',
    src: '/images/page2-arch-embrace-refined.jpg',
    alt: 'Watercolor illustration of Vishnu Priyan and Noviya looking into each other’s eyes inside a floral gold temple arch',
  },
  {
    id: 'front',
    label: 'Front Portrait',
    src: '/images/page2-arch-front-portrait.jpg',
    alt: 'Watercolor illustration of Vishnu Priyan and Noviya smiling together toward the camera inside a floral gold temple arch',
  },
  {
    id: 'kneeling',
    label: 'Kneeling Proposal',
    src: '/images/page2-arch-kneeling-proposal.jpg',
    alt: 'Watercolor illustration of Vishnu Priyan kneeling on one knee proposing to Noviya inside a floral gold temple arch',
  },
]

export function IntroductionSection() {
  const [archMode, setArchMode] = useState(() => {
    if (typeof window !== 'undefined') {
      const param = new URLSearchParams(window.location.search).get('style')
      if (param && ARCH_ILLUSTRATION_MODES.some((m) => m.id === param)) {
        return param
      }
    }
    return 'embrace'
  })
  const brideParentsProse = getBrideParentsDisplay('prose')
  const brideParentsCard = getBrideParentsDisplay('card')
  const { groom, bride } = WEDDING_CONFIG

  const isLocal =
    import.meta.env.DEV ||
    (typeof window !== 'undefined' &&
      (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'))

  const activeIllustration =
    ARCH_ILLUSTRATION_MODES.find((m) => m.id === archMode) || ARCH_ILLUSTRATION_MODES[0]

  return (
    <section
      id="introduction"
      aria-labelledby="intro-heading"
      className="print-page-intro relative overflow-hidden bg-gradient-to-b from-turmeric-50 via-turmeric-100/65 to-turmeric-50 text-maroon-900 py-14 sm:py-20 print:p-0"
    >
      {/* Local-only Illustration Style Switcher for debugging; hidden in production */}
      {isLocal && (
        <div className="no-print print:hidden relative z-20 mx-auto max-w-3xl safe-inline-pad mb-5 flex flex-wrap items-center justify-center gap-2">
          <span className="text-xs uppercase tracking-[0.2em] text-maroon-800/80 font-semibold mr-1 flex items-center gap-1.5">
            <Sparkles className="w-3.5 h-3.5 text-gold-600" aria-hidden="true" />
            <span>Couple Sketch Style:</span>
          </span>
          {ARCH_ILLUSTRATION_MODES.map((mode) => {
            const active = mode.id === archMode
            return (
              <button
                key={mode.id}
                type="button"
                onClick={() => setArchMode(mode.id)}
                aria-pressed={active}
                className={`rounded-full px-4 py-1.5 text-xs font-semibold tracking-wide transition-all cursor-pointer ${
                  active
                    ? 'bg-maroon-900 text-turmeric-200 border border-gold-400 shadow-sm'
                    : 'bg-white/80 text-maroon-800 border border-gold-400/40 hover:bg-turmeric-100/70'
                }`}
              >
                {mode.label}
              </button>
            )
          })}
        </div>
      )}

      {/* Floral Gold Temple Arch & Watercolor Couple Stage */}
      <div className="print-arch-stage relative z-10 mx-auto w-full max-w-[54rem] print:max-w-none overflow-hidden rounded-3xl print:rounded-none border border-gold-400/40 print:border-0 shadow-[0_24px_64px_rgba(58,8,17,0.14)] print:shadow-none bg-[#FBF1E6]">
        {/* Full-bleed Floral Arch & Compact Couple Illustration */}
        <img
          src={activeIllustration.src}
          alt={activeIllustration.alt}
          className="pointer-events-none select-none absolute inset-0 h-full w-full object-fill"
        />

        {/* Content Positioned Cleanly Inside the Upper Scalloped Gold Arch */}
        <div className="print-arch-content relative z-10 flex flex-col items-center justify-start text-center pt-[18%] sm:pt-[17.5%] pb-[66%] sm:pb-[64%] px-[18%] sm:px-[19%]">
          <motion.div {...revealProps} className="w-full max-w-md mx-auto">
            <h2
              id="intro-heading"
              lang="ta"
              className="font-tamil text-sm sm:text-base text-maroon-900 font-semibold tracking-wide"
            >
              இரு மனம் இணையும் திருநாள்
            </h2>
            <p className="text-[0.58rem] sm:text-[0.65rem] uppercase tracking-[0.24em] text-gold-600 font-semibold mt-0.5">
              An Auspicious Beginning
            </p>

            <div className="my-1.5 sm:my-2">
              <ZariLotusDivider />
            </div>

            <p className="text-[0.72rem] sm:text-[0.82rem] leading-snug sm:leading-relaxed text-maroon-800/95 font-normal">
              With hearts full of gratitude and joy, and with the warm blessings of our beloved
              parents —{' '}
              <strong className="font-semibold text-maroon-900">
                {groom.parents.father}
              </strong>
              ,{' '}
              <strong className="font-semibold text-maroon-900">
                {groom.parents.mother}
              </strong>
              , and{' '}
              <strong className="font-semibold text-maroon-900">
                {brideParentsProse}
              </strong>{' '}
              — we cordially invite our cherished family and friends to grace the sacred Tamil
              Hindu wedding ceremony of{' '}
              <span className="font-semibold text-maroon-900">{groom.shortName}</span> and{' '}
              <span className="font-semibold text-maroon-900">{bride.shortName}</span>, and shower
              them with your prayers and{' '}
              <span lang="ta" className="font-tamil text-maroon-900 font-medium">
                ஆசீர்வாதம்
              </span>{' '}
              (blessings) as they step into a lifetime of togetherness.
            </p>
          </motion.div>

          {/* Groom & Bride Lineage Cards Inside the Arch */}
          <div className="couple-cards-wrapper w-full mt-2.5 sm:mt-3.5">
            <div className="couple-cards-grid">
              {/* Groom Card */}
              <motion.article
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true, amount: 0.2 }}
                transition={{ duration: 0.7, delay: 0.08, ease: [0.22, 1, 0.36, 1] }}
                className="relative rounded-2xl border border-gold-400/55 bg-[#FFFDF8]/85 backdrop-blur-xs p-2.5 sm:p-3.5 shadow-[0_6px_20px_rgba(58,8,17,0.05)] flex flex-col justify-between text-center"
              >
                <CornerKolamFlourish className="absolute top-2 left-2 w-4 h-4" color="#B88F22" />
                <CornerKolamFlourish
                  className="absolute top-2 right-2 w-4 h-4 -scale-x-100"
                  color="#B88F22"
                />
                <CornerKolamFlourish
                  className="absolute bottom-2 left-2 w-4 h-4 -scale-y-100"
                  color="#B88F22"
                />
                <CornerKolamFlourish
                  className="absolute bottom-2 right-2 w-4 h-4 scale-[-1]"
                  color="#B88F22"
                />

                <div>
                  <span className="inline-block text-[0.58rem] uppercase tracking-[0.18em] text-gold-600 font-semibold">
                    மணமகன் • The Groom
                  </span>
                  <h3 className="mt-0.5 font-heading text-sm sm:text-base text-maroon-900 font-semibold leading-snug">
                    {groom.fullName}
                  </h3>
                </div>

                <div className="mt-2 pt-1.5 border-t border-gold-400/30">
                  <p className="text-[0.55rem] uppercase tracking-[0.16em] text-maroon-700/75 mb-0.5">
                    Son of
                  </p>
                  <p className="font-heading text-xs sm:text-[0.8rem] text-maroon-900 leading-snug">
                    {groom.parents.father} &amp; {groom.parents.mother}
                  </p>
                </div>
              </motion.article>

              {/* Sacred Center Emblem */}
              <motion.div
                initial={{ opacity: 0, scale: 0.9 }}
                whileInView={{ opacity: 1, scale: 1 }}
                viewport={{ once: true, amount: 0.3 }}
                transition={{ duration: 0.6, delay: 0.14 }}
                className="flex flex-col items-center justify-center py-0.5"
                aria-hidden="true"
              >
                <div className="flex h-9 w-9 sm:h-10 sm:w-10 items-center justify-center rounded-full border-2 border-gold-400/60 bg-maroon-900 text-turmeric-300 shadow-[0_6px_18px_rgba(58,8,17,0.18)]">
                  <KuthuvilakkuIcon className="w-4 h-5 sm:w-4 sm:h-6" />
                </div>
              </motion.div>

              {/* Bride Card */}
              <motion.article
                initial={{ opacity: 0, y: 20 }}
                whileInView={{ opacity: 1, y: 0 }}
                viewport={{ once: true, amount: 0.2 }}
                transition={{ duration: 0.7, delay: 0.2, ease: [0.22, 1, 0.36, 1] }}
                className="relative rounded-2xl border border-gold-400/55 bg-[#FFFDF8]/85 backdrop-blur-xs p-2.5 sm:p-3.5 shadow-[0_6px_20px_rgba(58,8,17,0.05)] flex flex-col justify-between text-center"
              >
                <CornerKolamFlourish className="absolute top-2 left-2 w-4 h-4" color="#B88F22" />
                <CornerKolamFlourish
                  className="absolute top-2 right-2 w-4 h-4 -scale-x-100"
                  color="#B88F22"
                />
                <CornerKolamFlourish
                  className="absolute bottom-2 left-2 w-4 h-4 -scale-y-100"
                  color="#B88F22"
                />
                <CornerKolamFlourish
                  className="absolute bottom-2 right-2 w-4 h-4 scale-[-1]"
                  color="#B88F22"
                />

                <div>
                  <span className="inline-block text-[0.58rem] uppercase tracking-[0.18em] text-gold-600 font-semibold">
                    மணமகள் • The Bride
                  </span>
                  <h3 className="mt-0.5 font-heading text-sm sm:text-base text-maroon-900 font-semibold leading-snug">
                    {bride.fullName}
                  </h3>
                </div>

                <div className="mt-2 pt-1.5 border-t border-gold-400/30 space-y-1">
                  <div>
                    <p className="text-[0.55rem] uppercase tracking-[0.16em] text-maroon-700/75">
                      Daughter of
                    </p>
                    <p className="font-heading text-xs sm:text-[0.8rem] text-maroon-900 leading-snug">
                      {brideParentsCard}
                    </p>
                  </div>
                  {bride.sister && (
                    <div className="pt-1 border-t border-gold-400/20">
                      <p className="text-[0.54rem] uppercase tracking-[0.16em] text-maroon-700/75">
                        Sister of
                      </p>
                      <p className="font-heading text-xs sm:text-[0.78rem] text-maroon-900 leading-snug">
                        {bride.sister}
                      </p>
                    </div>
                  )}
                </div>
              </motion.article>
            </div>
          </div>
        </div>
      </div>

      <div
        className="zari-temple-border-bottom no-print print:hidden absolute bottom-0 left-0 right-0 h-3 w-full"
        aria-hidden="true"
      />
    </section>
  )
}


