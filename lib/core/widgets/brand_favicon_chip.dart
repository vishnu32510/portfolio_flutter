import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Rounded chip that shows a bundled asset or network favicon-style image.
///
/// Used for company/school logos. On web, [Image.network] uses
/// [WebHtmlElementStrategy.prefer] so cross-origin favicons load reliably.
class BrandFaviconChip extends StatelessWidget {
  const BrandFaviconChip({
    super.key,
    required this.logoRef,
    this.linkUrl,
    this.chipBackgroundBlack = false,
    required this.colors,
  });

  final String logoRef;
  final String? linkUrl;
  final bool chipBackgroundBlack;
  final ColorScheme colors;

  static bool isBundledAsset(String path) => path.startsWith('assets/');

  Future<void> _openLink() async {
    final raw = linkUrl?.trim();
    if (raw == null || raw.isEmpty) return;
    final uri = Uri.tryParse(raw);
    if (uri == null) return;
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final fallbackIcon = Icon(
      Icons.public_outlined,
      size: 20,
      color: chipBackgroundBlack
          ? Colors.white.withValues(alpha: 0.45)
          : colors.onSurface.withValues(alpha: 0.3),
    );

    final Widget image;
    if (isBundledAsset(logoRef)) {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          logoRef,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => fallbackIcon,
        ),
      );
    } else {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.network(
          logoRef,
          fit: BoxFit.contain,
          gaplessPlayback: true,
          webHtmlElementStrategy: kIsWeb
              ? WebHtmlElementStrategy.prefer
              : WebHtmlElementStrategy.never,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Center(
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: chipBackgroundBlack
                      ? Colors.white.withValues(alpha: 0.45)
                      : colors.primary.withValues(alpha: 0.45),
                ),
              ),
            );
          },
          errorBuilder: (_, _, _) => fallbackIcon,
        ),
      );
    }

    final box = Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: chipBackgroundBlack
              ? Colors.white.withValues(alpha: 0.22)
              : colors.outline.withValues(alpha: 0.65),
        ),
        color: chipBackgroundBlack ? Colors.black : colors.surface,
      ),
      child: image,
    );

    final tappable = linkUrl != null && linkUrl!.trim().isNotEmpty;
    if (!tappable) {
      return box;
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(onTap: _openLink, child: box),
    );
  }
}
