import { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Sparkles, Heart, X, Calendar } from 'lucide-react'
import { ZariLotusDivider } from './TraditionalMotifs'

const PROPOSAL_PHOTOS = [
  {
    src: '/images/gallery/vishnu-final-5.jpg',
    title: 'The Question',
    date: 'May 16th',
    caption: 'When Vishnu asked the question that changed our lives forever.',
  },
  {
    src: '/images/gallery/vishnu-final-113.jpg',
    title: 'The Smile',
    date: 'May 16th',
    caption: 'A heartfelt "Yes!" beneath the open sky.',
  },
  {
    src: '/images/gallery/vishnu-final-127.jpg',
    title: 'Pure Bliss',
    date: 'May 16th',
    caption: 'Tears of joy, tight embraces, and endless laughter.',
  },
  {
    src: '/images/gallery/vishnu-x-noviya-14.jpg',
    title: 'Forever Begins',
    date: 'May 16th',
    caption: 'The moment two paths became one shared future.',
  },
  {
    src: '/images/gallery/vishnu-final-39.jpg',
    title: 'Unfiltered Joy',
    date: 'May 16th',
    caption: 'Reliving every second of that magical afternoon.',
  },
  {
    src: '/images/gallery/vishnu-final-44.jpg',
    title: 'Our Next Chapter',
    date: 'May 16th',
    caption: 'Walking forward hand in hand toward our wedding day.',
  },
]

