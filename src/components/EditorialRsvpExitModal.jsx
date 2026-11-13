import { useState, useEffect, useCallback, useRef } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { X, Sparkles } from 'lucide-react'
import { ZariLotusDivider, KuthuvilakkuIcon } from './TraditionalMotifs'

const RSVP_STORAGE_KEY = 'noviya_vishnu_rsvp_v1'
const EXIT_CHOICE_CACHE_KEY = 'noviya_rsvp_exit_choice_v1'

export function EditorialRsvpExitModal() {
  const [isOpen, setIsOpen] = useState(false)
  const hasInteractedWithFormRef = useRef(false)

  // 1. Check if user already submitted an RSVP
  const hasAlreadySubmittedRsvp = useCallback(() => {
    try {
      const saved = localStorage.getItem(RSVP_STORAGE_KEY)
      if (!saved) return false
      const parsed = JSON.parse(saved)
      return Boolean(parsed?.guestName && parsed?.attending)
    } catch {
      return false
    }
  }, [])

  // 2. Check if user previously saw the popup and made any choice (cached in localStorage)
  const hasPreviousChoiceCached = useCallback(() => {
    try {
      return Boolean(localStorage.getItem(EXIT_CHOICE_CACHE_KEY))
    } catch {
      return false
    }
  }, [])

  // 3. Check if user has entered any input in the RSVP form
  const hasGivenAnyInput = useCallback(() => {
    // Already submitted
    if (hasAlreadySubmittedRsvp()) return true

    // Actively interacted with or typed in any input/radio in #rsvp
    if (hasInteractedWithFormRef.current) return true

    // Check if name or notes field has any text in the DOM
    const nameEl = document.getElementById('guest-name')
    if (nameEl && nameEl.value && nameEl.value.trim().length > 0) {
      return true
    }

    const notesEl = document.getElementById('guest-notes')
    if (notesEl && notesEl.value && notesEl.value.trim().length > 0) {
      return true
    }

    return false
  }, [hasAlreadySubmittedRsvp])

  // Record whatever choice the user pressed and cache it permanently in localStorage
  const recordChoiceAndClose = useCallback((action) => {
    setIsOpen(false)
    try {
      const choiceRecord = {
        action, // 'rsvp_clicked' | 'respond_later' | 'closed_x' | 'dismissed_backdrop' | 'dismissed_escape'
        timestamp: new Date().toISOString(),
      }
      localStorage.setItem(EXIT_CHOICE_CACHE_KEY, JSON.stringify(choiceRecord))
    } catch {
      // localStorage write error fallback
    }
  }, [])

  const handleRsvpClick = useCallback(
    (e) => {
      e.preventDefault()
      recordChoiceAndClose('rsvp_clicked')
      const el = document.getElementById('rsvp')
      if (el) {
        el.scrollIntoView({ behavior: 'smooth' })
        window.history.pushState(null, '', '#rsvp')
      }
    },
    [recordChoiceAndClose]
  )

  // Listen to input and change events inside the RSVP form to mark user interaction
  useEffect(() => {
    if (hasPreviousChoiceCached() || hasAlreadySubmittedRsvp()) return

    const handleFormActivity = (e) => {
      if (e.target?.closest?.('#rsvp')) {
        hasInteractedWithFormRef.current = true
      }
    }

    document.addEventListener('input', handleFormActivity, { passive: true })
    document.addEventListener('change', handleFormActivity, { passive: true })

    return () => {
      document.removeEventListener('input', handleFormActivity)
      document.removeEventListener('change', handleFormActivity)
    }
  }, [hasPreviousChoiceCached, hasAlreadySubmittedRsvp])

  // Setup Exit-Intent triggers (only if no previous choice cached and no input given)
  useEffect(() => {
    if (hasPreviousChoiceCached() || hasGivenAnyInput()) return

    // 1. Desktop: Detect mouse leaving top of browser window
    const handleMouseLeave = (e) => {
      if (e.clientY <= 15) {
        if (!hasPreviousChoiceCached() && !hasGivenAnyInput()) {
          setIsOpen(true)
        }
      }
    }

    // 2. Mobile: Intercept back button gesture
    try {
      window.history.pushState({ rsvpExitTrap: true }, '')
    } catch {
      // pushState may fail in restricted contexts
    }

    const handlePopState = () => {
      if (!hasPreviousChoiceCached() && !hasGivenAnyInput()) {
        setIsOpen(true)
        try {
          window.history.pushState({ rsvpExitTrap: true }, '')
        } catch {
          // ignore
        }
      }
    }

    // 3. Escape key dismisses modal
    const handleKeyDown = (e) => {
      if (e.key === 'Escape') {
        recordChoiceAndClose('dismissed_escape')
      }
    }

    document.addEventListener('mouseleave', handleMouseLeave)
    window.addEventListener('popstate', handlePopState)
    window.addEventListener('keydown', handleKeyDown)

    return () => {
      document.removeEventListener('mouseleave', handleMouseLeave)
      window.removeEventListener('popstate', handlePopState)
      window.removeEventListener('keydown', handleKeyDown)
    }
  }, [hasPreviousChoiceCached, hasGivenAnyInput, recordChoiceAndClose])

  return (
    <AnimatePresence>
      {isOpen && (
        <div
          role="dialog"
          aria-modal="true"
          aria-labelledby="exit-modal-title"
          className="fixed inset-0 z-50 flex items-center justify-center p-4 sm:p-6"
        >
          {/* Backdrop Blur */}
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            transition={{ duration: 0.3 }}
            onClick={() => recordChoiceAndClose('dismissed_backdrop')}
            aria-hidden="true"
            className="fixed inset-0 bg-black/60 backdrop-blur-sm cursor-pointer"
          />

          {/* Modal Container */}
          <motion.div
            initial={{ opacity: 0, scale: 0.92, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.95, y: 15 }}
            transition={{ type: 'spring', damping: 26, stiffness: 320 }}
            className="relative z-10 w-full max-w-md rounded-3xl border border-[#C5A059]/45 bg-[#FAF6EE] p-6 sm:p-8 text-center shadow-[0_24px_50px_rgba(22,62,38,0.30)] overflow-hidden"
          >
            {/* Corner Ornamental Flourish */}
            <div
              aria-hidden="true"
              className="pointer-events-none absolute -top-16 -right-16 w-32 h-32 rounded-full bg-[#C5A059]/10 blur-2xl"
            />
            <div
              aria-hidden="true"
              className="pointer-events-none absolute -bottom-16 -left-16 w-32 h-32 rounded-full bg-[#163E26]/10 blur-2xl"
            />

            {/* Close Button */}
            <button
              type="button"
              onClick={() => recordChoiceAndClose('closed_x')}
              aria-label="Close dialog"
              className="absolute top-3.5 right-3.5 sm:top-4 sm:right-4 p-2 text-[#7A5A18]/70 hover:text-[#163E26] hover:bg-[#C5A059]/15 rounded-full transition-colors cursor-pointer select-none z-20"
            >
              <X className="w-5 h-5" />
            </button>

            {/* Top Lamp & Auspicious Motif */}
            <div className="flex flex-col items-center justify-center mb-1.5 pt-1 px-8">
              <KuthuvilakkuIcon className="w-4.5 h-6 text-[#8C6A14] drop-shadow-[0_1px_6px_rgba(197,160,89,0.3)] mb-1.5" />
              <span className="font-editorial text-[0.62rem] sm:text-xs uppercase tracking-[0.24em] text-[#8C6A14] font-bold">
                Before You Go • அன்பு நினைவூட்டல்
              </span>
            </div>

            {/* Cursive Headline */}
            <h3
              id="exit-modal-title"
              className="font-cursive text-3xl sm:text-4xl text-[#B83227] font-bold leading-tight py-1 drop-shadow-[0_2px_8px_rgba(184,50,39,0.12)]"
            >
              Will you be joining us?
            </h3>

            {/* Subtext */}
            <p className="font-editorial text-xs sm:text-sm text-[#163E26]/85 leading-relaxed max-w-sm mx-auto mt-2 mb-4">
              We would be overjoyed to celebrate our wedding with you on{' '}
              <span className="font-bold text-[#163E26]">Sunday, December 13, 2026</span> at{' '}
              <span className="font-bold text-[#163E26]">Serene Springs Farm</span>. Please let us know so we can reserve your seat!
            </p>

            {/* Lotus Divider */}
            <div className="my-3 max-w-[200px] mx-auto opacity-85">
              <ZariLotusDivider />
            </div>

            {/* Action Buttons */}
            <div className="mt-5 flex flex-col gap-2.5">
              <button
                type="button"
                onClick={handleRsvpClick}
                className="group w-full inline-flex items-center justify-center gap-2.5 rounded-full border border-[#C5A059]/80 bg-[#163E26] hover:bg-[#1E5233] px-6 py-3.5 text-xs sm:text-sm font-semibold uppercase tracking-[0.22em] text-[#FAF6EE] shadow-[0_6px_22px_rgba(22,62,38,0.25)] hover:shadow-[0_10px_28px_rgba(22,62,38,0.35)] transition-all duration-300 hover:scale-[1.02] active:scale-[0.98] cursor-pointer select-none"
              >
                <Sparkles className="w-4 h-4 text-[#C5A059] group-hover:rotate-12 transition-transform duration-300 shrink-0" aria-hidden="true" />
                <span>RSVP for Our Wedding</span>
              </button>

              <button
                type="button"
                onClick={() => recordChoiceAndClose('respond_later')}
                className="text-[0.68rem] sm:text-xs uppercase tracking-[0.20em] text-[#7A5A18] hover:text-[#163E26] font-medium py-1.5 transition-colors cursor-pointer select-none"
              >
                I&apos;ll respond later
              </button>
            </div>
          </motion.div>
        </div>
      )}
    </AnimatePresence>
  )
}
