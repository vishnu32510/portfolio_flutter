import { motion } from 'framer-motion'

// The 13 sacred pulli (dots) of the traditional Tamil Brahma Mudi / Sikku Kolam (5-to-1 diamond)
const PULLI_DOTS = [
  { cx: 161.7, cy: 56.6, r: 4.2 },
  { cx: 119.1, cy: 100.5, r: 4.3 },
  { cx: 161.5, cy: 100.5, r: 4.1 },
  { cx: 204.5, cy: 100.6, r: 4.1 },
  { cx: 75.3, cy: 143.0, r: 4.1 },
  { cx: 119.1, cy: 142.5, r: 4.3 },
  { cx: 161.5, cy: 143.2, r: 4.2 },
  { cx: 204.9, cy: 142.5, r: 4.4 },
  { cx: 248.7, cy: 142.9, r: 4.2 },
  { cx: 117.9, cy: 185.9, r: 4.2 },
  { cx: 161.6, cy: 186.0, r: 4.2 },
  { cx: 205.5, cy: 186.1, r: 4.3 },
  { cx: 161.5, cy: 229.9, r: 4.2 },
]

// Cardinal and center points for delicate golden star twinkles
const SPARKLE_POINTS = [
  { cx: 161.6, cy: 40.0, delay: 0.2, size: 7 },
  { cx: 266.0, cy: 143.0, delay: 0.9, size: 7 },
  { cx: 161.6, cy: 246.0, delay: 1.6, size: 7 },
  { cx: 58.0, cy: 143.0, delay: 2.3, size: 7 },
  { cx: 161.6, cy: 143.0, delay: 1.1, size: 8 },
]

