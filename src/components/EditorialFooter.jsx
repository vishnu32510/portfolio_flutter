import { Heart, ArrowUp } from 'lucide-react'
import { WEDDING_CONFIG } from '../data/weddingConfig'
import { KuthuvilakkuIcon, ZariLotusDivider } from './TraditionalMotifs'

export function EditorialFooter() {
  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  return (
    <footer className="relative overflow-hidden bg-[#EBE2DB] text-[#143D27] py-14 sm:py-20 border-t border-[#C5A059]/30 text-center">
      <div className="relative z-10 mx-auto max-w-4xl safe-inline-pad flex flex-col items-center">
        {/* Sacred Tamil Blessing */}
        <div className="flex items-center gap-3 mb-2">
          <KuthuvilakkuIcon className="w-4 h-6 text-[#8C6A14]" />
          <p lang="ta" className="font-tamil text-lg sm:text-xl text-[#163E26] font-bold tracking-wide">
            {WEDDING_CONFIG.greeting.tamil}
          </p>
          <KuthuvilakkuIcon className="w-4 h-6 text-[#8C6A14]" />
        </div>

        <p className="text-[0.68rem] uppercase tracking-[0.28em] text-[#8C6A14] font-semibold mb-3">
          {WEDDING_CONFIG.greeting.transliteration}
        </p>

        <div className="my-2.5 w-full max-w-xs">
          <ZariLotusDivider />
        </div>

        <p className="font-editorial italic text-lg sm:text-xl text-[#163E26] max-w-lg mb-5 leading-relaxed">
          With prayers, love, and gratitude from our family
        </p>

        <p className="text-xs uppercase tracking-[0.24em] text-[#6D5537] flex items-center justify-center gap-1.5 mb-7 font-medium">
          <span>Made with</span>
          <Heart className="w-3.5 h-3.5 text-[#B83227] fill-[#B83227]" aria-hidden="true" />
          <span>by Novi &amp; Vishnu</span>
        </p>

        {/* Action Buttons: Download PDF & Scroll Back to Top */}
        <div className="flex flex-wrap items-center justify-center gap-3">
          <a
            href="/?print=true"
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center gap-2 rounded-full border border-[#8C6A14]/45 bg-[#FAF6EE] px-5 py-2.5 text-[0.68rem] font-semibold uppercase tracking-[0.24em] text-[#163E26] hover:bg-[#8C6A14]/15 hover:border-[#8C6A14] hover:scale-[1.02] transition-all cursor-pointer shadow-sm"
          >
            <span>Printable PDF Invite</span>
          </a>

          <button
            type="button"
            onClick={scrollToTop}
            className="inline-flex items-center gap-2 rounded-full border border-[#8C6A14]/45 bg-[#FAF6EE] px-5 py-2.5 text-[0.68rem] font-semibold uppercase tracking-[0.24em] text-[#163E26] hover:bg-[#8C6A14]/15 hover:border-[#8C6A14] hover:scale-[1.02] transition-all cursor-pointer shadow-sm"
          >
            <ArrowUp className="w-3.5 h-3.5 text-[#8C6A14]" />
            <span>Back to Top</span>
          </button>
        </div>
      </div>
    </footer>
  )
}

