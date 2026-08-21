import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/services/visitor_counter_service.dart';
import '../../../core/utils/app_styles.dart';

/// Lightweight, clean floating badge displaying live portfolio visit counts.
class TrafficBadge extends StatefulWidget {
  const TrafficBadge({super.key});

  @override
  State<TrafficBadge> createState() => _TrafficBadgeState();
}

class _TrafficBadgeState extends State<TrafficBadge> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    // Fetch/record visit count on mount
    VisitorCounterService.instance.recordVisit();
  }

  String _formatCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ValueListenableBuilder<int>(
      valueListenable: VisitorCounterService.instance.visitCount,
      builder: (context, count, _) {
        if (count == 0) return const SizedBox.shrink();

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.diagonal3Values(
              _isHovered ? 1.05 : 1.0,
              _isHovered ? 1.05 : 1.0,
              1.0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF181818).withValues(alpha: 0.85)
                  : Colors.white.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: _isHovered
                    ? colors.primary.withValues(alpha: 0.6)
                    : colors.outline.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                    alpha: _isHovered ? 0.15 : 0.08,
                  ),
                  blurRadius: _isHovered ? 12 : 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFF22C55E),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                FaIcon(FontAwesomeIcons.eye, size: 11, color: colors.primary),
                const SizedBox(width: 6),
                Text(
                  '${_formatCount(count)} ${count == 1 ? 'view' : 'views'}',
                  style: AppStyles.extraSmallText(
                    textColor: colors.onSurface.withValues(alpha: 0.85),
                  ).copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
