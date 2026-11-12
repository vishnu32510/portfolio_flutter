import { motion } from 'framer-motion'
import { Calendar, Clock, ExternalLink, Sparkles } from 'lucide-react'
import { WEDDING_CONFIG } from '../data/weddingConfig'

function GoogleMapsPinIcon({ className = 'w-4 h-4' }) {
  return (
    <svg viewBox="0 0 92.3 132.3" className={className} aria-hidden="true">
      <path
        fill="#1a73e8"
        d="M60.2 2.2C55.8.8 51 0 46.1 0 32 0 19.3 6.4 10.8 16.5l21.8 18.3L60.2 2.2z"
      />
      <path
        fill="#ea4335"
        d="M10.8 16.5C4.1 24.5 0 34.9 0 46.1c0 8.7 1.7 15.7 4.6 22l28-33.3-21.8-18.3z"
      />
      <path
        fill="#4285f4"
        d="M46.2 28.5c9.7 0 17.6 7.9 17.6 17.6 0 4.3-1.6 8.3-4.2 11.4 0 0 18.5-22 28.1-33.4C82 12.3 71.9 4.7 60.2 2.2L32.6 34.8c3.3-3.9 8.2-6.3 13.6-6.3z"
      />
      <path
        fill="#fbbc04"
        d="M46.2 63.7c-9.7 0-17.6-7.9-17.6-17.6 0-4.3 1.6-8.3 4.2-11.4L4.6 68.1C8.7 76.9 15.2 84.4 22 93.3l37.8-44.9c-3.4 9.4-7.8 15.3-13.6 15.3z"
      />
      <path
        fill="#34a853"
        d="M59.6 48.4L22 93.3c7.5 9.8 14.8 21.6 22.2 39 1.4 3.3 2.8 6.7 4.1 10 1.2-3.3 2.7-6.7 4.1-10 12.9-29.3 39.9-46.7 39.9-86.2 0-8.5-2.2-16.5-6.1-23.5L59.6 48.4z"
      />
    </svg>
  )
}

