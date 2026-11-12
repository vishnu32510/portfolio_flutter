import { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'
import { Sparkles, ChevronDown } from 'lucide-react'

export function RoyalWaxSeal({ onOpen, isOpen }) {
  const [isHovered, setIsHovered] = useState(false)

  return (
    <div className="relative flex flex-col items-center justify-center py-6">
      {/* Golden Pulse Ring */}
      <motion.div
        animate={{
          scale: [1, 1.15, 1],
          opacity: [0.35, 0.7, 0.35],
        }}
        transition={{
          duration: 3,
          repeat: Infinity,
          ease: 'easeInOut',
        }}
        className="pointer-events-none absolute h-36 w-36 rounded-full border border-gold-400/40"
      />

      <motion.div
        animate={{
          scale: [1, 1.28, 1],
          opacity: [0.15, 0.45, 0.15],
        }}
        transition={{
          duration: 3,
          delay: 0.5,
          repeat: Infinity,
          ease: 'easeInOut',
        }}
        className="pointer-events-none absolute h-48 w-48 rounded-full border border-gold-400/25"
      />

      {/* Royal Monogram Medallion */}
      <motion.button
        type="button"
        onClick={onOpen}
        onMouseEnter={() => setIsHovered(true)}
        onMouseLeave={() => setIsHovered(false)}
        whileHover={{ scale: 1.06 }}
        whileTap={{ scale: 0.96 }}
        className="group relative z-10 flex h-28 w-28 sm:h-32 sm:w-32 cursor-pointer items-center justify-center rounded-full bg-gradient-to-br from-[#4A0A15] via-[#2A050D] to-[#1F0308] p-1.5 shadow-[0_12px_36px_rgba(0,0,0,0.65),0_0_28px_rgba(212,175,55,0.35)] transition-all"
        style={{
          boxShadow: isHovered
            ? '0 16px 44px rgba(0,0,0,0.75), 0 0 36px rgba(244,184,41,0.55)'
            : '0 12px 36px rgba(0,0,0,0.65), 0 0 24px rgba(212,175,55,0.28)',
        }}
        aria-label="Open wedding invitation"
      >
        {/* Outer Wax Scallop Border */}
        <div className="absolute inset-1 rounded-full border-2 border-dashed border-gold-400/50" />

        {/* Inner Gold Foil Seal Face */}
        <div className="relative flex h-full w-full flex-col items-center justify-center rounded-full border border-gold-400/80 bg-gradient-to-b from-[#3E0811] via-[#25040B] to-[#1A0307] text-center p-2">
          {/* Top Lotus Crown */}
          <svg
            className="w-4 h-3 sm:w-5 sm:h-3.5 text-gold-400 mb-0.5"
            viewBox="0 0 32 20"
            fill="currentColor"
            aria-hidden="true"
          >
            <path d="M16 2 C15 7, 12 12, 6 15 C11 16, 14 14, 16 9 C18 14, 21 16, 26 15 C20 12, 17 7, 16 2 Z" />
            <path d="M16 9 C14 13, 11 16, 4 18 C10 19, 14 17, 16 13 C18 17, 22 19, 28 18 C21 16, 18 13, 16 9 Z" opacity="0.6" />
          </svg>

          {/* Intertwined Initials V & N */}
          <div className="flex items-center justify-center font-heading text-xl sm:text-2xl font-bold tracking-tight text-transparent bg-clip-text bg-gradient-to-b from-[#FFF0C2] via-[#E2B755] to-[#A3781E] drop-shadow-[0_1px_2px_rgba(0,0,0,0.8)]">
            <span>V</span>
            <span className="mx-0.5 text-xs text-gold-400 font-serif italic">&amp;</span>
            <span>N</span>
          </div>

          {/* Auspicious Tamil Subline */}
          <span lang="ta" className="font-tamil text-[0.45rem] sm:text-[0.52rem] text-turmeric-200/90 font-medium tracking-wider mt-0.5">
            வாழ்க வளமுடன்
          </span>
        </div>
      </motion.button>

      {/* Invitation Prompt */}
      <motion.div
        animate={{ y: [0, 4, 0] }}
        transition={{ duration: 2, repeat: Infinity, ease: 'easeInOut' }}
        className="mt-4 flex flex-col items-center text-center cursor-pointer"
        onClick={onOpen}
      >
        <span className="text-[0.68rem] sm:text-xs uppercase tracking-[0.26em] text-gold-300 font-medium">
          Tap to Open Invitation
        </span>
        <span lang="ta" className="font-tamil text-[0.62rem] sm:text-[0.7rem] text-turmeric-200/75 mt-0.5">
          அழைப்பிதழைத் திறக்க
        </span>
        <ChevronDown className="w-4 h-4 text-gold-400/80 mt-1" />
      </motion.div>
    </div>
  )
}

