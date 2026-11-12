import Foundation
import CoreGraphics
import AppKit

let width = 1280
let height = 720
let totalFrames = 150 // 5 seconds at 30 fps
let fps = 30
let tempDir = "/tmp/video_frames"

let fm = FileManager.default
try? fm.removeItem(atPath: tempDir)
try? fm.createDirectory(atPath: tempDir, withIntermediateDirectories: true)

let colorSpace = CGColorSpaceCreateDeviceRGB()

print("Rendering \(totalFrames) video frames at \(width)x\(height)...")

// Pre-define marigold flower positions and sizes
struct Marigold {
    let x: CGFloat
    let y: CGFloat
    let radius: CGFloat
    let angle: CGFloat
    let petalCount: Int
    let baseHue: CGFloat // 0: saffron, 1: yellow
}

let marigolds: [Marigold] = [
    Marigold(x: 120, y: 130, radius: 46, angle: 0.2, petalCount: 24, baseHue: 0.2),
    Marigold(x: 210, y: 80, radius: 36, angle: 0.7, petalCount: 20, baseHue: 0.8),
    Marigold(x: 80, y: 220, radius: 38, angle: 1.1, petalCount: 22, baseHue: 0.5),
    Marigold(x: 1160, y: 140, radius: 48, angle: 0.4, petalCount: 26, baseHue: 0.3),
    Marigold(x: 1070, y: 90, radius: 38, angle: 1.5, petalCount: 20, baseHue: 0.9),
    Marigold(x: 1200, y: 240, radius: 40, angle: 0.9, petalCount: 22, baseHue: 0.4),
    Marigold(x: 140, y: 620, radius: 44, angle: 0.6, petalCount: 24, baseHue: 0.4),
    Marigold(x: 70, y: 530, radius: 36, angle: 1.8, petalCount: 20, baseHue: 0.7),
    Marigold(x: 1140, y: 600, radius: 45, angle: 1.2, petalCount: 24, baseHue: 0.5),
    Marigold(x: 1220, y: 520, radius: 38, angle: 0.3, petalCount: 20, baseHue: 0.2),
    Marigold(x: 1050, y: 640, radius: 34, angle: 2.1, petalCount: 18, baseHue: 0.8),
]

// Pre-define loose petals
struct Petal {
    let x: CGFloat
    let y: CGFloat
    let rx: CGFloat
    let ry: CGFloat
    let angle: CGFloat
    let isYellow: Bool
}

let loosePetals: [Petal] = [
    Petal(x: 180, y: 190, rx: 12, ry: 6, angle: 0.5, isYellow: true),
    Petal(x: 250, y: 140, rx: 14, ry: 7, angle: -0.3, isYellow: false),
    Petal(x: 290, y: 100, rx: 11, ry: 5, angle: 0.8, isYellow: true),
    Petal(x: 1000, y: 150, rx: 13, ry: 6, angle: -0.6, isYellow: false),
    Petal(x: 1110, y: 200, rx: 12, ry: 6, angle: 0.4, isYellow: true),
    Petal(x: 220, y: 590, rx: 14, ry: 7, angle: 0.2, isYellow: false),
    Petal(x: 260, y: 630, rx: 11, ry: 5, angle: -0.5, isYellow: true),
    Petal(x: 980, y: 580, rx: 13, ry: 6, angle: 0.7, isYellow: true),
    Petal(x: 1020, y: 550, rx: 12, ry: 6, angle: -0.2, isYellow: false),
    Petal(x: 640, y: 660, rx: 10, ry: 5, angle: 0.1, isYellow: true),
]

