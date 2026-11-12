import { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Heart, Sparkles, X, ChevronLeft, ChevronRight, Camera } from 'lucide-react'
import { WEDDING_CONFIG } from '../data/weddingConfig'
import { ZariLotusDivider } from './TraditionalMotifs'

export function EditorialGalleryMarquee() {
  const { coupleStory } = WEDDING_CONFIG
  const [activePhoto, setActivePhoto] = useState(null)

  // Duplicate arrays for seamless infinite looping marquee
  const row1Items = [...coupleStory.row1, ...coupleStory.row1]
  const row2Items = [...coupleStory.row2, ...coupleStory.row2]
  const allPhotos = [...coupleStory.row1, ...coupleStory.row2]

  const openLightbox = (photo) => setActivePhoto(photo)
  const closeLightbox = () => setActivePhoto(null)

  const navigateLightbox = (step) => {
    if (!activePhoto) return
    const currentIndex = allPhotos.findIndex((p) => p.src === activePhoto.src)
    const nextIndex = (currentIndex + step + allPhotos.length) % allPhotos.length
    setActivePhoto(allPhotos[nextIndex])
  }

  return (
    <section
      id="our-story"
      aria-labelledby="story-heading"
      className="relative overflow-hidden bg-[#0A0705] py-20 sm:py-28 text-[#FAF8F5] border-t border-[#C5A059]/15"
    >
      {/* Background Soft Glow */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 h-96 w-[40rem] sm:w-[60rem] rounded-full blur-3xl opacity-15"
        style={{
          background: 'radial-gradient(circle, rgba(197, 160, 89, 0.4) 0%, transparent 75%)',
        }}
      />

      {/* Section Header */}
      <div className="relative z-10 mx-auto max-w-4xl safe-inline-pad text-center mb-12 sm:mb-16">
        <div className="flex flex-col items-center">
          <span className="inline-flex items-center gap-2 rounded-full border border-[#C5A059]/35 bg-[#C5A059]/10 px-4 py-1.5 text-xs uppercase tracking-[0.28em] text-[#E6D7B8] font-medium mb-3">
            <Heart className="w-3.5 h-3.5 text-[#C5A059]" aria-hidden="true" />
            <span>Our Journey in Frames</span>
          </span>

          <h2
            id="story-heading"
            className="font-cursive text-5xl sm:text-7xl md:text-8xl gold-foil-text font-normal tracking-wide py-1"
          >
            "{coupleStory.caption}"
          </h2>

          <div className="my-4 w-full max-w-xs">
            <ZariLotusDivider light />
          </div>

          <p className="font-editorial italic text-base sm:text-xl text-[#FAF8F5]/90 max-w-xl leading-relaxed">
            {coupleStory.subcaption}
          </p>

          <p className="mt-3 text-[0.68rem] uppercase tracking-[0.22em] text-[#C5A059]/80 font-medium flex items-center gap-1.5">
            <Camera className="w-3.5 h-3.5" aria-hidden="true" />
            <span>Hover or tap to view photos</span>
          </p>
        </div>
      </div>

      {/* Dual Row Continuous Marquee */}
      <div className="marquee-container relative z-10 space-y-6 sm:space-y-8 overflow-hidden select-none">
        {/* Row 1: Left to Right Marquee */}
        <div className="relative w-full overflow-hidden">
          <div className="pointer-events-none absolute inset-y-0 left-0 w-12 sm:w-32 bg-gradient-to-r from-[#0A0705] to-transparent z-10" />
          <div className="pointer-events-none absolute inset-y-0 right-0 w-12 sm:w-32 bg-gradient-to-l from-[#0A0705] to-transparent z-10" />

          <div className="animate-marquee-right">
            {row1Items.map((photo, idx) => (
              <div
                key={`row1-${idx}`}
                onClick={() => openLightbox(photo)}
                className="group relative mx-2.5 sm:mx-3.5 shrink-0 cursor-pointer transition-transform duration-300 hover:scale-105 hover:z-20"
              >
                <div
                  className={`w-48 sm:w-60 md:w-68 rounded-2xl border border-[#C5A059]/30 bg-[#16100C]/90 p-2.5 sm:p-3 shadow-[0_12px_32px_rgba(0,0,0,0.6)] transition-all group-hover:border-[#C5A059] group-hover:shadow-[0_16px_36px_rgba(197,160,89,0.22)] ${photo.rotation}`}
                >
                  <div className="relative aspect-[4/5] w-full overflow-hidden rounded-xl bg-black">
                    <img
                      src={photo.src}
                      alt={photo.alt}
                      loading="lazy"
                      className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-108"
                    />
                    <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity flex items-end p-3">
                      <span className="text-xs font-medium text-[#FAF8F5] flex items-center gap-1">
                        <Sparkles className="w-3 h-3 text-[#C5A059]" />
                        <span>View Photo</span>
                      </span>
                    </div>
                  </div>
                  <div className="pt-2 text-center">
                    <p className="font-editorial text-xs sm:text-sm text-[#E6D7B8] font-medium truncate">
                      {photo.title}
                    </p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* Row 2: Right to Left Marquee */}
        <div className="relative w-full overflow-hidden">
          <div className="pointer-events-none absolute inset-y-0 left-0 w-12 sm:w-32 bg-gradient-to-r from-[#0A0705] to-transparent z-10" />
          <div className="pointer-events-none absolute inset-y-0 right-0 w-12 sm:w-32 bg-gradient-to-l from-[#0A0705] to-transparent z-10" />

          <div className="animate-marquee-left">
            {row2Items.map((photo, idx) => (
              <div
                key={`row2-${idx}`}
                onClick={() => openLightbox(photo)}
                className="group relative mx-2.5 sm:mx-3.5 shrink-0 cursor-pointer transition-transform duration-300 hover:scale-105 hover:z-20"
              >
                <div
                  className={`w-48 sm:w-60 md:w-68 rounded-2xl border border-[#C5A059]/30 bg-[#16100C]/90 p-2.5 sm:p-3 shadow-[0_12px_32px_rgba(0,0,0,0.6)] transition-all group-hover:border-[#C5A059] group-hover:shadow-[0_16px_36px_rgba(197,160,89,0.22)] ${photo.rotation}`}
                >
                  <div className="relative aspect-[4/5] w-full overflow-hidden rounded-xl bg-black">
                    <img
                      src={photo.src}
                      alt={photo.alt}
                      loading="lazy"
                      className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-108"
                    />
                    <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent opacity-0 group-hover:opacity-100 transition-opacity flex items-end p-3">
                      <span className="text-xs font-medium text-[#FAF8F5] flex items-center gap-1">
                        <Sparkles className="w-3 h-3 text-[#C5A059]" />
                        <span>View Photo</span>
                      </span>
                    </div>
                  </div>
                  <div className="pt-2 text-center">
                    <p className="font-editorial text-xs sm:text-sm text-[#E6D7B8] font-medium truncate">
                      {photo.title}
                    </p>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>

      {/* Lightbox Modal */}
      <AnimatePresence>
        {activePhoto && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 flex items-center justify-center bg-black/95 p-4 backdrop-blur-md"
            onClick={closeLightbox}
          >
            <motion.div
              initial={{ scale: 0.9, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.9, opacity: 0 }}
              className="relative max-h-[90vh] max-w-2xl overflow-hidden rounded-3xl border border-[#C5A059]/50 bg-[#16100C] p-3 sm:p-4 shadow-2xl"
              onClick={(e) => e.stopPropagation()}
            >
              <button
                type="button"
                onClick={closeLightbox}
                className="absolute right-4 top-4 z-20 flex h-9 w-9 items-center justify-center rounded-full bg-black/80 text-[#FAF8F5] border border-[#C5A059]/40 hover:bg-[#C5A059]/20 cursor-pointer"
                aria-label="Close photo preview"
              >
                <X className="w-5 h-5" />
              </button>

              <button
                type="button"
                onClick={() => navigateLightbox(-1)}
                className="absolute left-4 top-1/2 -translate-y-1/2 z-20 flex h-10 w-10 items-center justify-center rounded-full bg-black/80 text-[#FAF8F5] border border-[#C5A059]/40 hover:bg-[#C5A059]/20 cursor-pointer"
                aria-label="Previous photo"
              >
                <ChevronLeft className="w-6 h-6" />
              </button>
              <button
                type="button"
                onClick={() => navigateLightbox(1)}
                className="absolute right-4 top-1/2 -translate-y-1/2 z-20 flex h-10 w-10 items-center justify-center rounded-full bg-black/80 text-[#FAF8F5] border border-[#C5A059]/40 hover:bg-[#C5A059]/20 cursor-pointer"
                aria-label="Next photo"
              >
                <ChevronRight className="w-6 h-6" />
              </button>

              <div className="overflow-hidden rounded-2xl bg-black max-h-[75vh]">
                <img
                  src={activePhoto.src}
                  alt={activePhoto.alt}
                  className="h-full w-full object-contain mx-auto"
                />
              </div>

              <div className="pt-3 text-center">
                <h3 className="font-editorial text-xl sm:text-2xl text-[#FAF8F5]">
                  {activePhoto.title}
                </h3>
                <p className="text-xs sm:text-sm text-[#E6D7B8]/80 mt-0.5">
                  {activePhoto.alt}
                </p>
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
    </section>
  )
}