export function EditorialEventDetails() {
  const { event } = WEDDING_CONFIG

  return (
    <section
      id="event-details"
      aria-labelledby="event-heading"
      className="relative overflow-hidden text-[#143D27] pt-10 sm:pt-12 md:pt-14 pb-12 sm:pb-16 border-t border-[#C5A059]/30"
    >
      {/* 1. Single Pure Background: The Palm Leaves Video */}
      <div className="pointer-events-none absolute inset-0 z-0 overflow-hidden">
        <video
          autoPlay
          loop
          muted
          playsInline
          className="w-full h-full object-cover"
        >
          <source src="/videos/palm-leaves-sunlight.mp4" type="video/mp4" />
        </video>
        {/* Soft natural sunny wash */}
        <div className="absolute inset-0 bg-black/20 backdrop-blur-[0.5px]" />
      </div>

      <div className="relative z-10 mx-auto max-w-3xl lg:max-w-4xl px-4 sm:px-6 safe-inline-pad">
        {/* Section Heading: சுப முகூர்த்தம் • கல்யாண விருந்து */}
        <div className="text-center mb-3 sm:mb-3.5">
          <h2
            id="event-heading"
            lang="ta"
            className="font-tamil text-sm sm:text-base md:text-lg text-[#FFFDF8] font-bold tracking-wide drop-shadow-[0_2px_10px_rgba(40,20,10,0.85)] whitespace-normal sm:whitespace-nowrap"
          >
            சுப முகூர்த்தம் • கல்யாண விருந்து
          </h2>
        </div>

        {/* Date & Venue Two-Column Grid */}
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5 sm:gap-3">
          {/* Date & Schedule */}
          <div className="rounded-xl border border-[#C5A059]/40 bg-[#FAF6EE]/95 backdrop-blur-md p-3 sm:p-3.5 flex items-start gap-2.5 sm:gap-3 shadow-sm">
            <div className="flex h-8 w-8 sm:h-8.5 sm:w-8.5 shrink-0 items-center justify-center rounded-lg border border-[#8C6A14]/40 bg-[#FAF6EE] text-[#8C6A14] shadow-sm">
              <Calendar className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-[#8C6A14]" aria-hidden="true" />
            </div>
            <div className="flex-1 min-w-0">
              <h4 className="text-[0.6rem] sm:text-[0.65rem] uppercase tracking-[0.18em] text-[#8C6A14] font-semibold">
                Date &amp; Schedule
              </h4>
              <p className="mt-0.5 font-editorial text-sm sm:text-base text-[#163E26] font-semibold">
                {event.dateDisplay}
              </p>
              <p className="mt-0.5 inline-flex items-center gap-1 text-[0.72rem] sm:text-xs text-[#6D5537]">
                <Clock className="w-3 h-3 text-[#8C6A14] shrink-0" aria-hidden="true" />
                <span>{event.ceremonyTime}</span>
              </p>
            </div>
          </div>

          {/* Wedding Venue & Address - Directly clickable to Google Maps with Google Maps Icon */}
          <a
            href={event.mapsUrl}
            target="_blank"
            rel="noopener noreferrer"
            title="Open Serene Springs Farm in Google Maps"
            className="group rounded-xl border border-[#C5A059]/40 bg-[#FAF6EE]/95 backdrop-blur-md p-3 sm:p-3.5 flex items-start gap-2.5 sm:gap-3 shadow-sm hover:border-[#8C6A14] hover:bg-[#FDF8EE] hover:shadow-md transition-all duration-200 cursor-pointer"
          >
            <div className="flex h-8 w-8 sm:h-8.5 sm:w-8.5 shrink-0 items-center justify-center rounded-lg border border-[#8C6A14]/40 bg-[#FAF6EE] text-[#8C6A14] shadow-sm group-hover:scale-105 group-hover:bg-[#8C6A14]/10 transition-transform">
              <GoogleMapsPinIcon className="w-4 h-4 sm:w-4.5 sm:h-4.5" />
            </div>
            <div className="flex-1 min-w-0">
              <div className="flex items-center justify-between gap-1">
                <h4 className="text-[0.6rem] sm:text-[0.65rem] uppercase tracking-[0.18em] text-[#8C6A14] font-semibold">
                  Wedding Venue
                </h4>
                <span className="inline-flex items-center gap-1 text-[0.6rem] sm:text-[0.65rem] font-medium text-[#8C6A14] group-hover:text-[#163E26] transition-colors">
                  <span>Google Maps</span>
                  <ExternalLink className="w-2.5 h-2.5" aria-hidden="true" />
                </span>
              </div>
              <p className="mt-0.5 font-editorial text-sm sm:text-base text-[#163E26] font-semibold group-hover:text-[#8C6A14] transition-colors">
                {event.venueName}
              </p>
              <p className="mt-0.5 text-[0.72rem] sm:text-xs text-[#6D5537] truncate">
                {event.addressLine}
              </p>
            </div>
          </a>
        </div>

        {/* Order of Events: Single Unified Card with timing, tamil word, and function name */}
        {event.agenda && (
          <div className="my-3.5 sm:my-4">
            <div className="flex items-center justify-center gap-2.5 mb-2.5 sm:mb-3">
              <div className="h-px flex-1 bg-[#8C6A14]/35" />
              <span className="inline-block bg-[#FAF6EE]/95 backdrop-blur-md border border-[#8C6A14]/30 px-3 py-0.5 rounded-full text-[0.65rem] sm:text-xs uppercase tracking-[0.20em] text-[#8C6A14] font-semibold text-center shadow-sm">
                Order of Events • திருமண நிகழ்வுகள்
              </span>
              <div className="h-px flex-1 bg-[#8C6A14]/35" />
            </div>

            {/* The Single Unified Card: Left column time badge, Right column English name with Tamil underneath */}
            <div className="rounded-2xl border border-[#C5A059]/40 bg-[#FAF6EE]/95 backdrop-blur-md shadow-sm overflow-hidden divide-y divide-[#C5A059]/25">
              {event.agenda.map((item, idx) => {
                const isMuhurtham = item.highlight
                return (
                  <div
                    key={idx}
                    className={`relative p-3 sm:p-4 flex flex-row items-center justify-between gap-3 sm:gap-6 transition-all duration-300 ${
                      isMuhurtham
                        ? 'bg-gradient-to-r from-[#FFFDF8] via-[#FBF0D8] to-[#FFFDF8] ring-1 ring-inset ring-[#8C6A14]/30'
                        : 'hover:bg-[#FFFDF8]/70'
                    }`}
                  >
                    {/* Left Column: Only Time Badge */}
                    <div className="shrink-0 flex items-center">
                      <span
                        className={`inline-flex items-center gap-1.5 rounded-full px-2.5 sm:px-3.5 py-1 sm:py-1.5 text-xs sm:text-sm font-semibold tracking-wider ${
                          isMuhurtham
                            ? 'bg-gradient-to-r from-[#8C6A14] via-[#A8833E] to-[#8C6A14] text-[#FFFDF8] shadow-sm'
                            : 'bg-[#8C6A14]/12 border border-[#8C6A14]/30 text-[#8C6A14]'
                        }`}
                      >
                        {isMuhurtham ? (
                          <Sparkles className="w-3.5 h-3.5 shrink-0 text-[#FFF8D6] animate-pulse" aria-hidden="true" />
                        ) : (
                          <Clock className="w-3.5 h-3.5 shrink-0 text-[#8C6A14]" aria-hidden="true" />
                        )}
                        <span className="whitespace-nowrap">{item.time}</span>
                      </span>
                    </div>

                    {/* Right Column: Name in English, Underneath Tamil Name */}
                    <div className="flex-1 min-w-0 text-right flex flex-col items-end justify-center">
                      <div className="flex items-center justify-end gap-1.5">
                        {isMuhurtham && (
                          <Sparkles className="w-3.5 h-3.5 sm:w-4 sm:h-4 text-[#C5A059] shrink-0 animate-pulse hidden min-[360px]:inline-block" aria-hidden="true" />
                        )}
                        <h4
                          className={`font-editorial whitespace-nowrap ${
                            isMuhurtham
                              ? 'text-sm min-[380px]:text-base sm:text-lg md:text-xl text-[#163E26] font-bold tracking-wide'
                              : 'text-sm min-[380px]:text-[0.95rem] sm:text-base md:text-lg text-[#163E26] font-semibold tracking-wide'
                          }`}
                        >
                          {item.title}
                        </h4>
                      </div>
                      <span
                        lang="ta"
                        className={`font-tamil text-[0.72rem] sm:text-xs md:text-sm mt-0.5 tracking-wide whitespace-nowrap ${
                          isMuhurtham ? 'text-[#8C6A14] font-medium' : 'text-[#8C6A14]/90 font-normal'
                        }`}
                      >
                        {item.tamilTitle}
                      </span>
                    </div>
                  </div>
                )
              })}
            </div>

            {/* Balaji Temple Blessing Note below Agenda */}
            <div className="mt-3 sm:mt-3.5 rounded-xl border border-[#C5A059]/35 bg-[#FAF6EE]/95 backdrop-blur-md px-3.5 sm:px-4 py-2 sm:py-2.5 text-center text-xs sm:text-sm text-[#6D5537] italic shadow-sm">
              Following the Muhurtham rituals, a visit to the Balaji temple (20 mins away from the venue) and return to Serene Springs Farm for lunch at 1:00 PM.
            </div>
          </div>
        )}
      </div>
    </section>
  )
}
