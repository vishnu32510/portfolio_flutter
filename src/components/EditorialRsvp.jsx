import { useEffect, useRef, useState } from 'react'
import { AnimatePresence, motion } from 'framer-motion'
import { Calendar, CheckCircle2, Edit3, HeartHandshake, Send } from 'lucide-react'
import { WEDDING_CONFIG, downloadWeddingIcs } from '../data/weddingConfig'
import {
  CornerKolamFlourish,
  PulliKolamMandala,
  ZariLotusDivider,
} from './TraditionalMotifs'

const STORAGE_KEY = 'noviya_vishnu_rsvp_v1'
const FIRESTORE_RSVP_ENDPOINT =
  'https://firestore.googleapis.com/v1/projects/vishnupriyan-ss/databases/(default)/documents/wedding_rsvps'

function linkError(el, shown) {
  const errorId = el.dataset?.error
  if (!errorId) return
  const ids = (el.getAttribute('aria-describedby') || '')
    .split(/\s+/)
    .filter((id) => id && id !== errorId)
  if (shown) ids.push(errorId)
  if (ids.length) {
    el.setAttribute('aria-describedby', ids.join(' '))
  } else {
    el.removeAttribute('aria-describedby')
  }
}

function spokenText(node) {
  const copy = node.cloneNode(true)
  copy.querySelectorAll('[aria-hidden="true"]').forEach((n) => n.remove())
  copy.querySelectorAll('[role="img"][aria-label]').forEach((n) => {
    n.replaceWith(`${n.getAttribute('aria-label')}: `)
  })
  return copy.textContent.replace(/\s+/g, ' ').trim()
}

