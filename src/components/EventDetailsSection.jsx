import { motion } from 'framer-motion'
import { Calendar, Clock, ExternalLink, MapPin, Sparkles } from 'lucide-react'
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
      {/* Warm ambient turmeric & antique gold glows behind the glassmorphic card (web only) */}
      <div
        aria-hidden="true"
        className="no-print print:hidden pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 h-[28rem] w-[28rem] sm:h-[36rem] sm:w-[44rem] rounded-full blur-3xl"
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

      <div className="relative z-10 mx-auto max-w-4xl 2xl:max-w-5xl safe-inline-pad md:px-24 lg:px-28 print:px-8">
        {/* Section Heading (Web only; Card Header serves as the title in Print) */}
        <motion.div
          initial={{ opacity: 0, y: 24 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, amount: 0.25 }}
          transition={{ duration: 0.75, ease: [0.22, 1, 0.36, 1] }}
          className="text-center mb-12 sm:mb-14 print:hidden"
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
            className="print-avoid-break print-solid-glass relative rounded-3xl border border-gold-300/35 print:border-[#D4AF37] bg-white/[0.075] print:bg-[#2B050D] backdrop-blur-md print:backdrop-blur-none p-6 sm:p-10 md:p-12 print:p-6 shadow-[0_24px_64px_rgba(0,0,0,0.48),inset_0_1px_0_rgba(255,253,246,0.18)] print:shadow-none overflow-hidden"
          >
            {/* Ornamental Gold Corner Flourishes */}
            <CornerKolamFlourish className="absolute top-4 left-4 w-10 h-10 print:w-7 print:h-7" color="#EAD18F" />
            <CornerKolamFlourish
              className="absolute top-4 right-4 w-10 h-10 print:w-7 print:h-7 -scale-x-100"
              color="#EAD18F"
            />
            <CornerKolamFlourish
              className="absolute bottom-4 left-4 w-10 h-10 print:w-7 print:h-7 -scale-y-100"
              color="#EAD18F"
            />
            <CornerKolamFlourish
              className="absolute bottom-4 right-4 w-10 h-10 print:w-7 print:h-7 scale-[-1]"
              color="#EAD18F"
            />

            {/* Card Header */}
            <div className="text-center max-w-2xl mx-auto pb-7 print:pb-3 border-b border-gold-300/25">
              <span className="inline-flex items-center gap-2 rounded-full border border-turmeric-300/45 bg-turmeric-400/15 px-4 py-1 text-xs uppercase tracking-[0.24em] text-turmeric-200 font-semibold print:text-[0.65rem] print:py-0.5">
                <Sparkles className="w-3.5 h-3.5 text-turmeric-300" aria-hidden="true" />
                {event.subtitle}
              </span>
              <h3 className="mt-3.5 print:mt-1.5 font-heading text-2xl sm:text-3xl md:text-4xl print:text-2xl text-turmeric-50 font-normal">
                {event.title}
              </h3>
            </div>

            {/* Highlighted Auspicious Muhurtham Callout */}
            <div className="my-7 print:my-2.5 rounded-2xl border border-turmeric-300/40 bg-gradient-to-r from-turmeric-400/15 via-gold-400/20 to-turmeric-400/15 px-5 py-4 sm:px-7 sm:py-5 print:py-2.5 print:px-4 text-center">
              <p className="text-xs uppercase tracking-[0.26em] text-turmeric-200 font-semibold print:text-[0.65rem]">
                Auspicious Muhurtham Window
              </p>
              <p className="mt-1 font-heading text-xl sm:text-2xl md:text-3xl print:text-xl text-turmeric-300 font-medium">
                Between {event.muhurthamWindow} EST
              </p>
            </div>

            {/* Structured Ceremony Details Grid (Container-Query Responsive) */}
            <div className="event-card-details-grid print:gap-2.5">
              {/* Date & Full Time */}
              <div className="rounded-2xl border border-gold-300/20 bg-maroon-950/45 p-5 sm:p-6 print:p-3 flex items-start gap-4 print:gap-2.5">
                <div className="flex h-11 w-11 print:h-8 print:w-8 shrink-0 items-center justify-center rounded-xl border border-gold-400/40 bg-gold-400/15 text-turmeric-300">
                  <Calendar className="w-5 h-5 print:w-4 print:h-4" aria-hidden="true" />
                </div>
                <div>
                  <h4 className="font-sans text-xs uppercase tracking-[0.22em] text-gold-300 font-semibold print:text-[0.65rem]">
                    Date &amp; Schedule
                  </h4>
                  <p className="mt-1 font-heading text-lg sm:text-xl print:text-base text-turmeric-50">
                    {event.dateDisplay}
                  </p>
                  <p className="mt-1 inline-flex items-center gap-1.5 text-sm print:text-xs text-turmeric-100/85">
                    <Clock className="w-4 h-4 print:w-3.5 print:h-3.5 text-turmeric-300 shrink-0" aria-hidden="true" />
                    <span>{event.ceremonyTime}</span>
                  </p>
                </div>
              </div>

              {/* Wedding Venue & Address */}
              <div className="rounded-2xl border border-gold-300/20 bg-maroon-950/45 p-5 sm:p-6 print:p-3 flex items-start gap-4 print:gap-2.5">
                <div className="flex h-11 w-11 print:h-8 print:w-8 shrink-0 items-center justify-center rounded-xl border border-gold-400/40 bg-gold-400/15 text-turmeric-300">
                  <MapPin className="w-5 h-5 print:w-4 print:h-4" aria-hidden="true" />
                </div>
                <div>
                  <h4 className="font-sans text-xs uppercase tracking-[0.22em] text-gold-300 font-semibold print:text-[0.65rem]">
                    Wedding Venue
                  </h4>
                  <p className="mt-1 font-heading text-lg sm:text-xl print:text-base text-turmeric-50">
                    {event.venueName}
                  </p>
                  <p className="mt-1 text-sm print:text-xs text-turmeric-100/85">
                    {event.addressLine}
                  </p>
                </div>
              </div>
            </div>

            {/* Wedding Day Agenda Timeline */}
            {event.agenda && (
              <div className="my-6 print:my-2.5">
                <div className="flex items-center justify-between gap-3 mb-4 print:mb-2">
                  <div className="h-px flex-1 bg-gold-400/25" />
                  <h4 className="font-sans text-xs sm:text-sm uppercase tracking-[0.24em] text-turmeric-300 font-semibold text-center print:text-[0.65rem]">
                    Auspicious Day's Agenda • திருமண நிகழ்வுகள்
                  </h4>
                  <div className="h-px flex-1 bg-gold-400/25" />
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3.5 sm:gap-4 print:gap-2 text-left">
                  {event.agenda.map((item, idx) => {
                    const isMuhurtham = item.highlight
                    return (
                      <div
                        key={idx}
                        className={`relative rounded-2xl p-4 sm:p-5 print:p-2.5 border transition-colors ${
                          isMuhurtham
                            ? 'border-turmeric-300/60 bg-gradient-to-br from-turmeric-400/20 via-maroon-900/60 to-maroon-950/70 shadow-[0_0_24px_rgba(244,184,41,0.12)] print:shadow-none'
                            : 'border-gold-300/25 bg-maroon-950/50'
                        }`}
                      >
                        <div className="flex items-center justify-between gap-2 mb-1.5 print:mb-1">
                          <span
                            className={`inline-flex items-center gap-1.5 rounded-full px-3 py-0.5 print:px-2 print:py-0 text-xs print:text-[0.65rem] font-semibold tracking-wider ${
                              isMuhurtham
                                ? 'bg-turmeric-300/20 border border-turmeric-300/50 text-turmeric-200'
                                : 'bg-gold-400/15 border border-gold-400/30 text-gold-300'
                            }`}
                          >
                            <Clock className="w-3.5 h-3.5 print:w-3 print:h-3 shrink-0" aria-hidden="true" />
                            <span>{item.time}</span>
                          </span>
                          <span lang="ta" className="font-tamil text-xs print:text-[0.65rem] text-turmeric-300/80">
                            {item.tamilTitle}
                          </span>
                        </div>

                        <h5 className="font-heading text-base sm:text-lg print:text-sm text-turmeric-50 font-normal mt-1.5 print:mt-0.5">
                          {item.title}
                        </h5>
                        <p className="text-xs sm:text-sm print:text-[0.7rem] text-turmeric-100/80 mt-1 print:mt-0.5 leading-relaxed">
                          {item.description}
                        </p>
                      </div>
                    )
                  })}
                </div>
              </div>
            )}

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