export function EditorialProposal() {
  const [activePhoto, setActivePhoto] = useState(null)
  // Duplicate photos for seamless infinite right-to-left marquee loop
  const marqueeItems = [...PROPOSAL_PHOTOS, ...PROPOSAL_PHOTOS, ...PROPOSAL_PHOTOS]

  return (
    <section
      id="proposal"
      aria-label="The Proposal"
      className="relative overflow-hidden bg-[#0A0705] py-20 sm:py-28 text-[#FAF8F5] border-t border-[#C5A059]/20"
    >
      {/* Background Soft Glow */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 h-[34rem] w-[34rem] sm:w-[50rem] rounded-full blur-3xl opacity-15"
        style={{
          background: 'radial-gradient(circle, rgba(197, 160, 89, 0.45) 0%, transparent 75%)',
        }}
      />

      {/* Section Sub-badge */}
      <div className="relative z-10 mx-auto max-w-4xl px-4 text-center mb-6 sm:mb-8">
        <div className="inline-flex items-center gap-2 rounded-full border border-[#C5A059]/40 bg-[#C5A059]/10 px-4 py-1.5 text-xs uppercase tracking-[0.28em] text-[#E6D7B8] font-medium shadow-sm">
          <Calendar className="w-3.5 h-3.5 text-[#C5A059]" aria-hidden="true" />
          <span>May 16th • The Milestone</span>
        </div>
      </div>

      {/* End-to-End Section Title: "THE PROPOSAL" */}
      <div className="relative z-10 w-full overflow-hidden select-none mb-8 sm:mb-10 border-y border-[#C5A059]/20 bg-[#16100C]/60 py-3 sm:py-4">
        <div className="flex w-max items-center gap-8 animate-marquee-left">
          {[...Array(6)].map((_, i) => (
            <div key={i} className="flex items-center gap-8">
              <span className="font-editorial text-4xl sm:text-6xl md:text-7xl lg:text-8xl tracking-[0.22em] uppercase text-[#E6D7B8] font-normal gold-foil-text whitespace-nowrap">
                The Proposal
              </span>
              <span className="text-xl sm:text-2xl text-[#C5A059]/60 font-light">•</span>
              <span className="font-cursive text-3xl sm:text-5xl text-[#C5A059] whitespace-nowrap">
                May 16th
              </span>
              <span className="text-xl sm:text-2xl text-[#C5A059]/60 font-light">•</span>
            </div>
          ))}
        </div>
      </div>

      {/* Romantic Sub-caption */}
      <div className="relative z-10 mx-auto max-w-2xl px-4 text-center mb-10 sm:mb-14">
        <p className="font-editorial italic text-xl sm:text-3xl text-[#FAF8F5]/95 leading-relaxed">
          "On May 16th, Vishnu proposed to Noviya."
        </p>
        <div className="my-4 max-w-xs mx-auto">
          <ZariLotusDivider light />
        </div>
        <p className="text-xs sm:text-sm text-[#E6D7B8]/80 leading-relaxed font-light">
          A fast line of memories — beneath the open sky, a simple question turned a beautiful journey into forever.
        </p>
      </div>

      {/* Fast Line of Memories: Proposal pics scrolling Right to Left */}
      <div className="relative z-10 w-full overflow-hidden select-none py-2">
        {/* Soft edge gradient fades */}
        <div className="pointer-events-none absolute inset-y-0 left-0 w-16 sm:w-32 bg-gradient-to-r from-[#0A0705] to-transparent z-10" />
        <div className="pointer-events-none absolute inset-y-0 right-0 w-16 sm:w-32 bg-gradient-to-l from-[#0A0705] to-transparent z-10" />

        <div className="flex w-max items-center gap-5 sm:gap-7 animate-marquee-left" style={{ animationDuration: '24s' }}>
          {marqueeItems.map((photo, idx) => (
            <div
              key={`${photo.src}-${idx}`}
              onClick={() => setActivePhoto(photo)}
              className="group relative w-[220px] sm:w-[280px] md:w-[320px] shrink-0 overflow-hidden rounded-2xl border border-[#C5A059]/35 bg-[#16100C]/80 p-3 sm:p-4 shadow-[0_12px_32px_rgba(0,0,0,0.5)] transition-all duration-300 hover:scale-[1.03] hover:border-[#C5A059] cursor-pointer"
            >
              <div className="relative aspect-[4/5] overflow-hidden rounded-xl bg-black">
                <img
                  src={photo.src}
                  alt={photo.title}
                  loading="lazy"
                  className="h-full w-full object-cover object-center filter contrast-[1.05] brightness-[0.95] transition-transform duration-500 ease-out group-hover:scale-105"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-transparent to-transparent opacity-80 group-hover:opacity-90 transition-opacity" />

                {/* Overlaid Pill Badge */}
                <span className="absolute top-3 left-3 rounded-full border border-white/20 bg-black/60 backdrop-blur-md px-2.5 py-0.5 text-[0.62rem] uppercase tracking-wider text-[#E6D7B8] font-medium">
                  {photo.date}
                </span>

                {/* Title & Caption */}
                <div className="absolute bottom-3 left-3 right-3 text-left">
                  <h3 className="font-editorial text-lg sm:text-xl text-white font-normal">
                    {photo.title}
                  </h3>
                  <p className="line-clamp-2 text-[0.68rem] text-[#E6D7B8]/85 mt-0.5 leading-snug">
                    {photo.caption}
                  </p>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* Lightbox Modal */}
      <AnimatePresence>
        {activePhoto && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={() => setActivePhoto(null)}
            className="fixed inset-0 z-50 flex items-center justify-center bg-black/90 backdrop-blur-md p-4 sm:p-6"
          >
            <motion.div
              initial={{ scale: 0.95, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.95, opacity: 0 }}
              onClick={(e) => e.stopPropagation()}
              className="relative max-w-xl w-full rounded-3xl border border-[#C5A059]/40 bg-[#16100C] p-4 sm:p-6 text-center shadow-2xl"
            >
              <button
                type="button"
                onClick={() => setActivePhoto(null)}
                className="absolute top-4 right-4 flex h-9 w-9 items-center justify-center rounded-full border border-white/20 bg-black/60 text-white hover:bg-[#C5A059] hover:text-[#163E26] transition-colors cursor-pointer"
                aria-label="Close photo"
              >
                <X className="w-4 h-4" />
              </button>

              <div className="aspect-[4/5] max-h-[60vh] w-full overflow-hidden rounded-2xl bg-black mx-auto">
                <img
                  src={activePhoto.src}
                  alt={activePhoto.title}
                  className="h-full w-full object-cover object-center"
                />
              </div>

              <div className="mt-4">
                <span className="text-[0.65rem] uppercase tracking-[0.24em] text-[#C5A059] font-semibold">
                  {activePhoto.date} • The Proposal
                </span>
                <h3 className="mt-1 font-editorial text-2xl text-white font-normal">
                  {activePhoto.title}
                </h3>
                <p className="mt-2 text-xs sm:text-sm text-[#E6D7B8]/80 max-w-md mx-auto">
                  {activePhoto.caption}
                </p>
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </section>
  )
}
