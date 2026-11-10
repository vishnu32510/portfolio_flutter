import { motion } from 'framer-motion'

/**
 * Authentic South Indian Pulli / Sikku Kolam Mandala
 * Features 8-fold lotus symmetry, interlaced kambi loops, and sacred pulli dots.
 */
export function PulliKolamMandala({ className = 'w-24 h-24', strokeColor = 'currentColor' }) {
  const angles = [0, 45, 90, 135, 180, 225, 270, 315]
  return (
    <svg
      viewBox="0 0 200 200"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      aria-hidden="true"
      focusable="false"
    >
      {/* Outer sacred dotted ring */}
      <circle
        cx="100"
        cy="100"
        r="92"
        stroke={strokeColor}
        strokeWidth="1"
        strokeDasharray="2 5"
        opacity="0.65"
      />
      <circle cx="100" cy="100" r="84" stroke={strokeColor} strokeWidth="1.2" opacity="0.45" />

      {/* 8-fold Sikku Kolam woven petals */}
      {angles.map((deg) => (
        <g key={deg} transform={`rotate(${deg} 100 100)`}>
          <path
            d="M100 18 C116 36, 120 62, 100 80 C80 62, 84 36, 100 18 Z"
            stroke={strokeColor}
            strokeWidth="1.6"
            strokeLinejoin="round"
          />
          <path
            d="M100 28 C110 42, 110 58, 100 70 C90 58, 90 42, 100 28 Z"
            stroke={strokeColor}
            strokeWidth="1"
            opacity="0.7"
          />
          {/* Pulli (sacred rice-flour dot) inside each petal */}
          <circle cx="100" cy="48" r="2.3" fill={strokeColor} />
          {/* Outer cardinal & intercardinal pulli dots */}
          <circle cx="100" cy="12" r="1.8" fill={strokeColor} opacity="0.85" />
        </g>
      ))}

      {/* Interlocking diamond squares (traditional Sikku frame) */}
      <rect
        x="58"
        y="58"
        width="84"
        height="84"
        rx="8"
        stroke={strokeColor}
        strokeWidth="1.4"
        opacity="0.75"
      />
      <rect
        x="58"
        y="58"
        width="84"
        height="84"
        rx="8"
        transform="rotate(45 100 100)"
        stroke={strokeColor}
        strokeWidth="1.4"
        opacity="0.75"
      />

      {/* Inner lotus core */}
      <circle cx="100" cy="100" r="22" stroke={strokeColor} strokeWidth="1.6" />
      <circle cx="100" cy="100" r="12" stroke={strokeColor} strokeWidth="1.2" opacity="0.85" />
      <circle cx="100" cy="100" r="4.5" fill={strokeColor} />
    </svg>
  )
}

/**
 * Top Marigold Garland & Mango Leaf Festoon (Maavilai + Malligai/chendumalli Thoranam)
 */
