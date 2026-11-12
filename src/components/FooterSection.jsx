import { motion } from 'framer-motion'
import { ArrowUp } from 'lucide-react'
import { WEDDING_CONFIG } from '../data/weddingConfig'
import { PulliKolamMandala, ZariLotusDivider } from './TraditionalMotifs'

export function FooterSection() {
  return (
    <footer className="print-page-footer relative overflow-hidden bg-maroon-950 text-turmeric-100 pt-16 pb-12 sm:pt-20 sm:pb-16 border-t border-gold-400/30">
      <div
        className="zari-temple-border-bottom absolute top-0 left-0 right-0 h-3 w-full"
        aria-hidden="true"
      />

      <div className="relative z-10 mx-auto max-w-3xl safe-inline-pad text-center flex flex-col items-center">
        {/* Traditional Pulli Kolam Icon */}
        <motion.div
          initial={{ opacity: 0, scale: 0.9 }}
          whileInView={{ opacity: 1, scale: 1 }}
          viewport={{ once: true, amount: 0.4 }}
          transition={{ duration: 0.8, ease: [0.22, 1, 0.36, 1] }}
          className="mb-5 rounded-full border border-gold-400/60 print:border-[#D4AF37] ring-1 ring-gold-400/25 ring-offset-2 ring-offset-maroon-950 print:ring-0 bg-maroon-900/70 print:bg-transparent p-4 overflow-hidden"
        >
          <PulliKolamMandala className="w-16 h-16 sm:w-20 sm:h-20 text-turmeric-300" />
        </motion.div>

        <p lang="ta" className="tamil-blessing-text text-turmeric-300 font-semibold">
          {WEDDING_CONFIG.greeting.tamil}
        </p>

        <div className="my-4 w-full">
          <ZariLotusDivider light />
        </div>

        <p className="text-base sm:text-lg text-turmeric-100/90 max-w-lg leading-relaxed">
          Thank you for sharing in our joy and blessing our union with your love, prayers, and
          cherished presence.
        </p>

        <p className="mt-5 font-heading text-xl sm:text-2xl text-gold-shimmer">
          {WEDDING_CONFIG.bride.shortName}{' '}
          <span className="italic font-normal text-[0.82em] text-turmeric-300">weds</span>{' '}
          {WEDDING_CONFIG.groom.shortName}
        </p>
        <p className="mt-1 text-xs uppercase tracking-[0.26em] text-gold-300/75">
          {WEDDING_CONFIG.event.shortDate} • Hillsborough Township, New Jersey
        </p>

        <a
          href="#"
          aria-label="Back to top of invitation"
          className="no-print mt-8 inline-flex items-center gap-1.5 rounded-full border border-gold-400/35 bg-maroon-900/60 px-4 py-2 text-xs uppercase tracking-[0.2em] text-gold-200/85 hover:text-turmeric-300 hover:border-turmeric-300/60 transition-colors"
        >
          <ArrowUp className="w-3.5 h-3.5" aria-hidden="true" />
          <span>Back to Top</span>
        </a>
      </div>
    </footer>
  )
}

