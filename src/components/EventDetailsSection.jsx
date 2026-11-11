import { motion } from 'framer-motion'
import { Calendar, Clock, ExternalLink, MapPin, Sparkles, Utensils } from 'lucide-react'
import { WEDDING_CONFIG, downloadWeddingIcs } from '../data/weddingConfig'
import {
  CornerKolamFlourish,
  HangingTempleBell,
  PulliKolamMandala,
  ZariLotusDivider,
} from './TraditionalMotifs'

export function EventDetailsSection() {
  const { event } = WEDDING_CONFIG

  return (
    <section
      id="event-details"
      aria-labelledby="event-heading"
      className="print-page-event relative overflow-hidden bg-gradient-to-b from-maroon-950 via-maroon-900 to-maroon-950 text-turmeric-50 py-24 sm:py-32 2xl:py-40"
    >
      {/* Warm ambient turmeric & antique gold glows behind the glassmorphic card */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 h-[28rem] w-[28rem] sm:h-[36rem] sm:w-[44rem] rounded-full blur-3xl"
        style={{
          background:
            'radial-gradient(circle, rgba(244, 184, 41, 0.20) 0%, rgba(212, 175, 55, 0.10) 45%, transparent 75%)',
        }}
      />

      {/* Centered Kolam Mandala behind frosted glass */}
      <PulliKolamMandala className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 w-[26rem] h-[26rem] sm:w-[38rem] sm:h-[38rem] text-gold-300 opacity-[0.09]" />

      {/* Subtle flanking Temple Bells on larger viewports */}
      <div className="pointer-events-none mx-auto max-w-6xl 2xl:max-w-7xl relative">
        <HangingTempleBell
          chainLength={38}
          delay={0.4}
          className="hidden lg:block absolute left-6 -top-24 w-11 h-32 opacity-80"
        />
        <HangingTempleBell
          chainLength={38}
          delay={1.3}
          className="hidden lg:block absolute right-6 -top-24 w-11 h-32 opacity-80"
        />
      </div>

      <div className="relative z-10 mx-auto max-w-4xl 2xl:max-w-5xl safe-inline-pad">
        {/* Section Heading */}
        <motion.div
          initial={{ opacity: 0, y: 24 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, amount: 0.25 }}
          transition={{ duration: 0.75, ease: [0.22, 1, 0.36, 1] }}
          className="text-center mb-12 sm:mb-14"
        >
          <p className="text-xs sm:text-sm uppercase tracking-[0.3em] text-turmeric-300 font-medium mb-2">
            <span lang="ta" className="font-tamil mr-2">
              {event.tamilSubtitle}
            </span>
            • Sacred Ceremony
          </p>
          <h2 id="event-heading" className="section-heading font-normal text-gold-shimmer">
            Wedding Ceremony Details
          </h2>
          <div className="mt-4">
            <ZariLotusDivider light />
          </div>
        </motion.div>

        {/* Single Elegant Glassmorphic Event Card */}
        <div className="event-card-wrapper">
          <motion.div
            initial={{ opacity: 0, y: 32 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true, amount: 0.2 }}
            transition={{ duration: 0.85, ease: [0.22, 1, 0.36, 1] }}
            className="print-avoid-break print-solid-glass relative rounded-3xl border border-gold-300/35 bg-white/[0.075] backdrop-blur-md p-6 sm:p-10 md:p-12 shadow-[0_24px_64px_rgba(0,0,0,0.48),inset_0_1px_0_rgba(255,253,246,0.18)]"
          >
            {/* Ornamental Gold Corner Flourishes */}
            <CornerKolamFlourish className="absolute top-4 left-4 w-10 h-10" color="#EAD18F" />
            <CornerKolamFlourish
              className="absolute top-4 right-4 w-10 h-10 -scale-x-100"
              color="#EAD18F"
            />
            <CornerKolamFlourish
              className="absolute bottom-4 left-4 w-10 h-10 -scale-y-100"
              color="#EAD18F"
            />
            <CornerKolamFlourish
              className="absolute bottom-4 right-4 w-10 h-10 scale-[-1]"
              color="#EAD18F"
            />

            {/* Card Header */}
            <div className="text-center max-w-2xl mx-auto pb-7 border-b border-gold-300/25">
              <span className="inline-flex items-center gap-2 rounded-full border border-turmeric-300/45 bg-turmeric-400/15 px-4 py-1 text-xs uppercase tracking-[0.24em] text-turmeric-200 font-semibold">
                <Sparkles className="w-3.5 h-3.5 text-turmeric-300" aria-hidden="true" />
                {event.subtitle}
              </span>
              <h3 className="mt-3.5 font-heading text-2xl sm:text-3xl md:text-4xl text-turmeric-50 font-normal">
                {event.title} (Muhurtham)
              </h3>
              <p className="mt-2.5 text-sm sm:text-base text-turmeric-100/85">
                {event.details}
              </p>
            </div>

            {/* Highlighted Auspicious Muhurtham Callout */}
            <div className="my-7 rounded-2xl border border-turmeric-300/40 bg-gradient-to-r from-turmeric-400/15 via-gold-400/20 to-turmeric-400/15 px-5 py-4 sm:px-7 sm:py-5 text-center">
              <p className="text-xs uppercase tracking-[0.26em] text-turmeric-200 font-semibold">
                Auspicious Muhurtham Window
              </p>
              <p className="mt-1 font-heading text-xl sm:text-2xl md:text-3xl text-turmeric-300 font-medium">
                Between {event.muhurthamWindow} EST
              </p>
            </div>

            {/* Structured Ceremony Details Grid (Container-Query Responsive) */}
            <div className="event-card-details-grid">
              {/* Date & Full Time */}
              <div className="rounded-2xl border border-gold-300/20 bg-maroon-950/45 p-5 sm:p-6 flex items-start gap-4">
                <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl border border-gold-400/40 bg-gold-400/15 text-turmeric-300">
                  <Calendar className="w-5 h-5" aria-hidden="true" />
                </div>
                <div>
                  <h4 className="font-sans text-xs uppercase tracking-[0.22em] text-gold-300 font-semibold">
                    Date &amp; Schedule
                  </h4>
                  <p className="mt-1 font-heading text-lg sm:text-xl text-turmeric-50">
                    {event.dateDisplay}
                  </p>
                  <p className="mt-1 inline-flex items-center gap-1.5 text-sm text-turmeric-100/85">
                    <Clock className="w-4 h-4 text-turmeric-300 shrink-0" aria-hidden="true" />
                    <span>{event.ceremonyTime}</span>
                  </p>
                </div>
              </div>

              {/* Temple Venue & Address */}
              <div className="rounded-2xl border border-gold-300/20 bg-maroon-950/45 p-5 sm:p-6 flex items-start gap-4">
                <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl border border-gold-400/40 bg-gold-400/15 text-turmeric-300">
                  <MapPin className="w-5 h-5" aria-hidden="true" />
                </div>
                <div>
                  <h4 className="font-sans text-xs uppercase tracking-[0.22em] text-gold-300 font-semibold">
                    Sacred Venue
                  </h4>
                  <p className="mt-1 font-heading text-lg sm:text-xl text-turmeric-50">
                    {event.hall}, {event.venueName}
                  </p>
                  <p className="mt-1 text-sm text-turmeric-100/85">
                    {event.addressLine}
                  </p>
                </div>
              </div>
            </div>

            {/* Authentic Vegetarian Lunch (Kalyana Virundhu) Note */}
            <div className="mt-5 rounded-2xl border border-gold-300/20 bg-maroon-950/45 p-5 sm:p-6 flex flex-col sm:flex-row sm:items-center gap-4">
              <div className="flex h-11 w-11 shrink-0 items-center justify-center rounded-xl border border-gold-400/40 bg-gold-400/15 text-turmeric-300">
                <Utensils className="w-5 h-5" aria-hidden="true" />
              </div>
              <div>
                <h4 className="font-sans text-xs uppercase tracking-[0.22em] text-gold-300 font-semibold">
                  {event.feastTitle}
                </h4>
                <p className="mt-1 text-sm sm:text-base text-turmeric-100/90">
                  {event.feastNote}
                </p>
              </div>
            </div>

            {/* Action Buttons: Directions & Add to Calendar (Web only, hidden in PDF) */}
            <div className="no-print mt-8 pt-6 border-t border-gold-300/25 flex flex-wrap items-center justify-center gap-3.5 sm:gap-4">
              <a
                href={event.mapsUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center justify-center gap-2 rounded-full bg-gradient-to-r from-turmeric-400 via-gold-400 to-turmeric-400 px-6 py-3 text-sm font-semibold text-maroon-950 shadow-md transition-transform duration-200 hover:scale-[1.02]"
              >
                <MapPin className="w-4 h-4" aria-hidden="true" />
                <span>Get Directions</span>
                <ExternalLink className="w-3.5 h-3.5 opacity-80" aria-hidden="true" />
              </a>

              <button
                type="button"
                onClick={downloadWeddingIcs}
                className="inline-flex items-center justify-center gap-2 rounded-full border border-gold-300/50 bg-maroon-950/55 px-6 py-3 text-sm font-medium text-turmeric-100 transition-colors duration-200 hover:bg-gold-400/15 hover:border-turmeric-300 cursor-pointer"
              >
                <Calendar className="w-4 h-4 text-turmeric-300" aria-hidden="true" />
                <span>Save to Calendar (.ics)</span>
              </button>
            </div>
          </motion.div>
        </div>
      </div>

      <div
        className="zari-temple-border-top absolute bottom-0 left-0 right-0 h-3 w-full"
        aria-hidden="true"
      />
    </section>
  )
}