export const SIKKU_KOLAM_PATH = "M 116.0,130.0 C 113.3,132.7 103.3,139.7 102.0,143.0 C 100.7,146.3 104.7,148.2 108.0,150.0 C 111.3,151.8 117.2,154.8 122.0,154.0 C 126.8,153.2 137.0,149.5 137.0,145.0 C 137.0,140.5 125.2,130.0 122.0,127.0 C 118.8,124.0 119.0,126.5 118.0,127.0 C 117.0,127.5 118.7,127.3 116.0,130.0 Z M 220.0,91.0 C 220.3,93.5 223.8,98.7 222.0,104.0 C 220.2,109.3 208.5,117.2 209.0,123.0 C 209.5,128.8 218.8,138.7 225.0,139.0 C 231.2,139.3 240.8,127.2 246.0,125.0 C 251.2,122.8 252.8,124.7 256.0,126.0 C 259.2,127.3 263.0,129.7 265.0,133.0 C 267.0,136.3 268.2,142.3 268.0,146.0 C 267.8,149.7 266.7,152.3 264.0,155.0 C 261.3,157.7 255.5,161.0 252.0,162.0 C 248.5,163.0 247.0,163.3 243.0,161.0 C 239.0,158.7 233.8,148.3 228.0,148.0 C 222.2,147.7 213.3,157.5 208.0,159.0 C 202.7,160.5 200.3,158.8 196.0,157.0 C 191.7,155.2 187.0,146.8 182.0,148.0 C 177.0,149.2 166.0,158.3 166.0,164.0 C 166.0,169.7 175.7,181.3 182.0,182.0 C 188.3,182.7 198.7,170.2 204.0,168.0 C 209.3,165.8 210.7,167.0 214.0,169.0 C 217.3,171.0 222.3,176.0 224.0,180.0 C 225.7,184.0 225.8,189.0 224.0,193.0 C 222.2,197.0 216.5,202.0 213.0,204.0 C 209.5,206.0 208.2,207.2 203.0,205.0 C 197.8,202.8 188.2,190.7 182.0,191.0 C 175.8,191.3 166.3,201.2 166.0,207.0 C 165.7,212.8 177.7,221.0 180.0,226.0 C 182.3,231.0 181.8,233.3 180.0,237.0 C 178.2,240.7 173.2,246.2 169.0,248.0 C 164.8,249.8 159.2,250.0 155.0,248.0 C 150.8,246.0 145.8,239.7 144.0,236.0 C 142.2,232.3 141.7,230.8 144.0,226.0 C 146.3,221.2 158.2,212.8 158.0,207.0 C 157.8,201.2 149.2,191.3 143.0,191.0 C 136.8,190.7 126.7,203.0 121.0,205.0 C 115.3,207.0 112.5,205.3 109.0,203.0 C 105.5,200.7 101.2,195.3 100.0,191.0 C 98.8,186.7 100.2,180.7 102.0,177.0 C 103.8,173.3 107.3,170.3 111.0,169.0 C 114.7,167.7 119.5,167.0 124.0,169.0 C 128.5,171.0 134.7,179.0 138.0,181.0 C 141.3,183.0 140.7,183.3 144.0,181.0 C 147.3,178.7 155.7,170.0 158.0,167.0 C 160.3,164.0 159.3,165.0 158.0,163.0 C 156.7,161.0 153.0,157.5 150.0,155.0 C 147.0,152.5 143.5,147.7 140.0,148.0 C 136.5,148.3 132.8,155.2 129.0,157.0 C 125.2,158.8 122.3,160.5 117.0,159.0 C 111.7,157.5 103.5,147.5 97.0,148.0 C 90.5,148.5 82.8,159.8 78.0,162.0 C 73.2,164.2 70.7,161.8 68.0,161.0 C 65.3,160.2 63.8,159.5 62.0,157.0 C 60.2,154.5 57.7,149.5 57.0,146.0 C 56.3,142.5 56.0,139.3 58.0,136.0 C 60.0,132.7 65.5,127.8 69.0,126.0 C 72.5,124.2 73.8,122.8 79.0,125.0 C 84.2,127.2 94.0,139.2 100.0,139.0 C 106.0,138.8 114.7,130.0 115.0,124.0 C 115.3,118.0 104.2,108.0 102.0,103.0 C 99.8,98.0 100.8,97.0 102.0,94.0 C 103.2,91.0 105.2,86.5 109.0,85.0 C 112.8,83.5 119.5,83.0 125.0,85.0 C 130.5,87.0 136.5,97.7 142.0,97.0 C 147.5,96.3 157.7,87.0 158.0,81.0 C 158.3,75.0 145.8,66.8 144.0,61.0 C 142.2,55.2 144.8,49.7 147.0,46.0 C 149.2,42.3 153.5,40.2 157.0,39.0 C 160.5,37.8 164.2,37.2 168.0,39.0 C 171.8,40.8 178.0,46.2 180.0,50.0 C 182.0,53.8 182.3,56.8 180.0,62.0 C 177.7,67.2 165.7,75.2 166.0,81.0 C 166.3,86.8 175.5,96.7 182.0,97.0 C 188.5,97.3 199.8,85.2 205.0,83.0 C 210.2,80.8 210.5,83.0 213.0,84.0 C 215.5,85.0 218.8,87.8 220.0,89.0 C 221.2,90.2 219.7,88.5 220.0,91.0 Z M 216.0,136.0 C 213.7,133.5 209.2,128.5 207.0,127.0 C 204.8,125.5 206.2,124.0 203.0,127.0 C 199.8,130.0 188.0,140.5 188.0,145.0 C 188.0,149.5 199.0,152.7 203.0,154.0 C 207.0,155.3 208.8,154.5 212.0,153.0 C 215.2,151.5 220.5,146.8 222.0,145.0 C 223.5,143.2 222.0,143.5 221.0,142.0 C 220.0,140.5 218.3,138.5 216.0,136.0 Z M 176.0,183.0 C 173.3,180.2 166.5,171.3 164.0,169.0 C 161.5,166.7 164.2,166.3 161.0,169.0 C 157.8,171.7 145.2,179.3 145.0,185.0 C 144.8,190.7 157.0,199.8 160.0,203.0 C 163.0,206.2 159.7,206.8 163.0,204.0 C 166.3,201.2 177.8,189.5 180.0,186.0 C 182.2,182.5 178.7,185.8 176.0,183.0 Z M 216.0,104.0 C 216.5,101.8 219.0,97.7 218.0,95.0 C 217.0,92.3 212.8,89.0 210.0,88.0 C 207.2,87.0 204.7,87.2 201.0,89.0 C 197.3,90.8 190.2,96.7 188.0,99.0 C 185.8,101.3 185.5,99.8 188.0,103.0 C 190.5,106.2 198.5,117.2 203.0,118.0 C 207.5,118.8 212.8,110.3 215.0,108.0 C 217.2,105.7 215.5,106.2 216.0,104.0 Z M 195.0,179.0 C 193.7,180.8 187.0,184.7 188.0,188.0 C 189.0,191.3 197.3,197.0 201.0,199.0 C 204.7,201.0 207.2,200.8 210.0,200.0 C 212.8,199.2 216.3,197.0 218.0,194.0 C 219.7,191.0 220.5,185.2 220.0,182.0 C 219.5,178.8 217.8,176.5 215.0,175.0 C 212.2,173.5 206.2,172.7 203.0,173.0 C 199.8,173.3 197.3,176.0 196.0,177.0 C 194.7,178.0 196.3,177.2 195.0,179.0 Z M 174.0,130.0 C 176.7,132.7 180.0,137.5 182.0,139.0 C 184.0,140.5 183.0,141.3 186.0,139.0 C 189.0,136.7 197.7,128.2 200.0,125.0 C 202.3,121.8 202.5,123.3 200.0,120.0 C 197.5,116.7 188.0,107.5 185.0,105.0 C 182.0,102.5 185.2,102.0 182.0,105.0 C 178.8,108.0 167.3,118.8 166.0,123.0 C 164.7,127.2 171.3,127.3 174.0,130.0 Z M 202.0,105.0 C 201.2,103.7 201.8,98.0 203.0,97.0 C 204.2,96.0 208.2,97.7 209.0,99.0 C 209.8,100.3 209.2,104.0 208.0,105.0 C 206.8,106.0 202.8,106.3 202.0,105.0 Z M 152.0,47.0 C 151.2,48.0 149.3,50.3 149.0,53.0 C 148.7,55.7 147.7,59.2 150.0,63.0 C 152.3,66.8 159.0,75.8 163.0,76.0 C 167.0,76.2 171.8,67.8 174.0,64.0 C 176.2,60.2 177.3,56.5 176.0,53.0 C 174.7,49.5 168.8,44.7 166.0,43.0 C 163.2,41.3 161.0,42.3 159.0,43.0 C 157.0,43.7 155.2,46.3 154.0,47.0 C 152.8,47.7 152.8,46.0 152.0,47.0 Z M 167.0,114.0 C 169.5,111.5 177.0,105.5 179.0,103.0 C 181.0,100.5 181.5,102.2 179.0,99.0 C 176.5,95.8 169.7,83.8 164.0,84.0 C 158.3,84.2 145.5,94.3 145.0,100.0 C 144.5,105.7 157.8,115.0 161.0,118.0 C 164.2,121.0 163.0,118.7 164.0,118.0 C 165.0,117.3 164.5,116.5 167.0,114.0 Z M 155.0,154.0 C 158.2,156.7 159.8,162.7 164.0,161.0 C 168.2,159.3 180.0,149.7 180.0,144.0 C 180.0,138.3 167.3,129.8 164.0,127.0 C 160.7,124.2 163.2,124.0 160.0,127.0 C 156.8,130.0 145.8,140.5 145.0,145.0 C 144.2,149.5 151.8,151.3 155.0,154.0 Z M 261.0,137.0 C 260.0,136.0 258.3,132.2 256.0,131.0 C 253.7,129.8 251.3,127.8 247.0,130.0 C 242.7,132.2 230.2,139.5 230.0,144.0 C 229.8,148.5 242.0,154.8 246.0,157.0 C 250.0,159.2 251.7,157.7 254.0,157.0 C 256.3,156.3 258.7,156.3 260.0,153.0 C 261.3,149.7 261.8,139.7 262.0,137.0 C 262.2,134.3 262.0,138.0 261.0,137.0 Z M 176.0,233.0 C 175.8,231.0 176.0,227.5 174.0,224.0 C 172.0,220.5 166.3,214.0 164.0,212.0 C 161.7,210.0 162.7,209.2 160.0,212.0 C 157.3,214.8 149.7,224.7 148.0,229.0 C 146.3,233.3 148.3,235.5 150.0,238.0 C 151.7,240.5 154.8,243.2 158.0,244.0 C 161.2,244.8 166.2,244.3 169.0,243.0 C 171.8,241.7 173.8,237.7 175.0,236.0 C 176.2,234.3 176.2,235.0 176.0,233.0 Z M 110.0,109.0 C 112.2,111.5 116.5,119.5 121.0,118.0 C 125.5,116.5 136.0,104.5 137.0,100.0 C 138.0,95.5 130.8,93.0 127.0,91.0 C 123.2,89.0 117.2,87.8 114.0,88.0 C 110.8,88.2 109.0,89.5 108.0,92.0 C 107.0,94.5 107.7,100.2 108.0,103.0 C 108.3,105.8 107.8,106.5 110.0,109.0 Z M 204.0,183.0 C 205.3,183.0 209.3,182.7 210.0,184.0 C 210.7,185.3 209.3,190.2 208.0,191.0 C 206.7,191.8 203.0,190.2 202.0,189.0 C 201.0,187.8 201.7,185.0 202.0,184.0 C 202.3,183.0 202.7,183.0 204.0,183.0 Z M 157.0,121.0 C 154.0,118.3 145.5,105.0 140.0,105.0 C 134.5,105.0 124.2,115.3 124.0,121.0 C 123.8,126.7 135.8,136.0 139.0,139.0 C 142.2,142.0 139.8,142.0 143.0,139.0 C 146.2,136.0 155.7,124.0 158.0,121.0 C 160.3,118.0 160.0,123.7 157.0,121.0 Z M 124.0,142.0 C 124.0,143.3 123.2,146.2 122.0,147.0 C 120.8,147.8 118.2,148.0 117.0,147.0 C 115.8,146.0 114.2,142.3 115.0,141.0 C 115.8,139.7 120.5,138.8 122.0,139.0 C 123.5,139.2 124.0,140.7 124.0,142.0 Z M 94.0,144.0 C 93.8,141.3 89.7,137.3 87.0,135.0 C 84.3,132.7 81.0,130.7 78.0,130.0 C 75.0,129.3 71.3,130.2 69.0,131.0 C 66.7,131.8 65.2,132.2 64.0,135.0 C 62.8,137.8 61.5,144.7 62.0,148.0 C 62.5,151.3 64.2,153.5 67.0,155.0 C 69.8,156.5 75.5,157.7 79.0,157.0 C 82.5,156.3 85.5,153.2 88.0,151.0 C 90.5,148.8 94.2,146.7 94.0,144.0 Z M 78.0,141.0 C 78.3,142.3 80.0,146.2 79.0,147.0 C 78.0,147.8 73.2,147.0 72.0,146.0 C 70.8,145.0 71.2,142.2 72.0,141.0 C 72.8,139.8 76.0,139.0 77.0,139.0 C 78.0,139.0 77.7,139.7 78.0,141.0 Z M 202.0,140.0 C 203.3,140.0 209.0,139.8 210.0,141.0 C 211.0,142.2 209.3,146.0 208.0,147.0 C 206.7,148.0 203.0,148.0 202.0,147.0 C 201.0,146.0 202.0,142.2 202.0,141.0 C 202.0,139.8 200.7,140.0 202.0,140.0 Z M 123.0,186.0 C 122.7,186.8 121.0,190.2 120.0,191.0 C 119.0,191.8 118.0,192.0 117.0,191.0 C 116.0,190.0 114.0,186.5 114.0,185.0 C 114.0,183.5 115.7,182.3 117.0,182.0 C 118.3,181.7 121.2,182.3 122.0,183.0 C 122.8,183.7 121.8,185.5 122.0,186.0 C 122.2,186.5 123.3,185.2 123.0,186.0 Z M 108.0,196.0 C 109.3,197.2 112.3,199.5 115.0,200.0 C 117.7,200.5 120.3,201.0 124.0,199.0 C 127.7,197.0 134.8,190.3 137.0,188.0 C 139.2,185.7 138.8,187.2 137.0,185.0 C 135.2,182.8 129.8,177.0 126.0,175.0 C 122.2,173.0 117.3,172.3 114.0,173.0 C 110.7,173.7 107.2,175.7 106.0,179.0 C 104.8,182.3 106.7,190.2 107.0,193.0 C 107.3,195.8 106.7,194.8 108.0,196.0 Z M 158.0,103.0 C 157.7,102.2 157.0,100.0 158.0,99.0 C 159.0,98.0 162.7,96.3 164.0,97.0 C 165.3,97.7 166.7,101.8 166.0,103.0 C 165.3,104.2 161.3,104.0 160.0,104.0 C 158.7,104.0 158.3,103.8 158.0,103.0 Z M 166.0,232.0 C 165.2,233.2 162.3,234.8 161.0,235.0 C 159.7,235.2 158.0,234.5 158.0,233.0 C 158.0,231.5 159.7,226.8 161.0,226.0 C 162.3,225.2 165.2,227.0 166.0,228.0 C 166.8,229.0 166.8,230.8 166.0,232.0 Z M 116.0,99.0 C 117.2,98.2 120.7,96.3 122.0,97.0 C 123.3,97.7 124.8,101.7 124.0,103.0 C 123.2,104.3 118.5,105.2 117.0,105.0 C 115.5,104.8 115.2,103.0 115.0,102.0 C 114.8,101.0 114.8,99.8 116.0,99.0 Z M 164.0,183.0 C 164.8,184.2 166.5,187.7 166.0,189.0 C 165.5,190.3 162.3,191.2 161.0,191.0 C 159.7,190.8 158.0,189.5 158.0,188.0 C 158.0,186.5 160.0,182.8 161.0,182.0 C 162.0,181.2 163.2,181.8 164.0,183.0 Z M 254.0,143.0 C 253.5,143.8 251.3,147.3 250.0,148.0 C 248.7,148.7 246.7,148.3 246.0,147.0 C 245.3,145.7 245.2,141.3 246.0,140.0 C 246.8,138.7 249.8,138.5 251.0,139.0 C 252.2,139.5 252.5,142.3 253.0,143.0 C 253.5,143.7 254.5,142.2 254.0,143.0 Z M 159.0,54.0 C 160.2,53.8 165.0,52.8 166.0,54.0 C 167.0,55.2 166.0,59.8 165.0,61.0 C 164.0,62.2 161.0,62.0 160.0,61.0 C 159.0,60.0 159.2,56.2 159.0,55.0 C 158.8,53.8 157.8,54.2 159.0,54.0 Z M 164.0,148.0 C 162.8,148.0 159.0,147.2 158.0,146.0 C 157.0,144.8 156.7,141.8 158.0,141.0 C 159.3,140.2 164.8,140.2 166.0,141.0 C 167.2,141.8 165.3,144.8 165.0,146.0 C 164.7,147.2 165.2,148.0 164.0,148.0 Z"

