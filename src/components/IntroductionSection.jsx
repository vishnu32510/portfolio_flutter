import { motion } from 'framer-motion'
import { WEDDING_CONFIG, getBrideParentsDisplay } from '../data/weddingConfig'
import {
  BananaLeafMotif,
  CornerKolamFlourish,
  KuthuvilakkuIcon,
  PulliKolamMandala,
  ZariLotusDivider,
} from './TraditionalMotifs'

const revealProps = {
  initial: { opacity: 0, y: 28 },
  whileInView: { opacity: 1, y: 0 },
  viewport: { once: true, amount: 0.2 },
  transition: { duration: 0.8, ease: [0.22, 1, 0.36, 1] },
}

export function IntroductionSection() {
  const brideParentsProse = getBrideParentsDisplay('prose')
  const brideParentsCard = getBrideParentsDisplay('card')
  const { groom, bride } = WEDDING_CONFIG

  return (
    <section
      id="introduction"
      aria-labelledby="intro-heading"
      className="relative overflow-hidden bg-gradient-to-b from-turmeric-50 via-turmeric-100/65 to-turmeric-50 text-maroon-900 py-20 sm:py-28 2xl:py-36"
    >
      {/* Subtle Kolam & Banana Leaf background watermarks */}
      <PulliKolamMandala className="pointer-events-none absolute -top-24 -left-24 w-72 h-72 sm:w-96 sm:h-96 text-gold-500 opacity-[0.08]" />
      <PulliKolamMandala className="pointer-events-none absolute -bottom-24 -right-24 w-72 h-72 sm:w-96 sm:h-96 text-gold-500 opacity-[0.08]" />
      <BananaLeafMotif className="hidden lg:block absolute left-0 top-1/2 -translate-y-1/2 w-40 2xl:w-56 h-auto opacity-30" />
      <BananaLeafMotif
        flip
        className="hidden lg:block absolute right-0 top-1/2 -translate-y-1/2 w-40 2xl:w-56 h-auto opacity-30"
      />

      <div className="relative z-10 mx-auto max-w-4xl lg:max-w-5xl 2xl:max-w-6xl safe-inline-pad">
        {/* Welcoming Header & Blessing Paragraph */}
        <motion.div {...revealProps} className="text-center max-w-3xl mx-auto">
          <p className="text-xs sm:text-sm uppercase tracking-[0.28em] text-gold-600 font-semibold mb-2">
            An Auspicious Beginning • இரு மனம் இணையும் திருநாள்
          </p>
          <h2 id="intro-heading" className="section-heading font-normal text-maroon-900">
            With Divine Grace &amp; Parental Blessings
          </h2>

          <div className="my-5">
            <ZariLotusDivider />
          </div>

          <p className="text-base sm:text-lg md:text-xl leading-relaxed text-maroon-800/90 font-normal">
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

        {/* Container-Responsive Couple Lineage & Astrological Cards */}
        <div className="couple-cards-wrapper mt-14 sm:mt-16">
          <div className="couple-cards-grid">
            {/* Groom Card */}
            <motion.article
              initial={{ opacity: 0, y: 24 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, amount: 0.25 }}
              transition={{ duration: 0.75, delay: 0.08, ease: [0.22, 1, 0.36, 1] }}
              className="relative rounded-2xl border border-gold-400/50 bg-white/80 p-7 sm:p-9 shadow-[0_12px_36px_rgba(58,8,17,0.06)] flex flex-col justify-between text-center"
            >
              <CornerKolamFlourish className="absolute top-3 left-3 w-9 h-9" color="#B88F22" />
              <CornerKolamFlourish
                className="absolute top-3 right-3 w-9 h-9 -scale-x-100"
                color="#B88F22"
              />
              <CornerKolamFlourish
                className="absolute bottom-3 left-3 w-9 h-9 -scale-y-100"
                color="#B88F22"
              />
              <CornerKolamFlourish
                className="absolute bottom-3 right-3 w-9 h-9 scale-[-1]"
                color="#B88F22"
              />

              <div>
                <span className="inline-block text-xs uppercase tracking-[0.26em] text-gold-600 font-semibold">
                  மணமகன் • The Groom
                </span>
                <h3 className="mt-2.5 font-heading text-2xl sm:text-3xl text-maroon-900 font-medium">
                  {groom.fullName}
                </h3>
                <div className="mt-3 inline-flex flex-wrap items-center justify-center gap-2 rounded-full bg-turmeric-100/90 border border-gold-400/35 px-4 py-1 text-xs sm:text-sm text-maroon-800 font-medium">
                  <span>{groom.natchatram}</span>
                  <span className="text-gold-600" aria-hidden="true">
                    •
                  </span>
                  <span>{groom.rasi}</span>
                </div>
              </div>

              <div className="mt-6 pt-5 border-t border-gold-400/30">
                <p className="text-xs uppercase tracking-[0.2em] text-maroon-700/75 mb-1">
                  Son of
                </p>
                <p className="font-heading text-base sm:text-lg text-maroon-900">
                  {groom.parents.father} &amp; {groom.parents.mother}
                </p>
              </div>
            </motion.article>

            {/* Sacred Center Emblem */}
            <motion.div
              initial={{ opacity: 0, scale: 0.9 }}
              whileInView={{ opacity: 1, scale: 1 }}
              viewport={{ once: true, amount: 0.3 }}
              transition={{ duration: 0.65, delay: 0.16 }}
              className="flex flex-col items-center justify-center py-1"
              aria-hidden="true"
            >
              <div className="flex h-16 w-16 items-center justify-center rounded-full border-2 border-gold-400/60 bg-maroon-900 text-turmeric-300 shadow-[0_8px_24px_rgba(58,8,17,0.18)]">
                <KuthuvilakkuIcon className="w-7 h-9" />
              </div>
            </motion.div>

            {/* Bride Card */}
            <motion.article
              initial={{ opacity: 0, y: 24 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, amount: 0.25 }}
              transition={{ duration: 0.75, delay: 0.22, ease: [0.22, 1, 0.36, 1] }}
              className="relative rounded-2xl border border-gold-400/50 bg-white/80 p-7 sm:p-9 shadow-[0_12px_36px_rgba(58,8,17,0.06)] flex flex-col justify-between text-center"
            >
              <CornerKolamFlourish className="absolute top-3 left-3 w-9 h-9" color="#B88F22" />
              <CornerKolamFlourish
                className="absolute top-3 right-3 w-9 h-9 -scale-x-100"
                color="#B88F22"
              />
              <CornerKolamFlourish
                className="absolute bottom-3 left-3 w-9 h-9 -scale-y-100"
                color="#B88F22"
              />
              <CornerKolamFlourish
                className="absolute bottom-3 right-3 w-9 h-9 scale-[-1]"
                color="#B88F22"
              />

              <div>
                <span className="inline-block text-xs uppercase tracking-[0.26em] text-gold-600 font-semibold">
                  மணமகள் • The Bride
                </span>
                <h3 className="mt-2.5 font-heading text-2xl sm:text-3xl text-maroon-900 font-medium">
                  {bride.fullName}
                </h3>
                <div className="mt-3 inline-flex flex-wrap items-center justify-center gap-2 rounded-full bg-turmeric-100/90 border border-gold-400/35 px-4 py-1 text-xs sm:text-sm text-maroon-800 font-medium">
                  <span>{bride.natchatram}</span>
                  <span className="text-gold-600" aria-hidden="true">
                    •
                  </span>
                  <span>{bride.rasi}</span>
                </div>
              </div>

              <div className="mt-6 pt-5 border-t border-gold-400/30">
                <p className="text-xs uppercase tracking-[0.2em] text-maroon-700/75 mb-1">
                  Daughter of
                </p>
                <p className="font-heading text-base sm:text-lg text-maroon-900">
                  {brideParentsCard}
                </p>
              </div>
            </motion.article>
          </div>
        </div>
      </div>

      <div
        className="zari-temple-border-bottom absolute bottom-0 left-0 right-0 h-3 w-full"
        aria-hidden="true"
      />
    </section>
  )
}

