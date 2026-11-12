import { Calendar, Clock, MapPin, Sparkles, Heart, Printer, Download } from 'lucide-react'
import { WEDDING_CONFIG } from '../data/weddingConfig'
import {
  CornerKolamFlourish,
  KuthuvilakkuIcon,
  SikkuBrahmaMudiKolam,
  ZariLotusDivider,
} from './TraditionalMotifs'

export function EditorialPrintableInvite() {
  const { groom, bride, event } = WEDDING_CONFIG

  const handlePrint = () => {
    window.print()
  }

  return (
    <div className="printable-invitation-root min-h-screen bg-[#2A231D] text-[#143D27] py-0 print:py-0 print:bg-transparent flex flex-col items-center">
      {/* Non-printing Floating Action Bar for Previewers */}
      <div className="print:hidden sticky top-4 z-50 mb-6 mt-4 flex items-center gap-3 rounded-full border border-[#C5A059]/40 bg-[#FAF6EE]/95 px-5 py-2.5 shadow-xl backdrop-blur-md">
        <span className="font-editorial text-sm font-semibold text-[#163E26]">
          Noviya &amp; Vishnu • Wedding Invitation PDF
        </span>
        <div className="h-4 w-px bg-[#8C6A14]/30" />
        <button
          onClick={handlePrint}
          className="inline-flex items-center gap-2 rounded-full bg-[#163E26] px-4 py-1.5 text-xs font-semibold uppercase tracking-wider text-[#FAF6EE] shadow transition hover:bg-[#1E5233] cursor-pointer"
        >
          <Printer className="h-3.5 w-3.5" />
          <span>Print / Save PDF</span>
        </button>
        <a
          href="/Noviya-and-Vishnu-Priyan-Wedding-Invitation.pdf"
          download="Noviya-and-Vishnu-Priyan-Wedding-Invitation.pdf"
          className="inline-flex items-center gap-1.5 rounded-full border border-[#8C6A14]/40 bg-[#FAF6EE] px-3.5 py-1.5 text-xs font-semibold text-[#8C6A14] transition hover:bg-[#8C6A14]/10 cursor-pointer"
        >
          <Download className="h-3.5 w-3.5" />
          <span>Direct PDF</span>
        </a>
      </div>

      {/* =========================================================================
          PAGE 1: ROYAL COVER
          ========================================================================= */}
      <div className="print-page relative w-[210mm] h-[297mm] overflow-hidden bg-[#0A0705] text-[#FAF8F5] shadow-2xl print:shadow-none mx-auto mb-8 print:mb-0 flex flex-col justify-between">
        {/* Full Bleed Candid Black & White Couple Photograph */}
        <div className="absolute inset-0 z-0">
          <img
            src="/images/noviya-vishnu-candid-bw.jpg"
            alt="Noviya and Vishnu running hand in hand in sunlight"
            className="h-full w-full object-cover object-[center_32%] filter contrast-[1.08] brightness-[0.88]"
          />
          {/* Subtle Top Gradient Vignette for Tree Canopy Lettering Contrast & Subtle Base Vignette */}
          <div className="absolute inset-0 bg-gradient-to-b from-[#0A0705]/70 via-[#0A0705]/20 to-transparent" />
          <div className="absolute inset-0 bg-gradient-to-t from-[#0A0705]/25 via-transparent to-transparent" />
        </div>

        {/* Top Names (Tree Canopy Region - Heads & Figures Unobstructed) */}
        <div className="relative z-10 w-full pt-20 px-8 text-center flex flex-col items-center">
          <h1 className="font-alex text-[5.5rem] font-normal leading-none tracking-wide text-[#F3EBD8] drop-shadow-[0_4px_24px_rgba(0,0,0,0.95)]">
            Noviya &amp; Vishnu
          </h1>
        </div>

        {/* Middle & Bottom: Open candid view without footer text */}
        <div className="flex-1" aria-hidden="true" />
      </div>

      {/* =========================================================================
          PAGE 2: FORMAL WEDDING INVITATION
          ========================================================================= */}
      <div className="print-page relative w-[210mm] h-[297mm] overflow-hidden bg-[#EBE2DB] text-[#143D27] shadow-2xl print:shadow-none mx-auto mb-8 print:mb-0 flex flex-col justify-between border-t border-[#C5A059]/40">
        {/* Mandapam Floral Garland at Top - Full width banner */}
        <div className="pointer-events-none absolute top-0 left-0 right-0 z-10 flex justify-center overflow-hidden">
          <div className="relative w-full max-w-4xl h-[190px]">
            <img
              src="/images/mandapam-top-garland.jpg"
              alt="Traditional floral garland with jasmine and hanging brass lamps"
              className="w-full h-full object-cover object-top"
              style={{
                maskImage: 'linear-gradient(to bottom, black 75%, transparent 100%)',
                WebkitMaskImage: 'linear-gradient(to bottom, black 75%, transparent 100%)',
              }}
            />
          </div>
        </div>

        {/* Bottom Mandapam Decor (Brass Elephant, Lotus Uruli, Marble Floor) */}
        <div className="pointer-events-none absolute bottom-0 left-0 right-0 z-0 flex justify-center overflow-hidden">
          <img
            src="/images/mandapam-bottom-decor.jpg"
            alt="Traditional brass elephant, pink lotus flowers and marble floor"
            className="w-full h-[215px] object-cover object-bottom"
            style={{
              maskImage: 'linear-gradient(to top, black 78%, transparent 100%)',
              WebkitMaskImage: 'linear-gradient(to top, black 78%, transparent 100%)',
            }}
          />
        </div>

        {/* Decorative Gold Inset Border */}
        <div className="absolute inset-5 pointer-events-none border border-[#C5A059]/45 rounded-2xl z-20" />
        <div className="absolute inset-6 pointer-events-none border border-[#C5A059]/25 rounded-xl z-20" />

        {/* Top Spacer below garland - brings namaste hands & blessing down into open arch */}
        <div className="relative z-10 w-full h-[125px]" aria-hidden="true" />

        {/* Centerpiece Formal Invitation Content Canvas */}
        <div className="relative z-20 mx-auto flex w-full max-w-2xl flex-1 flex-col items-center justify-between px-10 text-center">
          {/* Top: Sacred Namaste Hands between leaves, then வாழ்க வளமுடன் • Vaazhga Valamudan */}
          <div className="pt-2 flex flex-col items-center">
            {/* Sacred Namaste / Vanakkam Hands with Bangles & Roses */}
            <div className="mb-3.5 flex justify-center">
              <img
                src="/images/namaste-hands.png"
                alt="Sacred Vanakkam / Namaste hands adorned with wedding bangles and rose garland"
                className="w-18 h-auto object-contain drop-shadow-[0_2px_8px_rgba(139,30,45,0.18)]"
              />
            </div>

            <div className="inline-flex items-center gap-3.5 text-center whitespace-nowrap">
              <KuthuvilakkuIcon className="w-5 h-7 shrink-0 text-[#8C6A14]" />
              <div className="flex flex-col items-center">
                <span
                  lang="ta"
                  className="font-tamil text-[1.95rem] text-[#163E26] font-bold tracking-wide"
                >
                  வாழ்க வளமுடன்
                </span>
                <span className="text-[0.74rem] uppercase tracking-[0.32em] text-[#8C6A14] font-semibold mt-0.5">
                  Vaazhga Valamudan
                </span>
              </div>
              <KuthuvilakkuIcon className="w-5 h-7 shrink-0 text-[#8C6A14]" />
            </div>
          </div>

          {/* Center: Overline and Couple's Names in the Center */}
          <div className="my-auto py-2 flex flex-col items-center justify-center">
            {/* Overline */}
            <p className="font-editorial text-base uppercase tracking-[0.22em] text-[#7A5A18] font-bold mb-6 max-w-xl mx-auto">
              Together with our families, we invite you to celebrate as
            </p>

            {/* Couple's Names: Centered */}
            <div className="py-1 flex flex-col items-center justify-center">
              <h2 className="font-editorial text-[4.3rem] font-bold tracking-wide text-[#163E26] leading-none">
                Noviya
              </h2>

              <div className="my-3.5 inline-flex items-center justify-center gap-3.5 font-cursive text-[2.8rem] text-[#B83227] font-bold">
                <span className="h-px w-14 bg-[#8C6A14]/40" />
                <span className="italic">weds</span>
                <span className="h-px w-14 bg-[#8C6A14]/40" />
              </div>

              <h2 className="font-editorial text-[4.3rem] font-bold tracking-wide text-[#163E26] leading-none">
                Vishnu Priyan
              </h2>

              {/* Wedding Date (with Sunday in same line in short font) & Venue with Location Icon */}
              <div className="mt-6 flex flex-col items-center gap-1.5">
                <p className="font-editorial text-2xl sm:text-3xl text-[#163E26] tracking-wide font-normal inline-flex items-baseline justify-center gap-2.5 sm:gap-3">
                  <span>December 13, 2026</span>
                  <span className="text-xs uppercase tracking-[0.22em] text-[#8C6A14] font-semibold font-sans">
                    • Sunday
                  </span>
                </p>
                <div className="flex items-center gap-1.5 text-xs sm:text-sm text-[#6D5537]">
                  <MapPin className="w-3.5 h-3.5 text-[#8C6A14] shrink-0" aria-hidden="true" />
                  <span>Serene Springs Farm, Hillsborough Township, NJ</span>
                </div>
              </div>

              {/* Grounding Antique Gold Zari Lotus Divider */}
              <div className="mt-5 w-72 opacity-90">
                <ZariLotusDivider />
              </div>
            </div>
          </div>

          {/* Empty bottom balancer anchor */}
          <div className="h-2" aria-hidden="true" />
        </div>

        {/* Bottom Spacer */}
        <div className="relative z-10 w-full h-[120px]" aria-hidden="true" />
      </div>

      {/* =========================================================================
          PAGE 3: WELCOMING & PARENT BLESSINGS (LINEAGE)
          ========================================================================= */}
      <div className="print-page relative w-[210mm] h-[297mm] overflow-hidden bg-[#EBE2DB] text-[#143D27] shadow-2xl print:shadow-none mx-auto mb-8 print:mb-0 flex flex-col justify-between items-center p-6 border-t border-[#C5A059]/40">
        {/* Mandapam Floral Garland at Top */}
        <div className="pointer-events-none absolute top-0 left-0 right-0 z-0 flex justify-center overflow-hidden">
          <div className="relative w-full h-[180px]">
            <img
              src="/images/mandapam-top-garland.jpg"
              alt="Traditional floral garland with jasmine and hanging brass lamps"
              className="w-full h-full object-cover object-top"
              style={{
                maskImage: 'linear-gradient(to bottom, black 75%, transparent 100%)',
                WebkitMaskImage: 'linear-gradient(to bottom, black 75%, transparent 100%)',
              }}
            />
          </div>
        </div>

        {/* Bottom Mandapam Decor */}
        <div className="pointer-events-none absolute bottom-0 left-0 right-0 z-0 flex justify-center overflow-hidden">
          <img
            src="/images/mandapam-bottom-decor.jpg"
            alt="Traditional brass elephant, pink lotus flowers and marble floor"
            className="w-full h-[160px] object-cover object-bottom"
            style={{
              maskImage: 'linear-gradient(to top, black 70%, transparent 100%)',
              WebkitMaskImage: 'linear-gradient(to top, black 70%, transparent 100%)',
            }}
          />
        </div>

        {/* Decorative Gold Inset Border */}
        <div className="absolute inset-5 pointer-events-none border border-[#C5A059]/45 rounded-2xl z-20" />
        <div className="absolute inset-6 pointer-events-none border border-[#C5A059]/25 rounded-xl z-20" />

        {/* Top spacer below garland */}
        <div className="relative z-10 w-full h-[90px]" aria-hidden="true" />

        {/* Regal Auspicious Beginning Framed Alabaster Canvas */}
        <div className="relative z-10 w-full max-w-2xl rounded-3xl border border-[#C5A059]/50 bg-[#E6D9C8]/95 py-9 px-8 text-[#143D27] shadow-lg backdrop-blur-sm my-auto">
          {/* Authentic Tamil Brahma Mudi / Sikku Kolam watermark in background */}
          <div
            aria-hidden="true"
            className="pointer-events-none absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 opacity-[0.14]"
          >
            <SikkuBrahmaMudiKolam className="w-[440px] h-[380px] text-[#8C6A14]" />
          </div>

          {/* Ornate Gold Corner Flourishes */}
          <CornerKolamFlourish className="absolute top-4 left-4 w-8 h-8" color="#8C6A14" />
          <CornerKolamFlourish className="absolute top-4 right-4 w-8 h-8 -scale-x-100" color="#8C6A14" />
          <CornerKolamFlourish className="absolute bottom-4 left-4 w-8 h-8 -scale-y-100" color="#8C6A14" />
          <CornerKolamFlourish className="absolute bottom-4 right-4 w-8 h-8 scale-[-1]" color="#8C6A14" />

          {/* Title Header */}
          <div className="text-center max-w-xl mx-auto pb-2 relative z-10">
            <h2
              lang="ta"
              className="font-tamil text-xl text-[#163E26] font-bold tracking-wide"
            >
              இரு மனம் இணையும் திருநாள்
            </h2>
            <p className="font-editorial text-xs italic uppercase tracking-[0.24em] text-[#8C6A14] font-semibold mt-1">
              An Auspicious Beginning
            </p>

            <div className="my-3 max-w-xs mx-auto">
              <ZariLotusDivider />
            </div>

            {/* Formal Invitation Blessing Text */}
            <p className="font-editorial text-[1.02rem] leading-relaxed text-[#143D27] font-normal text-center max-w-xl mx-auto px-2">
              Moments become memories because of the people we share them with. With the warm blessings of our loving parents, we cordially invite you to grace our wedding ceremony, and shower us with your prayers and{' '}
              <span lang="ta" className="font-tamil text-[#163E26] font-semibold">
                ஆசீர்வாதம்
              </span>{' '}
              (Blessings) as we step into a lifetime of togetherness.
            </p>
          </div>

          {/* Lineage Cards: The Groom & The Bride */}
          <div className="relative mt-7 pt-5 border-t border-[#C5A059]/35 w-full z-10">
            <div className="relative grid grid-cols-2 gap-6 items-stretch">
              {/* Sacred Nuptial Knot Overlay exactly in the middle */}
              <div
                aria-hidden="true"
                className="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-20 pointer-events-none flex items-center justify-center w-32"
              >
                <img
                  src="/images/sacred-wedding-knot-reversed.png"
                  alt="Sacred Nuptial Knot tying Groom and Bride"
                  className="w-full h-auto object-contain drop-shadow-[0_10px_20px_rgba(40,15,5,0.28)]"
                />
              </div>

              {/* The Groom Card */}
              <div className="w-full rounded-2xl border border-[#C5A059]/40 bg-[#FAF6EE]/92 px-4 py-5 text-center shadow-sm flex flex-col justify-between">
                <div>
                  <span className="inline-block text-[0.62rem] uppercase tracking-[0.26em] text-[#8C6A14] font-semibold mb-1">
                    <span lang="ta" className="font-tamil mr-1">மணமகன்</span> • The Groom
                  </span>
                  <h3 className="font-editorial text-xl text-[#163E26] font-bold tracking-wide leading-tight">
                    <span className="block whitespace-nowrap">Vishnu Priyan</span>
                    <span className="block whitespace-nowrap mt-0.5 text-base font-medium text-[#163E26]">Sellam Shanmugavel</span>
                  </h3>
                  <div className="my-2.5 flex items-center justify-center gap-2">
                    <span className="h-px w-6 bg-[#8C6A14]/35" />
                    <span className="text-[0.56rem] uppercase tracking-[0.22em] text-[#8C6A14] font-medium">Son of</span>
                    <span className="h-px w-6 bg-[#8C6A14]/35" />
                  </div>
                  <div className="font-editorial text-[0.92rem] text-[#143D27] font-semibold leading-snug">
                    <span className="block whitespace-nowrap">Shanmugavel Sellamuthu</span>
                    <span className="block text-xs text-[#8C6A14] font-normal my-0.5">&amp;</span>
                    <span className="block whitespace-nowrap">Jothikanmani Duraisamy</span>
                  </div>
                </div>
              </div>

              {/* The Bride Card */}
              <div className="w-full rounded-2xl border border-[#C5A059]/40 bg-[#FAF6EE]/92 px-4 py-5 text-center shadow-sm flex flex-col justify-between">
                <div>
                  <span className="inline-block text-[0.62rem] uppercase tracking-[0.26em] text-[#8C6A14] font-semibold mb-1">
                    <span lang="ta" className="font-tamil mr-1">மணமகள்</span> • The Bride
                  </span>
                  <h3 className="font-editorial text-xl text-[#163E26] font-bold tracking-wide leading-tight">
                    <span className="block whitespace-nowrap">Noviya</span>
                    <span className="block whitespace-nowrap mt-0.5 text-base font-medium text-[#163E26]">Balasubramanian</span>
                  </h3>
                  <div className="my-2.5 flex items-center justify-center gap-2">
                    <span className="h-px w-6 bg-[#8C6A14]/35" />
                    <span className="text-[0.56rem] uppercase tracking-[0.22em] text-[#8C6A14] font-medium">Daughter of</span>
                    <span className="h-px w-6 bg-[#8C6A14]/35" />
                  </div>
                  <div className="font-editorial text-[0.92rem] text-[#143D27] font-semibold leading-snug">
                    <span className="block whitespace-nowrap">Balasubramanian Velu</span>
                    <span className="block text-xs text-[#8C6A14] font-normal my-0.5">&amp;</span>
                    <span className="block whitespace-nowrap">Muthulakshmi Subbiah</span>
                  </div>
                </div>
                <div className="mt-2.5 pt-2 border-t border-[#C5A059]/25">
                  <span className="text-[0.56rem] uppercase tracking-[0.22em] text-[#8C6A14] font-medium block">
                    Sister of
                  </span>
                  <p className="font-editorial text-xs text-[#143D27] font-semibold mt-0.5">
                    Janashruthi Balasubramanian
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* Bottom spacer above decor */}
        <div className="relative z-10 w-full h-[90px]" aria-hidden="true" />
      </div>

      {/* =========================================================================
          PAGE 4: CEREMONY DETAILS, ORDER OF EVENTS & FAMILY BLESSINGS
          ========================================================================= */}
      <div className="print-page relative w-[210mm] h-[297mm] overflow-hidden bg-[#EBE2DB] text-[#143D27] shadow-2xl print:shadow-none mx-auto mb-8 print:mb-0 flex flex-col justify-between py-8 px-8 border-t border-[#C5A059]/40">
        {/* Mandapam Floral Garland at Top */}
        <div className="pointer-events-none absolute top-0 left-0 right-0 z-0 flex justify-center overflow-hidden">
          <div className="relative w-full h-[155px]">
            <img
              src="/images/mandapam-top-garland.jpg"
              alt="Traditional floral garland with jasmine and hanging brass lamps"
              className="w-full h-full object-cover object-top"
              style={{
                maskImage: 'linear-gradient(to bottom, black 65%, transparent 100%)',
                WebkitMaskImage: 'linear-gradient(to bottom, black 65%, transparent 100%)',
              }}
            />
          </div>
        </div>

        {/* Decorative Gold Inset Border */}
        <div className="absolute inset-5 pointer-events-none border border-[#C5A059]/45 rounded-2xl z-20" />
        <div className="absolute inset-6 pointer-events-none border border-[#C5A059]/25 rounded-xl z-20" />

        {/* Top spacer below garland */}
        <div className="relative z-10 w-full h-[110px]" aria-hidden="true" />

        {/* Section Heading - positioned comfortably below garland */}
        <div className="relative z-10 text-center">
          <h2
            lang="ta"
            className="font-tamil text-2xl text-[#163E26] font-bold tracking-wide"
          >
            சுப முகூர்த்தம் • கல்யாண விருந்து
          </h2>
          <p className="font-editorial text-xs uppercase tracking-[0.26em] text-[#8C6A14] font-semibold mt-1">
            Ceremony Details &amp; Order of Events
          </p>
          <div className="my-2 max-w-xs mx-auto">
            <ZariLotusDivider />
          </div>
        </div>

        {/* Date & Venue 2-Column Grid */}
        <div className="relative z-10 grid grid-cols-2 gap-4 max-w-2xl mx-auto w-full">
          {/* Date & Schedule */}
          <div className="rounded-xl border border-[#C5A059]/45 bg-[#FAF6EE]/95 p-3.5 flex items-start gap-3.5 shadow-sm">
            <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg border border-[#8C6A14]/40 bg-[#FAF6EE] text-[#8C6A14]">
              <Calendar className="w-4 h-4 text-[#8C6A14]" />
            </div>
            <div className="flex-1 min-w-0">
              <h4 className="text-[0.64rem] uppercase tracking-[0.20em] text-[#8C6A14] font-semibold">
                Date &amp; Schedule
              </h4>
              <p className="mt-0.5 font-editorial text-base text-[#163E26] font-bold leading-tight">
                {event.dateDisplay}
              </p>
              <p className="mt-0.5 inline-flex items-center gap-1.5 text-xs text-[#6D5537]">
                <Clock className="w-3.5 h-3.5 text-[#8C6A14] shrink-0" />
                <span className="font-medium">{event.ceremonyTime}</span>
              </p>
            </div>
          </div>

          {/* Wedding Venue & Address */}
          <div className="rounded-xl border border-[#C5A059]/45 bg-[#FAF6EE]/95 p-3.5 flex items-start gap-3.5 shadow-sm">
            <div className="flex h-9 w-9 shrink-0 items-center justify-center rounded-lg border border-[#8C6A14]/40 bg-[#FAF6EE] text-[#8C6A14]">
              <MapPin className="w-4 h-4 text-[#8C6A14]" />
            </div>
            <div className="flex-1 min-w-0">
              <h4 className="text-[0.64rem] uppercase tracking-[0.20em] text-[#8C6A14] font-semibold">
                Wedding Venue
              </h4>
              <p className="mt-0.5 font-editorial text-base text-[#163E26] font-bold leading-tight">
                {event.venueName}
              </p>
              <p className="mt-0.5 text-xs text-[#6D5537]">
                {event.addressLine}
              </p>
            </div>
          </div>
        </div>

        {/* Order of Events Card */}
        <div className="relative z-10 max-w-2xl mx-auto w-full my-1">
          <div className="flex items-center justify-center gap-2.5 mb-2">
            <div className="h-px flex-1 bg-[#8C6A14]/30" />
            <span className="text-[0.68rem] uppercase tracking-[0.22em] text-[#8C6A14] font-semibold">
              Order of Events • திருமண நிகழ்வுகள்
            </span>
            <div className="h-px flex-1 bg-[#8C6A14]/30" />
          </div>

          <div className="rounded-xl border border-[#C5A059]/45 bg-[#FAF6EE]/95 shadow-sm overflow-hidden divide-y divide-[#C5A059]/25">
            {event.agenda.map((item, idx) => {
              const isMuhurtham = item.highlight
              return (
                <div
                  key={idx}
                  className={`p-3.5 flex items-center justify-between gap-4 ${
                    isMuhurtham
                      ? 'bg-gradient-to-r from-[#FFFDF8] via-[#FBF0D8] to-[#FFFDF8] ring-1 ring-inset ring-[#8C6A14]/35'
                      : ''
                  }`}
                >
                  {/* Left Column: Time Badge */}
                  <div className="shrink-0 flex items-center">
                    <span
                      className={`inline-flex items-center gap-1.5 rounded-full px-3.5 py-1 text-xs font-semibold tracking-wider ${
                        isMuhurtham
                          ? 'bg-gradient-to-r from-[#8C6A14] via-[#A8833E] to-[#8C6A14] text-[#FFFDF8] shadow-sm'
                          : 'bg-[#8C6A14]/12 border border-[#8C6A14]/30 text-[#8C6A14]'
                      }`}
                    >
                      {isMuhurtham ? (
                        <Sparkles className="w-3.5 h-3.5 text-[#FFF8D6]" />
                      ) : (
                        <Clock className="w-3.5 h-3.5 text-[#8C6A14]" />
                      )}
                      <span>{item.time}</span>
                    </span>
                  </div>

                  {/* Right Column: Name & Tamil title */}
                  <div className="text-right flex flex-col items-end">
                    <div className="flex items-center gap-1.5">
                      <h4
                        className={`font-editorial ${
                          isMuhurtham
                            ? 'text-lg font-bold text-[#163E26]'
                            : 'text-base font-semibold text-[#163E26]'
                        }`}
                      >
                        {item.title}
                      </h4>
                    </div>
                    <span
                      lang="ta"
                      className="font-tamil text-xs text-[#8C6A14] mt-0.5 font-medium"
                    >
                      {item.tamilTitle}
                    </span>
                  </div>
                </div>
              )
            })}
          </div>

          {/* Temple Blessing Note */}
          <div className="mt-2.5 rounded-lg border border-[#8C6A14]/30 bg-[#E6D9C8]/70 p-2 text-center">
            <p className="font-editorial text-xs italic text-[#143D27] leading-relaxed">
              {event.feastNote}
            </p>
          </div>
        </div>

        {/* Concluding Blessings Section */}
        <div className="relative z-10 max-w-2xl mx-auto w-full pt-4 pb-2 border-t border-[#C5A059]/35 text-center flex flex-col items-center">
          <div className="flex items-center gap-2.5 mb-1.5">
            <KuthuvilakkuIcon className="w-4 h-6 text-[#8C6A14]" />
            <p lang="ta" className="font-tamil text-lg text-[#163E26] font-bold">
              வாழ்க வளமுடன் • Vaazhga Valamudan
            </p>
            <KuthuvilakkuIcon className="w-4 h-6 text-[#8C6A14]" />
          </div>

          <p className="font-editorial italic text-base text-[#163E26] mb-4">
            With prayers, love, and gratitude from our families
          </p>

          <p className="text-[0.72rem] uppercase tracking-[0.26em] text-[#6D5537] flex items-center justify-center gap-1.5 font-medium">
            <span>Made with</span>
            <Heart className="w-3.5 h-3.5 text-[#B83227] fill-[#B83227]" />
            <span>by Novi &amp; Vishnu</span>
          </p>
        </div>
      </div>
    </div>
  )
}