/**
 * Authentic Tamil Sikku / Brahma Mudi Kolam (5 to 1 dot diamond pattern)
 * Features:
 * - Exact vector reconstruction of the traditional woven Brahma Mudi knot
 * - Warm gold gradient fill and stroke
 * - Radiant ambient golden aura glow filter
 * - Progressive animated overdraw stroke that dynamically sketches the looping curves
 * - Luminous golden shimmer beam sweeping across the kolam (the glide)
 * - Pulsing sacred pulli dots with glowing halos
 * - Twinkling star sparkles at cardinal tips
 */
export function SikkuBrahmaMudiKolam({
  className = 'w-[32rem] h-[28rem]',
  glowing = false,
  withGlide = false,
  overdraw = true,
  overdrawDuration = 7,
  glideDuration = 3.6,
  baseOpacity = 0.65,
}) {
  return (
    <div className={`relative flex items-center justify-center select-none ${className}`} aria-hidden="true">
      <svg
        viewBox="0 0 324 280"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        className="w-full h-full block overflow-visible"
      >
        <defs>
          {/* Subtle warm gold linear gradient for the kolam lines */}
          <linearGradient id="kolam-gold-linear" x1="50" y1="30" x2="270" y2="250" gradientUnits="userSpaceOnUse">
            <stop offset="0%" stopColor="#9A7418" />
            <stop offset="35%" stopColor="#C5A059" />
            <stop offset="70%" stopColor="#B8860B" />
            <stop offset="100%" stopColor="#8C6A14" />
          </linearGradient>

          {/* Radiant gold linear gradient for the glowing base */}
          <linearGradient id="kolam-gold-radiant" x1="50" y1="30" x2="270" y2="250" gradientUnits="userSpaceOnUse">
            <stop offset="0%" stopColor="#D4A017" />
            <stop offset="30%" stopColor="#F5B82A" />
            <stop offset="60%" stopColor="#FFE066" />
            <stop offset="85%" stopColor="#D4A017" />
            <stop offset="100%" stopColor="#A67C1E" />
          </linearGradient>

          {/* Radial gradient for the pulli dots */}
          <radialGradient id="pulli-dot-gold" cx="50%" cy="50%" r="50%">
            <stop offset="0%" stopColor="#FFF9E6" />
            <stop offset="40%" stopColor="#F5B82A" />
            <stop offset="100%" stopColor="#8C6A14" />
          </radialGradient>

          {/* Ambient breathing aura behind the entire kolam */}
          <radialGradient id="kolam-ambient-aura" cx="50%" cy="50%" r="50%">
            <stop offset="0%" stopColor="#F5B82A" stopOpacity="0.25" />
            <stop offset="40%" stopColor="#E5A620" stopOpacity="0.12" />
            <stop offset="80%" stopColor="#C58F18" stopOpacity="0.04" />
            <stop offset="100%" stopColor="#8C6A14" stopOpacity="0" />
          </radialGradient>

          {/* Moving shimmer glide beam gradient */}
          <linearGradient id="kolam-glide-beam" x1="0%" y1="0%" x2="100%" y2="0%">
            <stop offset="0%" stopColor="#FFFFFF" stopOpacity="0" />
            <stop offset="30%" stopColor="#FFEAA7" stopOpacity="0.3" />
            <stop offset="50%" stopColor="#FFFFFF" stopOpacity="0.65" />
            <stop offset="70%" stopColor="#FFD700" stopOpacity="0.3" />
            <stop offset="100%" stopColor="#FFFFFF" stopOpacity="0" />
          </linearGradient>

          {/* Filter for golden stroke glow */}
          <filter id="kolam-stroke-glow" x="-50%" y="-50%" width="200%" height="200%">
            <feGaussianBlur stdDeviation="3" result="blur" />
            <feMerge>
              <feMergeNode in="blur" />
              <feMergeNode in="SourceGraphic" />
            </feMerge>
          </filter>

          {/* Filter for radiant kolam aura */}
          <filter id="kolam-radiant-glow" x="-30%" y="-30%" width="160%" height="160%">
            <feGaussianBlur stdDeviation="3.5" result="blur1" />
            <feGaussianBlur stdDeviation="8" result="blur2" />
            <feMerge>
              <feMergeNode in="blur2" />
              <feMergeNode in="blur1" />
              <feMergeNode in="SourceGraphic" />
            </feMerge>
          </filter>

          {/* Filter for sparkling stars */}
          <filter id="sparkle-glow" x="-50%" y="-50%" width="200%" height="200%">
            <feGaussianBlur stdDeviation="1.5" result="glow" />
            <feMerge>
              <feMergeNode in="glow" />
              <feMergeNode in="SourceGraphic" />
            </feMerge>
          </filter>

          {/* Precise Mask for the Glide (contains knot ribbon and pulli dots) */}
          <mask id="kolam-glide-mask">
            <path d={SIKKU_KOLAM_PATH} fill="white" fillRule="evenodd" />
            {PULLI_DOTS.map((dot, idx) => (
              <circle key={idx} cx={dot.cx} cy={dot.cy} r={dot.r + 1} fill="white" />
            ))}
          </mask>
        </defs>

        {/* 0. Ambient Radiant Glow Aura (behind kolam) */}
        {glowing && (
          <motion.circle
            cx="162"
            cy="143"
            r="135"
            fill="url(#kolam-ambient-aura)"
            animate={{
              scale: [0.96, 1.04, 0.96],
              opacity: [0.25, 0.45, 0.25],
            }}
            transition={{
              duration: 4.5,
              repeat: Infinity,
              ease: 'easeInOut',
            }}
          />
        )}

        {/* 1. Base Static Kolam Canvas (13 Pullis + Infinite Knot Ribbon) */}
        {/* The 13 Sacred Pulli (Dots) */}
        {PULLI_DOTS.map((dot, idx) => (
          <g key={idx}>
            {glowing && (
              <motion.circle
                cx={dot.cx}
                cy={dot.cy}
                r={dot.r * 1.4}
                fill="#F5B82A"
                opacity={0.2}
                animate={{
                  r: [dot.r * 1.1, dot.r * 1.4, dot.r * 1.1],
                  opacity: [0.12, 0.28, 0.12],
                }}
                transition={{
                  duration: 2.8,
                  repeat: Infinity,
                  delay: (idx * 0.15) % 1.5,
                  ease: 'easeInOut',
                }}
              />
            )}
            <circle
              cx={dot.cx}
              cy={dot.cy}
              r={dot.r}
              fill="url(#pulli-dot-gold)"
              stroke="#8C6A14"
              strokeWidth="0.6"
            />
          </g>
        ))}

        {/* The Brahma Mudi Knot (EvenOdd fill for internal knot holes) */}
        <path
          d={SIKKU_KOLAM_PATH}
          fill={glowing ? 'url(#kolam-gold-radiant)' : 'url(#kolam-gold-linear)'}
          fillRule="evenodd"
          opacity={glowing ? 0.6 : baseOpacity}
          filter={glowing ? 'url(#kolam-radiant-glow)' : 'drop-shadow(0 2px 8px rgba(140,106,20,0.12))'}
        />

        {/* 2. Overlaid Animated Drawing Stroke (Overdraw on top of Kolam) */}
        {overdraw && (
          <>
            {/* Soft luminous golden halo stroke */}
            <motion.path
              d={SIKKU_KOLAM_PATH}
              fill="none"
              stroke="#F4B429"
              strokeWidth={glowing ? 1.8 : 1.5}
              strokeLinecap="round"
              strokeLinejoin="round"
              filter={glowing ? 'url(#kolam-stroke-glow)' : undefined}
              initial={{ pathLength: 0, opacity: 0 }}
              animate={{
                pathLength: [0, 1, 1, 0],
                opacity: [0, 0.65, 0.65, 0],
              }}
              transition={{
                duration: overdrawDuration,
                repeat: Infinity,
                ease: 'easeInOut',
                repeatDelay: 1.2,
              }}
            />

            {/* Crisp bright ivory-gold pen trace */}
            <motion.path
              d={SIKKU_KOLAM_PATH}
              fill="none"
              stroke="#FFFDF0"
              strokeWidth={glowing ? 1.1 : 1.0}
              strokeLinecap="round"
              strokeLinejoin="round"
              initial={{ pathLength: 0, opacity: 0 }}
              animate={{
                pathLength: [0, 1, 1, 0],
                opacity: [0, 0.75, 0.75, 0],
              }}
              transition={{
                duration: overdrawDuration,
                repeat: Infinity,
                ease: 'easeInOut',
                repeatDelay: 1.2,
              }}
            />
          </>
        )}

        {/* 3. The Glide: Luminous Golden Light Beam Sweeping Across the Kolam */}
        {withGlide && (
          <g mask="url(#kolam-glide-mask)">
            <motion.rect
              x={-140}
              y={-10}
              width={140}
              height={300}
              fill="url(#kolam-glide-beam)"
              transform="skewX(-22)"
              animate={{ x: [-160, 420] }}
              transition={{
                duration: glideDuration,
                repeat: Infinity,
                ease: 'easeInOut',
                repeatDelay: 1.2,
              }}
            />
          </g>
        )}

        {/* 4. Sparkling Star Twinkles at Cardinal Teardrop Tips & Center */}
        {glowing &&
          SPARKLE_POINTS.map((pt, i) => (
            <motion.g
              key={i}
              transform={`translate(${pt.cx}, ${pt.cy})`}
              initial={{ scale: 0, opacity: 0 }}
              animate={{
                scale: [0, 1.2, 0],
                opacity: [0, 1, 0],
                rotate: [0, 45, 90],
              }}
              transition={{
                duration: 2.2,
                repeat: Infinity,
                delay: pt.delay,
                repeatDelay: 1.5,
                ease: 'easeInOut',
              }}
            >
              <path
                d={`M 0,-${pt.size} Q 0,0 ${pt.size},0 Q 0,0 0,${pt.size} Q 0,0 -${pt.size},0 Q 0,0 0,-${pt.size} Z`}
                fill="#FFF4D0"
                filter="url(#sparkle-glow)"
              />
            </motion.g>
          ))}
      </svg>
    </div>
  )
}