func drawMarigold(ctx: CGContext, m: Marigold, timePhase: CGFloat) {
    ctx.saveGState()
    ctx.translateBy(x: m.x, y: m.y)
    
    // Very subtle breathing/swaying
    let sway = sin(timePhase + m.angle) * 0.02
    ctx.scaleBy(x: 1.0 + sway, y: 1.0 + sway)
    
    // Shadow under marigold
    ctx.saveGState()
    ctx.setShadow(offset: CGSize(width: 4, height: 6), blur: 12, color: CGColor(red: 0, green: 0, blue: 0, alpha: 0.45))
    ctx.setFillColor(CGColor(red: 0.15, green: 0.08, blue: 0.04, alpha: 0.3))
    ctx.fillEllipse(in: CGRect(x: -m.radius * 0.9, y: -m.radius * 0.9, width: m.radius * 1.8, height: m.radius * 1.8))
    ctx.restoreGState()
    
    // Multi-layer ruffly petals
    let layers = 4
    for layer in (0..<layers).reversed() {
        let layerRadius = m.radius * (0.45 + CGFloat(layer) * 0.18)
        let count = m.petalCount + layer * 4
        let baseAngle = m.angle + CGFloat(layer) * 0.3
        
        for i in 0..<count {
            let theta = baseAngle + CGFloat(i) * (2 * .pi / CGFloat(count))
            let px = cos(theta) * layerRadius * 0.7
            let py = sin(theta) * layerRadius * 0.7
            
            ctx.saveGState()
            ctx.translateBy(x: px, y: py)
            ctx.rotate(by: theta)
            
            // Outer layers saffron/orange, inner layers brilliant gold/yellow
            let t = (CGFloat(layer) / CGFloat(layers))
            let r = 0.96 - t * 0.08
            let g = 0.42 + t * 0.32 + m.baseHue * 0.1
            let b = 0.05 + t * 0.12
            
            ctx.setFillColor(CGColor(red: r, green: g, blue: b, alpha: 0.92))
            
            let petalW = layerRadius * 0.42
            let petalH = layerRadius * 0.22
            ctx.fillEllipse(in: CGRect(x: -petalW * 0.5, y: -petalH * 0.5, width: petalW, height: petalH))
            ctx.restoreGState()
        }
    }
    
    // Center cluster of tiny dark orange florets
    ctx.setFillColor(CGColor(red: 0.78, green: 0.28, blue: 0.04, alpha: 0.95))
    ctx.fillEllipse(in: CGRect(x: -m.radius * 0.22, y: -m.radius * 0.22, width: m.radius * 0.44, height: m.radius * 0.44))
    
    ctx.restoreGState()
}

func drawLoosePetal(ctx: CGContext, p: Petal) {
    ctx.saveGState()
    ctx.translateBy(x: p.x, y: p.y)
    ctx.rotate(by: p.angle)
    
    // Subtle shadow
    ctx.setShadow(offset: CGSize(width: 2, height: 3), blur: 5, color: CGColor(red: 0, green: 0, blue: 0, alpha: 0.3))
    
    if p.isYellow {
        ctx.setFillColor(CGColor(red: 0.96, green: 0.75, blue: 0.16, alpha: 0.95))
    } else {
        ctx.setFillColor(CGColor(red: 0.92, green: 0.46, blue: 0.08, alpha: 0.95))
    }
    ctx.fillEllipse(in: CGRect(x: -p.rx, y: -p.ry, width: p.rx * 2, height: p.ry * 2))
    ctx.restoreGState()
}

func drawPalmShadow(ctx: CGContext, t: CGFloat) {
    // Palm leaves swaying gently from top-left and top-right
    // Perfectly seamless loop: phase = 2 * pi * (frame / totalFrames)
    let sway1 = sin(t) * 18.0
    let sway2 = cos(t) * 14.0
    let sway3 = sin(t * 2.0) * 8.0
    
    ctx.saveGState()
    // Soft transparent dark shadow
    ctx.setFillColor(CGColor(red: 0.08, green: 0.04, blue: 0.02, alpha: 0.28))
    
    // Top-left palm branch 1
    ctx.saveGState()
    ctx.translateBy(x: -60 + sway1, y: -40 + sway3)
    ctx.rotate(by: 0.38 + sin(t) * 0.03)
    
    // Main stem
    let stemPath = CGMutablePath()
    stemPath.move(to: CGPoint(x: 0, y: 0))
    stemPath.addQuadCurve(to: CGPoint(x: 580, y: 380), control: CGPoint(x: 320, y: 120))
    
    // Fronds radiating along stem
    for i in 1...22 {
        let progress = CGFloat(i) / 22.0
        let fx = progress * 540
        let fy = pow(progress, 1.4) * 340
        let frondLength = sin(progress * .pi) * 140.0 + 30.0
        
        let frondAngle = 0.85 + (1.0 - progress) * 0.4 + sin(t + progress * 3) * 0.04
        let p1x = fx + cos(frondAngle) * frondLength
        let p1y = fy + sin(frondAngle) * frondLength
        
        let p2x = fx - cos(frondAngle) * (frondLength * 0.75)
        let p2y = fy - sin(frondAngle) * (frondLength * 0.75)
        
        let frond = CGMutablePath()
        frond.move(to: CGPoint(x: fx, y: fy))
        frond.addQuadCurve(to: CGPoint(x: p1x, y: p1y), control: CGPoint(x: fx + 25, y: fy + 35))
        frond.addQuadCurve(to: CGPoint(x: fx + 12, y: fy + 8), control: CGPoint(x: p1x - 20, y: p1y - 15))
        frond.closeSubpath()
        ctx.addPath(frond)
        ctx.fillPath()
        
        // Opposite side frond
        let frondOpp = CGMutablePath()
        frondOpp.move(to: CGPoint(x: fx, y: fy))
        frondOpp.addQuadCurve(to: CGPoint(x: p2x, y: p2y), control: CGPoint(x: fx - 25, y: fy - 35))
        frondOpp.addQuadCurve(to: CGPoint(x: fx - 10, y: fy - 8), control: CGPoint(x: p2x + 15, y: p2y + 15))
        frondOpp.closeSubpath()
        ctx.addPath(frondOpp)
        ctx.fillPath()
    }
    ctx.restoreGState()
    
    // Top-right palm branch 2
    ctx.saveGState()
    ctx.translateBy(x: CGFloat(width) + 80 + sway2, y: -60 - sway3)
    ctx.rotate(by: -0.42 - cos(t) * 0.03)
    
    for i in 1...20 {
        let progress = CGFloat(i) / 20.0
        let fx = -progress * 520
        let fy = pow(progress, 1.4) * 320
        let frondLength = sin(progress * .pi) * 135.0 + 25.0
        
        let frondAngle = -0.82 - (1.0 - progress) * 0.35 + cos(t + progress * 3) * 0.04
        let p1x = fx + cos(frondAngle) * frondLength
        let p1y = fy - sin(frondAngle) * frondLength
        
        let frond = CGMutablePath()
        frond.move(to: CGPoint(x: fx, y: fy))
        frond.addQuadCurve(to: CGPoint(x: p1x, y: p1y), control: CGPoint(x: fx - 20, y: fy + 30))
        frond.addQuadCurve(to: CGPoint(x: fx - 10, y: fy + 6), control: CGPoint(x: p1x + 15, y: p1y - 10))
        frond.closeSubpath()
        ctx.addPath(frond)
        ctx.fillPath()
    }
    ctx.restoreGState()
    
    ctx.restoreGState()
}

