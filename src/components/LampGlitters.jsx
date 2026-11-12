import { motion } from 'framer-motion'

/**
 * Precisely mapped coordinates of the hanging brass oil lamps (Thooku Vilakku)
 * in the mandapam garland backdrop (viewBox: 0 0 681 420).
 * Matches preserveAspectRatio="xMidYMin slice" for 100% responsiveness on mobile & desktop.
 */
const LAMP_SPARKLES = [
  // 1. Upper-Left Hanging Brass Lamp (under banana leaf arch)
  { x: 154, y: 140, size: 15, delay: 0.1, duration: 2.2 },
  { x: 142, y: 144, size: 11, delay: 0.6, duration: 2.6 },
  { x: 166, y: 143, size: 11, delay: 1.2, duration: 2.4 },
  { x: 150, y: 135, size: 10, delay: 1.8, duration: 2.0 },
  { x: 179, y: 44, size: 8, delay: 1.5, duration: 3.0 },

  // 2. Lower-Left Hanging Brass Lamp (hanging down near garland edge)
  { x: 67, y: 366, size: 15, delay: 0.3, duration: 2.3 },
  { x: 55, y: 368, size: 11, delay: 0.9, duration: 2.5 },
  { x: 78, y: 364, size: 10, delay: 1.5, duration: 2.2 },
  { x: 32, y: 362, size: 14, delay: 0.5, duration: 2.4 },
  { x: 24, y: 356, size: 10, delay: 1.1, duration: 2.2 },
  { x: 88, y: 161, size: 9, delay: 1.3, duration: 2.7 },

  // 3. Upper-Right Hanging Brass Lamp (under right banana leaf arch)
  { x: 516, y: 107, size: 16, delay: 0.2, duration: 2.1 },
  { x: 504, y: 112, size: 11, delay: 0.8, duration: 2.6 },
  { x: 530, y: 108, size: 11, delay: 1.4, duration: 2.3 },
  { x: 518, y: 99, size: 10, delay: 1.9, duration: 2.0 },
  { x: 580, y: 44, size: 8, delay: 2.1, duration: 3.1 },

  // 4. Lower-Right Hanging Brass Lamp (hanging down on right edge)
  { x: 616, y: 323, size: 15, delay: 0.4, duration: 2.3 },
  { x: 602, y: 320, size: 11, delay: 1.1, duration: 2.5 },
  { x: 632, y: 326, size: 10, delay: 1.7, duration: 2.8 },
  { x: 654, y: 362, size: 12, delay: 0.7, duration: 2.2 },
  { x: 666, y: 205, size: 8, delay: 1.4, duration: 2.9 },

  // 5. Delicate festive golden accents on garland chain highlights
  { x: 262, y: 24, size: 7, delay: 1.6, duration: 3.0 },
  { x: 444, y: 22, size: 7, delay: 2.2, duration: 2.8 },
]

function SparkleStar({ x, y, size, delay, duration }) {
  return (
    <motion.g
      transform={`translate(${x}, ${y})`}
      animate={{
        scale: [0.65, 1.45, 0.75, 1.6, 0.65],
        opacity: [0.35, 1, 0.5, 0.98, 0.35],
        rotate: [0, 45, 90, 135, 180],
      }}
      transition={{
        duration,
        repeat: Infinity,
        ease: 'easeInOut',
        delay,
      }}
      style={{ transformOrigin: `${x}px ${y}px` }}
    >
      {/* Soft warm circular amber bloom */}
      <circle cx={x} cy={y} r={size * 1.35} fill="url(#lamp-flame-radial)" opacity="0.85" />

      {/* 4-point sharp star with curved concave rays */}
      <path
        d={`M ${x} ${y - size} Q ${x} ${y} ${x + size} ${y} Q ${x} ${y} ${x} ${y + size} Q ${x} ${y} ${x - size} ${y} Q ${x} ${y} ${x} ${y - size} Z`}
        fill="#FFFDF6"
        filter="url(#lamp-glitter-glow)"
      />

      {/* Diagonal micro star cross */}
      <path
        d={`M ${x - size * 0.45} ${y - size * 0.45} L ${x + size * 0.45} ${y + size * 0.45} M ${x - size * 0.45} ${y + size * 0.45} L ${x + size * 0.45} ${y - size * 0.45}`}
        stroke="#FFE885"
        strokeWidth="0.9"
        strokeLinecap="round"
        opacity="0.95"
      />

      {/* Radiant pure white pinpoint center */}
      <circle cx={x} cy={y} r={size * 0.22} fill="#FFFFFF" />
    </motion.g>
  )
}

/**
 * Hanging Lamp Glitters Overlay
 * Adds small shiny lights / glittering sparkles directly on the brass lamps in the backdrop image.
 */
export function LampGlitters({ className = '' }) {
  return (
    <svg
      viewBox="0 0 681 420"
      preserveAspectRatio="xMidYMin slice"
      className={`absolute inset-0 w-full h-full pointer-events-none z-10 ${className}`}
      aria-hidden="true"
    >
      <defs>
        {/* Warm golden radial aura for the flame wick */}
        <radialGradient id="lamp-flame-radial" cx="50%" cy="50%" r="50%">
          <stop offset="0%" stopColor="#FFFFFF" stopOpacity="1" />
          <stop offset="25%" stopColor="#FFF3B8" stopOpacity="0.9" />
          <stop offset="60%" stopColor="#F59E0B" stopOpacity="0.6" />
          <stop offset="100%" stopColor="#D97706" stopOpacity="0" />
        </radialGradient>

        {/* Subtle blur for realistic glimmer */}
        <filter id="lamp-glitter-glow" x="-30%" y="-30%" width="160%" height="160%">
          <feGaussianBlur stdDeviation="0.9" result="blur" />
          <feMerge>
            <feMergeNode in="blur" />
            <feMergeNode in="SourceGraphic" />
          </feMerge>
        </filter>
      </defs>

      {LAMP_SPARKLES.map((sparkle, idx) => (
        <SparkleStar key={idx} {...sparkle} />
      ))}
    </svg>
  )
}