export function MarigoldThoranam({ className = '' }) {
  return (
    <div
      className={`pointer-events-none select-none w-full overflow-hidden ${className}`}
      aria-hidden="true"
    >
      <svg
        viewBox="0 0 1200 92"
        preserveAspectRatio="none"
        className="w-full h-14 sm:h-18 md:h-22 block"
        xmlns="http://www.w3.org/2000/svg"
      >
        <defs>
          <pattern id="thoranam-swag" x="0" y="0" width="200" height="92" patternUnits="userSpaceOnUse">
            {/* Gold Zari cord along top */}
            <line x1="0" y1="6" x2="200" y2="6" stroke="#D4AF37" strokeWidth="3" />

            {/* Sacred Maavilai (Mango Leaves) tucked along top cord */}
            {[20, 60, 100, 140, 180].map((lx) => (
              <g key={lx} transform={`translate(${lx}, 6)`}>
                <path
                  d="M0 0 C-7 10, -6 22, 0 30 C6 22, 7 10, 0 0 Z"
                  fill="#2F5D31"
                  stroke="#D4AF37"
                  strokeWidth="0.8"
                />
                <line x1="0" y1="2" x2="0" y2="27" stroke="#8FB973" strokeWidth="0.7" opacity="0.8" />
              </g>
            ))}

            {/* Scalloped Marigold Garland Arch */}
            {[
              { cx: 14, cy: 16, c: '#F4B829' },
              { cx: 30, cy: 29, c: '#E67E22' },
              { cx: 50, cy: 40, c: '#F4B829' },
              { cx: 74, cy: 48, c: '#E67E22' },
              { cx: 100, cy: 51, c: '#F4B829' },
              { cx: 126, cy: 48, c: '#E67E22' },
              { cx: 150, cy: 40, c: '#F4B829' },
              { cx: 170, cy: 29, c: '#E67E22' },
              { cx: 186, cy: 16, c: '#F4B829' },
            ].map((b, idx) => (
              <g key={idx}>
                <circle cx={b.cx} cy={b.cy} r="9.5" fill={b.c} />
                <circle
                  cx={b.cx}
                  cy={b.cy}
                  r="6.5"
                  fill="none"
                  stroke="#FFF3C4"
                  strokeWidth="1"
                  strokeDasharray="2 2"
                  opacity="0.75"
                />
                <circle cx={b.cx} cy={b.cy} r="2.5" fill="#9A3412" opacity="0.65" />
              </g>
            ))}

            {/* Vertical Jasmine & Marigold Tassel at each join */}
            <g transform="translate(0, 8)">
              <circle cx="0" cy="8" r="8" fill="#E67E22" />
              <circle cx="0" cy="22" r="5" fill="#FFFDF6" />
              <circle cx="0" cy="32" r="5" fill="#FFFDF6" />
              <circle cx="0" cy="44" r="7.5" fill="#F4B829" />
              <circle cx="0" cy="58" r="6" fill="#E67E22" />
              <path d="M0 65 L-4 76 L0 82 L4 76 Z" fill="#D4AF37" />
            </g>
            <g transform="translate(200, 8)">
              <circle cx="0" cy="8" r="8" fill="#E67E22" />
              <circle cx="0" cy="22" r="5" fill="#FFFDF6" />
              <circle cx="0" cy="32" r="5" fill="#FFFDF6" />
              <circle cx="0" cy="44" r="7.5" fill="#F4B829" />
              <circle cx="0" cy="58" r="6" fill="#E67E22" />
              <path d="M0 65 L-4 76 L0 82 L4 76 Z" fill="#D4AF37" />
            </g>
          </pattern>
        </defs>
        <rect width="1200" height="92" fill="url(#thoranam-swag)" />
      </svg>
    </div>
  )
}

/**
 * Traditional Brass Temple Bell (Kovil Mani) with gentle pendulum sway
 */