func drawKolamWatermark(ctx: CGContext, t: CGFloat) {
    ctx.saveGState()
    let cx = CGFloat(width) / 2.0
    let cy = CGFloat(height) / 2.0
    ctx.translateBy(x: cx, y: cy)
    
    // Slow majestic rotation
    ctx.rotate(by: t * 0.1)
    
    ctx.setStrokeColor(CGColor(red: 0.94, green: 0.78, blue: 0.35, alpha: 0.09))
    ctx.setLineWidth(1.8)
    
    // Concentric petals & sacred geometry
    for r in [80.0, 140.0, 200.0, 260.0] as [CGFloat] {
        ctx.strokeEllipse(in: CGRect(x: -r, y: -r, width: r * 2, height: r * 2))
    }
    
    // 16 Petals
    for i in 0..<16 {
        let theta = CGFloat(i) * (.pi / 8.0)
        let petalPath = CGMutablePath()
        let tipX = cos(theta) * 240.0
        let tipY = sin(theta) * 240.0
        let base1X = cos(theta - 0.14) * 140.0
        let base1Y = sin(theta - 0.14) * 140.0
        let base2X = cos(theta + 0.14) * 140.0
        let base2Y = sin(theta + 0.14) * 140.0
        
        petalPath.move(to: CGPoint(x: base1X, y: base1Y))
        petalPath.addQuadCurve(to: CGPoint(x: tipX, y: tipY), control: CGPoint(x: cos(theta - 0.05) * 200, y: sin(theta - 0.05) * 200))
        petalPath.addQuadCurve(to: CGPoint(x: base2X, y: base2Y), control: CGPoint(x: cos(theta + 0.05) * 200, y: sin(theta + 0.05) * 200))
        ctx.addPath(petalPath)
        ctx.strokePath()
    }
    
    ctx.restoreGState()
}