export function EditorialRsvp() {
  const [savedRsvp, setSavedRsvp] = useState(() => {
    try {
      const raw = localStorage.getItem(STORAGE_KEY)
      return raw ? JSON.parse(raw) : null
    } catch {
      return null
    }
  })

  const [isEditing, setIsEditing] = useState(false)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [submitError, setSubmitError] = useState('')

  const [formValues, setFormValues] = useState(() => ({
    guestName: savedRsvp?.guestName || '',
    attending: savedRsvp?.attending || 'yes',
    attendees: savedRsvp?.attendees || '2',
    dietaryPreference: savedRsvp?.dietaryPreference || 'Non-Vegetarian',
    notes: savedRsvp?.notes || '',
    honeypot: '',
  }))

  const formRef = useRef(null)
  const announcerRef = useRef(null)
  const headingRef = useRef(null)

  const showConfirmation = Boolean(savedRsvp) && !isEditing

  // Sync :user-invalid (with fallback) to aria-invalid, aria-describedby, and polite live announcer
  useEffect(() => {
    if (showConfirmation) return
    const form = formRef.current
    if (!form) return

    const supportsUserInvalid =
      typeof CSS !== 'undefined' && CSS.supports?.('selector(:user-invalid)')
    const dirtyState = new WeakMap()
    const flagged = new WeakSet()
    const announced = new WeakSet()
    let announceTimer
    let announcedField = null

    const announceError = (el) => {
      const errorEl = el.dataset?.error ? document.getElementById(el.dataset.error) : null
      if (!errorEl || !announcerRef.current) return
      const label = el.labels?.[0] ? `${spokenText(el.labels[0])}: ` : ''
      clearTimeout(announceTimer)
      announcerRef.current.textContent = ''
      announcedField = el
      announceTimer = setTimeout(() => {
        if (announcerRef.current) {
          announcerRef.current.textContent = label + spokenText(errorEl)
        }
      }, 500)
    }

    const syncControl = (el, announce = false) => {
      if (!el?.matches?.('input, select, textarea')) return
      if (el.tabIndex === -1) return

      let invalid = false
      if (supportsUserInvalid) {
        invalid = el.matches(':user-invalid')
      } else {
        const state = dirtyState.get(el)
        if (state?.hasInteracted && state?.hasBlurred) {
          invalid = !el.validity.valid
          el.classList.toggle('user-invalid-fallback', invalid)
          el.classList.toggle('user-valid-fallback', !invalid)
        }
      }

      if (invalid) {
        if (announce && !announced.has(el)) {
          announceError(el)
          announced.add(el)
        }
        el.setAttribute('aria-invalid', 'true')
        linkError(el, true)
        flagged.add(el)
      } else if (flagged.has(el) || el.getAttribute('aria-invalid') !== 'true') {
        el.setAttribute('aria-invalid', 'false')
        linkError(el, false)
        flagged.delete(el)
        announced.delete(el)
        if (announcedField === el && announcerRef.current) {
          clearTimeout(announceTimer)
          announcerRef.current.textContent = ''
        }
      }
    }

    // Initialize all fields at aria-invalid="false"
    form.querySelectorAll('input, select, textarea').forEach((el) => {
      if (el.tabIndex !== -1) {
        el.setAttribute('aria-invalid', 'false')
      }
    })

    const onBlur = (e) => {
      const el = e.target
      if (!el?.checkValidity) return
      const state = dirtyState.get(el) || { hasInteracted: false, hasBlurred: false }
      state.hasBlurred = true
      dirtyState.set(el, state)
      syncControl(el, true)
    }

    const onInput = (e) => {
      const el = e.target
      if (!el?.checkValidity) return
      const state = dirtyState.get(el) || { hasInteracted: false, hasBlurred: false }
      state.hasInteracted = true
      dirtyState.set(el, state)
      syncControl(el, false)
    }

    const onChange = (e) => {
      const el = e.target
      if (!el?.checkValidity) return
      const state = dirtyState.get(el) || { hasInteracted: true, hasBlurred: true }
      state.hasInteracted = true
      dirtyState.set(el, state)
      syncControl(el, true)
    }

    const onInvalid = (e) => {
      const el = e.target
      if (!el?.checkValidity) return
      dirtyState.set(el, { hasInteracted: true, hasBlurred: true })
      announced.add(el)
      syncControl(el, false)
    }

    form.addEventListener('blur', onBlur, true)
    form.addEventListener('input', onInput)
    form.addEventListener('change', onChange, true)
    form.addEventListener('invalid', onInvalid, true)

    return () => {
      clearTimeout(announceTimer)
      form.removeEventListener('blur', onBlur, true)
      form.removeEventListener('input', onInput)
      form.removeEventListener('change', onChange, true)
      form.removeEventListener('invalid', onInvalid, true)
    }
  }, [showConfirmation])

  const handleFieldChange = (e) => {
    const { name, value } = e.target
    setSubmitError('')
    setFormValues((prev) => ({
      ...prev,
      [name]: value,
    }))
  }

  const handleSubmit = async (e) => {
    e.preventDefault()
    if (isSubmitting) return

    // Ignore automated spam bots filling hidden honeypot
    if (formValues.honeypot) return

    const form = formRef.current
    if (form && !form.checkValidity()) {
      const firstInvalid = form.querySelector(':invalid')
      firstInvalid?.focus()
      return
    }

    setIsSubmitting(true)
    setSubmitError('')

    const payload = {
      guestName: formValues.guestName.trim(),
      attending: formValues.attending,
      attendees: formValues.attending === 'yes' ? Number(formValues.attendees) : 0,
      dietaryPreference:
        formValues.attending === 'yes' ? formValues.dietaryPreference : 'N/A',
      notes: formValues.notes.trim(),
      submittedAt: new Date().toISOString(),
    }

    try {
      const firestoreRes = await fetch(FIRESTORE_RSVP_ENDPOINT, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          fields: {
            guestName: { stringValue: payload.guestName },
            attending: { stringValue: payload.attending },
            attendees: { integerValue: String(payload.attendees) },
            dietaryPreference: { stringValue: payload.dietaryPreference },
            notes: { stringValue: payload.notes },
            submittedAt: { stringValue: payload.submittedAt },
          },
        }),
      })

      if (!firestoreRes.ok) {
        throw new Error('Unable to save your RSVP right now. Please try again in a moment.')
      }

      if (WEDDING_CONFIG.rsvpWebhookUrl) {
        try {
          await fetch(WEDDING_CONFIG.rsvpWebhookUrl, {
            method: 'POST',
            mode: 'no-cors',
            headers: { 'Content-Type': 'text/plain;charset=utf-8' },
            body: JSON.stringify(payload),
          })
        } catch (webhookErr) {
          console.warn('Webhook sync warning:', webhookErr)
        }
      }

      try {
        localStorage.setItem(STORAGE_KEY, JSON.stringify(payload))
      } catch {
        // Ignore storage quota errors in private browsing
      }

      setSavedRsvp(payload)
      setIsEditing(false)
    } catch (err) {
      setSubmitError(
        err instanceof Error
          ? err.message
          : 'Something went wrong while saving your RSVP. Please try again.',
      )
    } finally {
      setIsSubmitting(false)
    }
  }

  const handleEditClick = () => {
    if (savedRsvp) {
      setFormValues({
        guestName: savedRsvp.guestName || '',
        attending: savedRsvp.attending || 'yes',
        attendees: String(savedRsvp.attendees > 0 ? savedRsvp.attendees : 2),
        dietaryPreference: savedRsvp.dietaryPreference || 'Non-Vegetarian',
        notes: savedRsvp.notes || '',
        honeypot: '',
      })
    }
    setIsEditing(true)
  }

  return (
    <section
      id="rsvp"
      aria-labelledby="rsvp-heading"
      className="no-print relative overflow-hidden bg-[#EBE2DB] text-[#143D27] py-20 sm:py-28 2xl:py-36 border-t border-[#C5A059]/30"
    >
      {/* Central Rotating Kolam Mandala Watermark in warm golden sand (No stone pillars) */}
      <div
        aria-hidden="true"
        className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 opacity-[0.05]"
      >
        <PulliKolamMandala className="w-80 h-80 sm:w-96 sm:h-96 text-[#8C6A14]" />
      </div>

      {/* Polite screen-reader live region for deferred field validation errors */}
      <div ref={announcerRef} aria-live="polite" className="visually-hidden" />

      <div className="relative z-10 mx-auto max-w-2xl lg:max-w-3xl px-4 sm:px-8 safe-inline-pad">
        {/* Heading */}
        <motion.div
          initial={{ opacity: 0, y: 24 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, amount: 0.25 }}
          transition={{ duration: 0.75, ease: [0.22, 1, 0.36, 1] }}
          className="text-center mb-10 sm:mb-12"
        >
          <p className="text-xs sm:text-sm uppercase tracking-[0.28em] text-[#8C6A14] font-semibold mb-2">
            Kindly Respond • வருகை பதிவு
          </p>
          <h2
            id="rsvp-heading"
            ref={headingRef}
            tabIndex={-1}
            className="font-editorial text-4xl sm:text-5xl md:text-6xl text-[#163E26] font-normal tracking-wide outline-none"
          >
            RSVP for Our Celebration
          </h2>
          <div className="my-4 max-w-xs mx-auto">
            <ZariLotusDivider />
          </div>
          <p className="font-editorial italic text-sm sm:text-base md:text-lg text-[#6D5537] max-w-xl mx-auto leading-relaxed">
            Your presence at our wedding will mean the world to us and both of our families. Kindly share your response below.
          </p>
        </motion.div>

        {/* Form / Confirmation Card */}
        <motion.div
          initial={{ opacity: 0, y: 28 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true, amount: 0.15 }}
          transition={{ duration: 0.8, ease: [0.22, 1, 0.36, 1] }}
          className="relative rounded-3xl border border-[#C5A059]/50 bg-[#FFFDF9]/95 backdrop-blur-md p-6 sm:p-10 md:p-12 shadow-[0_20px_50px_rgba(58,14,23,0.08)] overflow-hidden"
        >
          <CornerKolamFlourish className="absolute top-3.5 left-3.5 w-8 h-8 sm:w-9 sm:h-9" color="#8C6A14" />
          <CornerKolamFlourish
            className="absolute top-3.5 right-3.5 w-8 h-8 sm:w-9 sm:h-9 -scale-x-100"
            color="#8C6A14"
          />
          <CornerKolamFlourish
            className="absolute bottom-3.5 left-3.5 w-8 h-8 sm:w-9 sm:h-9 -scale-y-100"
            color="#8C6A14"
          />
          <CornerKolamFlourish
            className="absolute bottom-3.5 right-3.5 w-8 h-8 sm:w-9 sm:h-9 scale-[-1]"
            color="#8C6A14"
          />

          <AnimatePresence mode="wait">
            {showConfirmation ? (
              <motion.div
                key="rsvp-confirmed"
                role="status"
                aria-live="polite"
                initial={{ opacity: 0, scale: 0.97 }}
                animate={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 0, scale: 0.97 }}
                transition={{ duration: 0.35 }}
                className="text-center py-4 sm:py-6"
              >
                <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-[#FAF6EE] border border-[#8C6A14]/40 text-[#163E26] shadow-sm">
                  {savedRsvp.attending === 'yes' ? (
                    <CheckCircle2 className="w-8 h-8 text-emerald-700" aria-hidden="true" />
                  ) : (
                    <HeartHandshake className="w-8 h-8 text-[#8C6A14]" aria-hidden="true" />
                  )}
                </div>

                <p lang="ta" className="font-tamil text-lg sm:text-xl text-[#8C6A14] font-semibold">
                  மிக்க நன்றி
                </p>
                <h3 className="mt-1 font-editorial text-2xl sm:text-3xl text-[#163E26]">
                  Thank You, {savedRsvp.guestName}!
                </h3>
                <p className="mt-2.5 text-sm sm:text-base text-[#6D5537] max-w-md mx-auto">
                  {savedRsvp.attending === 'yes'
                    ? `We are delighted to reserve ${savedRsvp.attendees} ${
                        savedRsvp.attendees === 1 ? 'seat' : 'seats'
                      } for you on Sunday, December 13, 2026 at Serene Springs Farm.`
                    : 'We will miss celebrating with you in person and deeply appreciate your warm wishes and blessings.'}
                </p>

                {/* Summary Box */}
                <dl className="mt-6 rounded-2xl border border-[#C5A059]/35 bg-[#FAF6EE] p-5 text-left text-sm space-y-2.5 max-w-md mx-auto shadow-sm">
                  <div className="flex justify-between gap-4">
                    <dt className="text-[#6D5537] font-medium">Status</dt>
                    <dd className="text-[#163E26] font-semibold text-right">
                      {savedRsvp.attending === 'yes'
                        ? `Joyfully Attending (${savedRsvp.attendees} ${
                            savedRsvp.attendees === 1 ? 'Guest' : 'Guests'
                          })`
                        : 'Sending Wishes From Afar'}
                    </dd>
                  </div>
                  {savedRsvp.attending === 'yes' && savedRsvp.dietaryPreference && (
                    <div className="flex justify-between gap-4">
                      <dt className="text-[#6D5537] font-medium">Dietary Preference</dt>
                      <dd className="text-[#163E26] font-semibold text-right">
                        {savedRsvp.dietaryPreference === 'Non-Vegetarian'
                          ? 'Non-Vegetarian'
                          : 'Vegetarian (சைவம்)'}
                      </dd>
                    </div>
                  )}
                  {savedRsvp.notes && (
                    <div className="pt-2 border-t border-[#C5A059]/25">
                      <dt className="text-[#6D5537] font-medium mb-1">
                        Messages, Blessings, or Food Allergies
                      </dt>
                      <dd className="text-[#163E26] italic">“{savedRsvp.notes}”</dd>
                    </div>
                  )}
                </dl>

                <div className="mt-7 flex flex-wrap items-center justify-center gap-3.5">
                  {savedRsvp.attending === 'yes' && (
                    <button
                      type="button"
                      onClick={downloadWeddingIcs}
                      className="inline-flex items-center justify-center gap-2 rounded-full bg-gradient-to-r from-[#143D27] via-[#1B4D31] to-[#143D27] px-6 py-3 text-sm font-semibold text-[#FAF6EE] shadow-sm transition-opacity hover:opacity-95 cursor-pointer"
                    >
                      <Calendar className="w-4 h-4 text-[#C5A059]" aria-hidden="true" />
                      <span>Add to Calendar</span>
                    </button>
                  )}

                  <button
                    type="button"
                    onClick={handleEditClick}
                    className="inline-flex items-center justify-center gap-2 rounded-full border border-[#8C6A14]/40 bg-[#FAF6EE] px-5 py-3 text-sm font-medium text-[#163E26] transition-colors hover:bg-[#8C6A14]/15 cursor-pointer"
                  >
                    <Edit3 className="w-4 h-4 text-[#8C6A14]" aria-hidden="true" />
                    <span>Update Response</span>
                  </button>
                </div>
              </motion.div>
            ) : (
              <motion.form
                key="rsvp-form"
                ref={formRef}
                action="#rsvp"
                method="POST"
                onSubmit={handleSubmit}
                aria-labelledby="rsvp-heading"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                transition={{ duration: 0.3 }}
                className="space-y-6"
              >
                {/* Honeypot spam protection hidden from assistive tech */}
                <div className="visually-hidden" aria-hidden="true">
                  <label htmlFor="website-hp">Leave this field empty</label>
                  <input
                    type="text"
                    id="website-hp"
                    name="honeypot"
                    tabIndex={-1}
                    autoComplete="off"
                    value={formValues.honeypot}
                    onChange={handleFieldChange}
                  />
                </div>

                {/* 1. Guest Full Name */}
                <div className="flex flex-col">
                  <label
                    htmlFor="guest-name"
                    className="text-sm font-semibold text-[#163E26] mb-1"
                  >
                    Your Full Name <span className="text-red-700" aria-hidden="true">*</span>
                  </label>
                  <input
                    type="text"
                    id="guest-name"
                    name="guestName"
                    required
                    maxLength={120}
                    autoComplete="name"
                    enterKeyHint="next"
                    value={formValues.guestName}
                    onChange={handleFieldChange}
                    placeholder="e.g., Priya Subramanian"
                    data-error="guest-name-error"
                    className="rsvp-control w-full rounded-xl border border-[#C5A059]/50 bg-[#FAF6EE] px-4 py-3 text-[#143D27] placeholder:text-[#6D5537]/50 focus:border-[#8C6A14] focus:outline-none focus:ring-1 focus:ring-[#8C6A14]"
                  />
                  <div
                    id="guest-name-error"
                    className="rsvp-error-msg items-center gap-1.5 mt-1.5 text-sm text-red-700 font-medium"
                  >
                    <span role="img" aria-label="Error">
                      ⚠️
                    </span>
                    <span>Please enter your full name so we know who is responding.</span>
                  </div>
                </div>

                {/* 2. Attendance Choice (2 options -> visible radios inside fieldset + legend) */}
                <fieldset className="border-0 p-0 m-0">
                  <legend className="text-sm font-semibold text-[#163E26] mb-2">
                    Will You Be Attending? <span className="text-red-700" aria-hidden="true">*</span>
                  </legend>
                  <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                    <label
                      htmlFor="attending-yes"
                      className={`group flex items-center gap-3 rounded-xl border px-4 py-3 cursor-pointer transition-colors ${
                        formValues.attending === 'yes'
                          ? 'border-[#8C6A14] bg-[#F4EAD4] text-[#163E26] font-semibold shadow-sm'
                          : 'border-[#C5A059]/40 bg-white text-[#6D5537] hover:bg-[#F4EAD4]/30'
                      }`}
                    >
                      <input
                        type="radio"
                        id="attending-yes"
                        name="attending"
                        value="yes"
                        checked={formValues.attending === 'yes'}
                        onChange={handleFieldChange}
                        className="sr-only peer"
                      />
                      <span
                        aria-hidden="true"
                        className={`h-4.5 w-4.5 rounded-full border-2 flex items-center justify-center shrink-0 transition-all peer-focus-visible:ring-2 peer-focus-visible:ring-[#8C6A14] ${
                          formValues.attending === 'yes'
                            ? 'border-[#8C6A14] bg-white ring-1 ring-[#8C6A14]/30'
                            : 'border-[#C5A059]/60 bg-white group-hover:border-[#8C6A14]/70'
                        }`}
                      >
                        {formValues.attending === 'yes' && (
                          <span className="h-2 w-2 rounded-full bg-[#8C6A14]" />
                        )}
                      </span>
                      <span>Joyfully Attending</span>
                    </label>

                    <label
                      htmlFor="attending-no"
                      className={`group flex items-center gap-3 rounded-xl border px-4 py-3 cursor-pointer transition-colors ${
                        formValues.attending === 'no'
                          ? 'border-[#8C6A14] bg-[#F4EAD4] text-[#163E26] font-semibold shadow-sm'
                          : 'border-[#C5A059]/40 bg-white text-[#6D5537] hover:bg-[#F4EAD4]/30'
                      }`}
                    >
                      <input
                        type="radio"
                        id="attending-no"
                        name="attending"
                        value="no"
                        checked={formValues.attending === 'no'}
                        onChange={handleFieldChange}
                        className="sr-only peer"
                      />
                      <span
                        aria-hidden="true"
                        className={`h-4.5 w-4.5 rounded-full border-2 flex items-center justify-center shrink-0 transition-all peer-focus-visible:ring-2 peer-focus-visible:ring-[#8C6A14] ${
                          formValues.attending === 'no'
                            ? 'border-[#8C6A14] bg-white ring-1 ring-[#8C6A14]/30'
                            : 'border-[#C5A059]/60 bg-white group-hover:border-[#8C6A14]/70'
                        }`}
                      >
                        {formValues.attending === 'no' && (
                          <span className="h-2 w-2 rounded-full bg-[#8C6A14]" />
                        )}
                      </span>
                      <span>Sending Wishes From Afar</span>
                    </label>
                  </div>
                </fieldset>

                {/* 3. Number of Attendees (shown when attending; 8 choices -> native <select>) */}
                {formValues.attending === 'yes' && (
                  <div className="flex flex-col">
                    <label
                      htmlFor="guest-attendees"
                      className="text-sm font-semibold text-[#163E26] mb-0.5"
                    >
                      Number of Attendees (Including Yourself){' '}
                      <span className="text-red-700" aria-hidden="true">*</span>
                    </label>
                    <span id="attendees-hint" className="text-xs text-[#6D5537] mb-1.5">
                      Helps us plan seating and the wedding lunch.
                    </span>
                    <div className="relative">
                      <select
                        id="guest-attendees"
                        name="attendees"
                        required
                        aria-describedby="attendees-hint"
                        data-error="guest-attendees-error"
                        value={formValues.attendees}
                        onChange={handleFieldChange}
                        className="rsvp-control w-full appearance-none rounded-xl border border-[#C5A059]/50 bg-[#FAF6EE] pl-4 pr-10 py-3 text-[#143D27] cursor-pointer focus:border-[#8C6A14] focus:outline-none focus:ring-1 focus:ring-[#8C6A14]"
                      >
                        {[1, 2, 3, 4, 5, 6, 7, 8].map((count) => (
                          <option key={count} value={String(count)}>
                            {count} {count === 1 ? 'Guest' : 'Guests'}
                          </option>
                        ))}
                      </select>
                      <span
                        aria-hidden="true"
                        className="pointer-events-none absolute inset-y-0 right-4 flex items-center text-[#8C6A14] font-bold"
                      >
                        ▾
                      </span>
                    </div>
                    <div
                      id="guest-attendees-error"
                      className="rsvp-error-msg items-center gap-1.5 mt-1.5 text-sm text-red-700 font-medium"
                    >
                      <span role="img" aria-label="Error">
                        ⚠️
                      </span>
                      <span>Please select the number of guests attending.</span>
                    </div>
                  </div>
                )}

                {/* 4. Dietary Preference (Non-Vegetarian vs Vegetarian) */}
                {formValues.attending === 'yes' && (
                  <fieldset className="border-0 p-0 m-0">
                    <legend className="text-sm font-semibold text-[#163E26] mb-1.5">
                      Dietary Preference <span className="text-red-700" aria-hidden="true">*</span>
                    </legend>
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                      <label
                        htmlFor="dietary-non-veg"
                        className={`group flex items-center gap-3 rounded-xl border px-4 py-3 cursor-pointer transition-colors ${
                          formValues.dietaryPreference === 'Non-Vegetarian'
                            ? 'border-[#8C6A14] bg-[#F4EAD4] text-[#163E26] font-semibold shadow-sm'
                            : 'border-[#C5A059]/40 bg-white text-[#6D5537] hover:bg-[#F4EAD4]/30'
                        }`}
                      >
                        <input
                          type="radio"
                          id="dietary-non-veg"
                          name="dietaryPreference"
                          value="Non-Vegetarian"
                          checked={formValues.dietaryPreference === 'Non-Vegetarian'}
                          onChange={handleFieldChange}
                          className="sr-only peer"
                        />
                        <span
                          aria-hidden="true"
                          className={`h-4.5 w-4.5 rounded-full border-2 flex items-center justify-center shrink-0 transition-all peer-focus-visible:ring-2 peer-focus-visible:ring-[#8C6A14] ${
                            formValues.dietaryPreference === 'Non-Vegetarian'
                              ? 'border-[#8C6A14] bg-white ring-1 ring-[#8C6A14]/30'
                              : 'border-[#C5A059]/60 bg-white group-hover:border-[#8C6A14]/70'
                          }`}
                        >
                          {formValues.dietaryPreference === 'Non-Vegetarian' && (
                            <span className="h-2 w-2 rounded-full bg-[#8C6A14]" />
                          )}
                        </span>
                        <span>Non-Vegetarian</span>
                      </label>

                      <label
                        htmlFor="dietary-veg"
                        className={`group flex items-center gap-3 rounded-xl border px-4 py-3 cursor-pointer transition-colors ${
                          formValues.dietaryPreference === 'Vegetarian'
                            ? 'border-[#8C6A14] bg-[#F4EAD4] text-[#163E26] font-semibold shadow-sm'
                            : 'border-[#C5A059]/40 bg-white text-[#6D5537] hover:bg-[#F4EAD4]/30'
                        }`}
                      >
                        <input
                          type="radio"
                          id="dietary-veg"
                          name="dietaryPreference"
                          value="Vegetarian"
                          checked={formValues.dietaryPreference === 'Vegetarian'}
                          onChange={handleFieldChange}
                          className="sr-only peer"
                        />
                        <span
                          aria-hidden="true"
                          className={`h-4.5 w-4.5 rounded-full border-2 flex items-center justify-center shrink-0 transition-all peer-focus-visible:ring-2 peer-focus-visible:ring-[#8C6A14] ${
                            formValues.dietaryPreference === 'Vegetarian'
                              ? 'border-[#8C6A14] bg-white ring-1 ring-[#8C6A14]/30'
                              : 'border-[#C5A059]/60 bg-white group-hover:border-[#8C6A14]/70'
                          }`}
                        >
                          {formValues.dietaryPreference === 'Vegetarian' && (
                            <span className="h-2 w-2 rounded-full bg-[#8C6A14]" />
                          )}
                        </span>
                        <span>Vegetarian (சைவம்)</span>
                      </label>
                    </div>
                  </fieldset>
                )}

                {/* 5. Messages, Blessings, or Food Allergies */}
                <div className="flex flex-col">
                  <label
                    htmlFor="guest-notes"
                    className="text-sm font-semibold text-[#163E26] mb-0.5"
                  >
                    Messages, Blessings, or Food Allergies{' '}
                    <span className="text-xs font-normal text-[#6D5537]">(Optional)</span>
                  </label>
                  <span id="notes-hint" className="text-xs text-[#6D5537] mb-1.5">
                    Let us know of any specific food allergies (e.g., nut, dairy, gluten) or
                    leave a personal note or blessing for Noviya &amp; Vishnu.
                  </span>
                  <textarea
                    id="guest-notes"
                    name="notes"
                    rows={4}
                    maxLength={600}
                    aria-describedby="notes-hint"
                    value={formValues.notes}
                    onChange={handleFieldChange}
                    placeholder="Share your blessings or let us know about food allergies..."
                    className="rsvp-control w-full resize-y rounded-xl border border-[#C5A059]/50 bg-[#FAF6EE] px-4 py-3 text-[#143D27] placeholder:text-[#6D5537]/50 focus:border-[#8C6A14] focus:outline-none focus:ring-1 focus:ring-[#8C6A14]"
                  />
                </div>

                {submitError && (
                  <div
                    role="alert"
                    className="rounded-xl border border-red-300 bg-red-50 px-4 py-3 text-sm text-red-800 font-medium"
                  >
                    <span role="img" aria-label="Error" className="mr-1.5">
                      ⚠️
                    </span>
                    {submitError}
                  </div>
                )}

                {/* Submit Action */}
                <div className="pt-2 flex flex-col sm:flex-row items-center justify-between gap-4">
                  <button
                    type="submit"
                    disabled={isSubmitting}
                    className="w-full sm:w-auto inline-flex items-center justify-center gap-2.5 rounded-full bg-gradient-to-r from-[#143D27] via-[#1B4D31] to-[#143D27] px-8 py-4 text-base font-semibold text-[#FAF6EE] shadow-[0_10px_28px_rgba(20,61,39,0.25)] transition-all duration-200 hover:from-[#0E2F1C] hover:to-[#0E2F1C] disabled:opacity-65 cursor-pointer"
                  >
                    <Send className="w-4 h-4 text-[#C5A059]" aria-hidden="true" />
                    <span>{isSubmitting ? 'Sending Response…' : 'Confirm RSVP'}</span>
                  </button>

                  {isEditing && (
                    <button
                      type="button"
                      onClick={() => setIsEditing(false)}
                      className="text-sm font-medium text-[#163E26] underline underline-offset-4 hover:text-[#8C6A14] cursor-pointer px-3 py-2"
                    >
                      Cancel &amp; Keep Previous Response
                    </button>
                  )}
                </div>
              </motion.form>
            )}
          </AnimatePresence>
        </motion.div>
      </div>
    </section>
  )
}