export function HangingTempleBell({
  className = 'w-12 h-36',
  chainLength = 52,
  delay = 0,
}) {
  return (
    <motion.div
      aria-hidden="true"
      style={{ transformOrigin: 'top center' }}
      animate={{ rotate: [-2.2, 2.2, -2.2] }}
      transition={{
        duration: 5.5,
        repeat: Infinity,
        ease: 'easeInOut',
        delay,
      }}
      className={`pointer-events-none select-none ${className}`}
    >
      <svg
        viewBox={`0 0 64 ${chainLength + 76}`}
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        className="w-full h-full drop-shadow-[0_6px_12px_rgba(0,0,0,0.45)]"
      >
        <defs>
          <linearGradient id="brassBellGrad" x1="12" y1="0" x2="52" y2="60" gradientUnits="userSpaceOnUse">
            <stop offset="0%" stopColor="#F5E6BA" />
            <stop offset="45%" stopColor="#D4AF37" />
            <stop offset="82%" stopColor="#9A7418" />
            <stop offset="100%" stopColor="#EAD18F" />
          </linearGradient>
        </defs>

        {/* Brass chain links */}
        {Array.from({ length: Math.floor(chainLength / 10) }).map((_, idx) => (
          <rect
            key={idx}
            x="29"
            y={idx * 10 + 2}
            width="6"
            height="11"
            rx="3"
            stroke="#D4AF37"
            strokeWidth="2"
          />
        ))}

        {/* Bell crown & body */}
        <g transform={`translate(0, ${chainLength})`}>
          <circle cx="32" cy="6" r="5" stroke="#EAD18F" strokeWidth="2" fill="#8C6A14" />
          <rect x="26" y="10" width="12" height="6" rx="2" fill="url(#brassBellGrad)" />
          <path
            d="M22 16 C20 28, 15 40, 10 49 L54 49 C49 40, 44 28, 42 16 Z"
            fill="url(#brassBellGrad)"
            stroke="#F5E6BA"
            strokeWidth="0.9"
          />
          {/* Engraved temple rings on bell */}
          <line x1="19" y1="32" x2="45" y2="32" stroke="#6E500B" strokeWidth="1.1" opacity="0.65" />
          <line x1="15" y1="42" x2="49" y2="42" stroke="#6E500B" strokeWidth="1.2" opacity="0.7" />
          {/* Flared bell rim */}
          <rect x="8" y="48" width="48" height="5" rx="2.5" fill="url(#brassBellGrad)" />
          {/* Clapper (Mani Naakku) */}
          <line x1="32" y1="53" x2="32" y2="60" stroke="#EAD18F" strokeWidth="2" />
          <circle cx="32" cy="62" r="4.5" fill="#F4B829" stroke="#8C6A14" strokeWidth="1" />
        </g>
      </svg>
    </motion.div>
  )
}

/**
 * Sacred Banana Leaf (Vazhai Ilai) Botanical Motif
 */
export function BananaLeafMotif({ className = 'w-40 h-72', flip = false }) {
  return (
    <svg
      viewBox="0 0 160 320"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={`pointer-events-none select-none ${flip ? '-scale-x-100' : ''} ${className}`}
      aria-hidden="true"
      focusable="false"
    >
      <defs>
        <linearGradient id="vazhaiGrad" x1="0" y1="0" x2="140" y2="310" gradientUnits="userSpaceOnUse">
          <stop offset="0%" stopColor="#4A7C44" stopOpacity="0.45" />
          <stop offset="55%" stopColor="#2F5D31" stopOpacity="0.32" />
          <stop offset="100%" stopColor="#D4AF37" stopOpacity="0.22" />
        </linearGradient>
      </defs>
      {/* Graceful arched banana leaf blade with natural tropical notches */}
      <path
        d="M18 310 C18 220, 32 132, 86 58 L76 62 C95 36, 118 18, 142 8 C138 40, 130 76, 114 114 L104 112 C94 148, 78 190, 56 236 L48 232 C38 260, 28 286, 18 310 Z"
        fill="url(#vazhaiGrad)"
        stroke="#4A7C44"
        strokeOpacity="0.35"
        strokeWidth="1.4"
      />
      {/* Central midrib */}
      <path
        d="M18 310 C42 216, 82 108, 140 10"
        stroke="#B88F22"
        strokeOpacity="0.5"
        strokeWidth="2"
        strokeLinecap="round"
      />
      {/* Parallel lateral veins characteristic of Vazhai Ilai */}
      {[45, 80, 115, 150, 185, 220, 255].map((y, i) => {
        const xMid = 132 - i * 15
        return (
          <g key={y} stroke="#4A7C44" strokeOpacity="0.28" strokeWidth="1">
            <path d={`M${xMid} ${y} Q${xMid - 18} ${y - 8}, ${xMid - 28} ${y - 2}`} />
            <path d={`M${xMid} ${y} Q${xMid + 14} ${y + 10}, ${xMid + 22} ${y + 18}`} />
          </g>
        )
      })}
    </svg>
  )
}

/**
 * Auspicious Tamil Brass Oil Lamp (Kuthuvilakku)
 */
