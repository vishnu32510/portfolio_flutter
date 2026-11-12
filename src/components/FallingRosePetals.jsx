import { useMemo } from 'react'

/**
 * Authentic Falling Rose & Lotus Petals
 * Features:
 * - Steady constant vertical descent (linear timing) so it NEVER slows down in the middle
 * - Slow, serene drift (12s - 17s float)
 * - Fades smoothly after the middle and reaches the bottom completely faded as a whole
 * - Reduced petal count (6 sparse, elegant petals)
 * - Velvety Indian red rose & soft blush lotus gradients
 */
export function FallingRosePetals({ count = 6 }) {
  const petals = useMemo(() => {
    return Array.from({ length: count }).map((_, i) => {
      // Spread across width: ~10% to ~90% with subtle natural organic variation
      const left = 10 + (i * 78) / Math.max(1, count - 1) + (Math.sin(i * 2.7) * 2.5)
      const duration = 12 + (i % 3) * 2.2 // 12s to 16.4s (slow, tranquil float)
      // Evenly spaced negative delays so petals are already mid-flight in balanced phases
      const negativeDelay = -((i * (duration / count) + (i % 2) * 1.5) % duration)
      const size = 17 + (i % 3) * 3 // 17px to 23px
      const isBlush = i % 2 === 1
      const sway = (i % 2 === 0 ? 1 : -1) * (18 + (i % 3) * 8)
      const startRotate = (i * 59) % 360

      return {
        id: i,
        left,
        duration,
        negativeDelay,
        size,
        isBlush,
        sway,
        startRotate,
      }
    })
  }, [count])

  return (
    <div
      className="pointer-events-none absolute inset-0 overflow-hidden z-15 select-none"
      aria-hidden="true"
    >
      <style>{`
        @keyframes petalFallDrift {
          0% {
            transform: translate3d(0, -6vh, 0) rotate(var(--petal-rot-start, 0deg)) rotateX(0deg) rotateY(0deg);
            opacity: 0;
          }
          8% {
            opacity: 0.92;
          }
          25% {
            transform: translate3d(var(--petal-sway, 20px), 21.5vh, 0) rotate(calc(var(--petal-rot-start, 0deg) + 85deg)) rotateX(70deg) rotateY(40deg);
            opacity: 0.92;
          }
          50% {
            transform: translate3d(calc(var(--petal-sway, 20px) * -0.7), 49vh, 0) rotate(calc(var(--petal-rot-start, 0deg) + 180deg)) rotateX(160deg) rotateY(100deg);
            opacity: 0.90;
          }
          62% {
            opacity: 0.70;
          }
          75% {
            transform: translate3d(calc(var(--petal-sway, 20px) * 0.75), 76.5vh, 0) rotate(calc(var(--petal-rot-start, 0deg) + 270deg)) rotateX(250deg) rotateY(170deg);
            opacity: 0.38;
          }
          88% {
            opacity: 0.12;
          }
          100% {
            transform: translate3d(calc(var(--petal-sway, 20px) * -0.3), 104vh, 0) rotate(calc(var(--petal-rot-start, 0deg) + 360deg)) rotateX(360deg) rotateY(360deg);
            opacity: 0;
          }
        }
      `}</style>

      <svg className="absolute w-0 h-0" aria-hidden="true" focusable="false">
        <defs>
          {/* Deep Indian Red Rose Petal Gradient */}
          <radialGradient id="rose-petal-crimson-css" cx="42%" cy="35%" r="68%">
            <stop offset="0%" stopColor="#F48398" />
            <stop offset="38%" stopColor="#C92A42" />
            <stop offset="82%" stopColor="#8A1325" />
            <stop offset="100%" stopColor="#5E0B19" />
          </radialGradient>

          {/* Soft Blush Lotus Petal Gradient */}
          <radialGradient id="rose-petal-blush-css" cx="40%" cy="32%" r="65%">
            <stop offset="0%" stopColor="#FFB3C2" />
            <stop offset="42%" stopColor="#E24B6D" />
            <stop offset="85%" stopColor="#A8203D" />
            <stop offset="100%" stopColor="#750E24" />
          </radialGradient>
        </defs>
      </svg>

      {petals.map((p) => (
        <div
          key={p.id}
          className="absolute top-0 will-change-transform"
          style={{
            left: `${p.left}%`,
            width: `${p.size}px`,
            height: `${p.size * 1.18}px`,
            '--petal-sway': `${p.sway}px`,
            '--petal-rot-start': `${p.startRotate}deg`,
            animation: `petalFallDrift ${p.duration}s linear infinite`,
            animationDelay: `${p.negativeDelay}s`,
          }}
        >
          <svg
            viewBox="0 0 24 28"
            className="w-full h-full drop-shadow-[0_2px_5px_rgba(90,14,25,0.2)]"
            fill="none"
          >
            {/* Natural Rose Petal Outline */}
            <path
              d="M12 2 C17.5 2.5, 22.5 8, 22 15 C21.5 22, 16.5 26, 12 26.5 C7.5 26, 2.5 22, 2 15 C1.5 8, 6.5 2.5, 12 2 Z"
              fill={p.isBlush ? 'url(#rose-petal-blush-css)' : 'url(#rose-petal-crimson-css)'}
            />
            {/* Subtle inner petal curl curve & highlight */}
            <path
              d="M12 4.5 Q12.5 15 11 23"
              stroke="rgba(255, 255, 255, 0.35)"
              strokeWidth="0.7"
              strokeLinecap="round"
            />
            <path
              d="M8 8 Q12 10 16 8"
              stroke="rgba(255, 255, 255, 0.18)"
              strokeWidth="0.6"
              strokeLinecap="round"
            />
          </svg>
        </div>
      ))}
    </div>
  )
}