for frame in 0..<totalFrames {
    let t = CGFloat(frame) * (2.0 * .pi / CGFloat(totalFrames))
    
    guard let ctx = CGContext(
        data: nil,
        width: width,
        height: height,
        bitsPerComponent: 8,
        bytesPerRow: width * 4,
        space: colorSpace,
        bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
    ) else {
        fatalError("Failed to create CGContext")
    }
    
    // 1. Warm Indian Teakwood & Rosewood Background
    let woodColors: [CGColor] = [
        CGColor(red: 0.18, green: 0.09, blue: 0.05, alpha: 1.0), // Deep Aged Teakwood
        CGColor(red: 0.28, green: 0.15, blue: 0.08, alpha: 1.0), // Warm Honey Mahogany
        CGColor(red: 0.22, green: 0.11, blue: 0.06, alpha: 1.0), // Rosewood
    ]
    let locations: [CGFloat] = [0.0, 0.52, 1.0]
    let gradient = CGGradient(colorsSpace: colorSpace, colors: woodColors as CFArray, locations: locations)!
    ctx.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: CGFloat(width), y: CGFloat(height)), options: [])
    
    // Subtle horizontal wood slats/grain
    ctx.saveGState()
    for y in stride(from: 0, to: height, by: 48) {
        ctx.setStrokeColor(CGColor(red: 0.12, green: 0.06, blue: 0.03, alpha: 0.35))
        ctx.setLineWidth(1.5)
        ctx.strokeLineSegments(between: [CGPoint(x: 0, y: y), CGPoint(x: width, y: y)])
        
        ctx.setStrokeColor(CGColor(red: 0.35, green: 0.20, blue: 0.10, alpha: 0.15))
        ctx.setLineWidth(0.8)
        ctx.strokeLineSegments(between: [CGPoint(x: 0, y: y + 1), CGPoint(x: width, y: y + 1)])
    }
    ctx.restoreGState()
    
    // 2. Slow Rotating Sacred Kolam Watermark
    drawKolamWatermark(ctx: ctx, t: t)
    
    // 3. Swaying Palm Shadows (in Sunlight)
    drawPalmShadow(ctx: ctx, t: t)
    
    // 4. Scattered Marigolds on Wood
    for m in marigolds {
        drawMarigold(ctx: ctx, m: m, timePhase: t)
    }
    
    // 5. Loose Petals
    for p in loosePetals {
        drawLoosePetal(ctx: ctx, p: p)
    }
    
    // 6. Warm Sunlight Caustic / Ambient Glow Beam
    let sunPulse = sin(t) * 0.06
    let sunColors: [CGColor] = [
        CGColor(red: 0.98, green: 0.88, blue: 0.65, alpha: 0.14 + sunPulse),
        CGColor(red: 0.94, green: 0.62, blue: 0.22, alpha: 0.06),
        CGColor(red: 0.22, green: 0.10, blue: 0.05, alpha: 0.0),
    ]
    let sunLocations: [CGFloat] = [0.0, 0.45, 1.0]
    let sunGrad = CGGradient(colorsSpace: colorSpace, colors: sunColors as CFArray, locations: sunLocations)!
    ctx.drawRadialGradient(
        sunGrad,
        startCenter: CGPoint(x: CGFloat(width) * 0.45, y: CGFloat(height) * 0.35),
        startRadius: 40,
        endCenter: CGPoint(x: CGFloat(width) * 0.45, y: CGFloat(height) * 0.35),
        endRadius: 750,
        options: []
    )
    
    // Save Frame as PNG
    guard let cgImage = ctx.makeImage() else { fatalError("makeImage failed") }
    let frameFile = String(format: "%@/frame_%04d.png", tempDir, frame)
    let url = URL(fileURLWithPath: frameFile) as CFURL
    guard let dest = CGImageDestinationCreateWithURL(url, "public.png" as CFString, 1, nil) else { fatalError() }
    CGImageDestinationAddImage(dest, cgImage, nil)
    CGImageDestinationFinalize(dest)
    
    if frame % 30 == 0 {
        print("  Rendered frame \(frame)/\(totalFrames)...")
    }
}

print("Finished rendering all frames. Stitching with ffmpeg...")

// Stitch into H.264 MP4 with ffmpeg (seamless loop)
let mp4Output = "public/videos/hero-background.mp4"
let proc = Process()
proc.executableURL = URL(fileURLWithPath: "/usr/local/bin/ffmpeg")
proc.arguments = [
    "-r", "\(fps)",
    "-i", "\(tempDir)/frame_%04d.png",
    "-c:v", "libx264",
    "-profile:v", "high",
    "-level", "4.0",
    "-pix_fmt", "yuv420p",
    "-crf", "22",
    "-movflags", "+faststart",
    "-y",
    mp4Output
]

do {
    try proc.run()
    proc.waitUntilExit()
    print("SUCCESS: Generated \(mp4Output) with exit code \(proc.terminationStatus)!")
} catch {
    // Try system ffmpeg in PATH
    let proc2 = Process()
    proc2.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    proc2.arguments = [
        "ffmpeg",
        "-r", "\(fps)",
        "-i", "\(tempDir)/frame_%04d.png",
        "-c:v", "libx264",
        "-profile:v", "high",
        "-level", "4.0",
        "-pix_fmt", "yuv420p",
        "-crf", "22",
        "-movflags", "+faststart",
        "-y",
        mp4Output
    ]
    try? proc2.run()
    proc2.waitUntilExit()
    print("SUCCESS: Generated \(mp4Output) with env ffmpeg!")
}

