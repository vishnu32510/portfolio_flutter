/**
 * Analytics Service for Noviya & Vishnu Wedding Invitation
 * Mirrors the Google Analytics 4 (GA4) setup from Vishnu's Portfolio App.
 * Tracks visitor count, active sessions, geographic locations (city/country), and user engagement.
 */

const GA_MEASUREMENT_ID =
  import.meta.env.VITE_GA_MEASUREMENT_ID || 'G-G4C2K609VC'

const SESSION_TRACKED_KEY = 'noviya_wedding_visit_logged_v1'

/**
 * Safely call the window.gtag function
 */
export function logEvent(eventName, parameters = {}) {
  try {
    if (typeof window !== 'undefined' && typeof window.gtag === 'function') {
      window.gtag('event', eventName, {
        send_to: GA_MEASUREMENT_ID,
        ...parameters,
      })
    }
  } catch (err) {
    // Fail silently in development/offline
    console.debug('[Analytics Event Error]', err)
  }
}

/**
 * Log page or section view
 */
export function logPageView(pagePath = window.location.pathname, pageTitle = document.title) {
  logEvent('page_view', {
    page_path: pagePath,
    page_title: pageTitle,
    page_location: window.location.href,
  })
}

/**
 * Log section exploration (e.g. 'cover', 'mandapam_invitation', 'countdown', 'agenda', 'rsvp')
 */
export function logSectionView(sectionName) {
  logEvent('section_view', {
    section_name: sectionName,
    timestamp: new Date().toISOString(),
  })
}

/**
 * Log RSVP button clicks, calendar adds, map directions
 */
export function logInteraction(actionName, details = {}) {
  logEvent(actionName, {
    ...details,
    timestamp: new Date().toISOString(),
  })
}

/**
 * Record visitor location & session on mount (once per browser session)
 * Automatically enriches GA4 with visitor approximate city & country.
 */
export async function trackVisitorSession() {
  if (typeof window === 'undefined') return

  // Log immediate page view
  logPageView()

  // Only run geolocation ping once per session to avoid duplicate pings on reload
  try {
    if (sessionStorage.getItem(SESSION_TRACKED_KEY)) {
      return
    }
  } catch {
    // sessionStorage unavailable, proceed
  }

  const isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent)
  const baseData = {
    device_category: isMobile ? 'mobile' : 'desktop',
    screen_resolution: `${window.screen?.width || window.innerWidth}x${window.screen?.height || window.innerHeight}`,
    referrer: document.referrer || 'direct',
    invitation_url: window.location.href,
  }

  // Attempt lightweight IP geolocation fetch with 3-second timeout
  try {
    const controller = new AbortController()
    const timeoutId = setTimeout(() => controller.abort(), 3500)

    const res = await fetch('https://freeipapi.com/api/json', {
      signal: controller.signal,
    })
    clearTimeout(timeoutId)

    if (res.ok) {
      const geo = await res.json()
      const locationData = {
        ...baseData,
        visitor_city: geo.cityName || 'Unknown',
        visitor_region: geo.regionName || 'Unknown',
        visitor_country: geo.countryName || 'Unknown',
        visitor_country_code: geo.countryCode || '',
        approx_coords: geo.latitude && geo.longitude ? `${geo.latitude},${geo.longitude}` : '',
      }

      // Log enriched event to GA4
      logEvent('invitation_opened', locationData)

      try {
        sessionStorage.setItem(SESSION_TRACKED_KEY, 'true')
      } catch {
        // ignore
      }
      return locationData
    }
  } catch (err) {
    // If geo API is blocked by ad-blocker or offline, still send base event
    console.debug('[Analytics Geo Fetch Error]', err)
  }

  // Fallback base event (GA4 backend will still automatically geo-locate from IP)
  logEvent('invitation_opened', baseData)
  try {
    sessionStorage.setItem(SESSION_TRACKED_KEY, 'true')
  } catch {
    // ignore
  }
}