export function KuthuvilakkuIcon({ className = 'w-7 h-9' }) {
  return (
    <svg
      viewBox="0 0 48 64"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      aria-hidden="true"
      focusable="false"
    >
      {/* Glowing turmeric-gold flame */}
      <path
        d="M24 4 C28 11, 30 16, 24 21 C18 16, 20 11, 24 4 Z"
        fill="#F4B829"
      />
      <path
        d="M24 9 C26 13, 26.5 16, 24 19 C21.5 16, 22 13, 24 9 Z"
        fill="#FFFDF6"
      />
      {/* Side wick flames */}
      <path d="M11 22 C13 25, 13 27, 11 29 C9 27, 9 25, 11 22 Z" fill="#F4B829" />
      <path d="M37 22 C39 25, 39 27, 37 29 C35 27, 35 25, 37 22 Z" fill="#F4B829" />
      {/* Five-wick oil basin */}
      <path
        d="M8 30 L40 30 C37 36, 31 38, 24 38 C17 38, 11 36, 8 30 Z"
        fill="#D4AF37"
      />
      {/* Carved pillar & lotus base */}
      <rect x="21.5" y="38" width="5" height="15" rx="1.5" fill="#D4AF37" />
      <ellipse cx="24" cy="45" rx="5.5" ry="2" fill="#EAD18F" />
      <path d="M13 57 C16 52, 32 52, 35 57 L38 60 L10 60 Z" fill="#D4AF37" />
    </svg>
  )
}

/**
 * Zari Antique Gold Ornamental Lotus Divider
 */
export function ZariLotusDivider({ className = '', light = false }) {
  const stroke = light ? '#EAD18F' : '#B88F22'
  const accent = light ? '#F4B829' : '#D4AF37'

  return (
    <div
      className={`flex items-center justify-center gap-3 w-full max-w-md mx-auto ${className}`}
      aria-hidden="true"
    >
      <div
        className="h-px flex-1"
        style={{
          background: `linear-gradient(90deg, transparent 0%, ${stroke} 100%)`,
        }}
      />
      <svg viewBox="0 0 64 28" className="w-14 h-6 shrink-0" fill="none">
        <circle cx="8" cy="14" r="2" fill={accent} />
        <path
          d="M32 3 C36 9, 38 14, 32 21 C26 14, 28 9, 32 3 Z"
          stroke={stroke}
          strokeWidth="1.5"
          fill={accent}
          fillOpacity="0.25"
        />
        <path
          d="M32 21 C24 19, 19 14, 20 8 C25 10, 29 15, 32 21 Z"
          stroke={stroke}
          strokeWidth="1.3"
        />
        <path
          d="M32 21 C40 19, 45 14, 44 8 C39 10, 35 15, 32 21 Z"
          stroke={stroke}
          strokeWidth="1.3"
        />
        <circle cx="32" cy="24.5" r="1.8" fill={accent} />
        <circle cx="56" cy="14" r="2" fill={accent} />
      </svg>
      <div
        className="h-px flex-1"
        style={{
          background: `linear-gradient(90deg, ${stroke} 0%, transparent 100%)`,
        }}
      />
    </div>
  )
}

/**
 * Delicate Corner Kolam Flourish for framing invitation cards
 */
export function CornerKolamFlourish({ className = 'w-12 h-12', color = '#D4AF37' }) {
  return (
    <svg
      viewBox="0 0 48 48"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={`pointer-events-none select-none ${className}`}
      aria-hidden="true"
      focusable="false"
    >
      <path
        d="M4 44 L4 12 C4 7.5 7.5 4 12 4 L44 4"
        stroke={color}
        strokeWidth="1.5"
        strokeLinecap="round"
      />
      <path
        d="M10 34 L10 15 C10 12.2 12.2 10 15 10 L34 10"
        stroke={color}
        strokeWidth="1"
        opacity="0.7"
        strokeLinecap="round"
      />
      <path d="M4 22 C14 22, 22 14, 22 4" stroke={color} strokeWidth="1.2" opacity="0.8" />
      <circle cx="15" cy="15" r="2" fill={color} />
      <circle cx="8" cy="28" r="1.4" fill={color} opacity="0.75" />
      <circle cx="28" cy="8" r="1.4" fill={color} opacity="0.75" />
    </svg>
  )
}

