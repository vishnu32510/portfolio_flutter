import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/services/visitor_counter_service.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_styles.dart';

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

  void _showTrafficDialog(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final count = VisitorCounterService.instance.currentCount;

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      builder: (dialogContext) {
        return Center(
          child: Container(
            width: 360,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: AppSizes.borderRadiusRegular,
              border: Border.all(
                color: colors.primary.withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: AppSizes.borderRadiusRegular,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Container(
                  color: isDark
                      ? const Color(0xFF141414).withValues(alpha: 0.92)
                      : Colors.white.withValues(alpha: 0.95),
                  padding: AppSizes.paddingLarge,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF22C55E),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Live Portfolio Traffic',
                                style: AppStyles.mediumTextBold(
                                  textColor: colors.onSurface,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.xmark,
                              size: 14,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () => Navigator.of(dialogContext).pop(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Stats Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: colors.primary.withValues(alpha: 0.08),
                          borderRadius: AppSizes.borderRadiusSmall,
                          border: Border.all(
                            color: colors.primary.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'TOTAL VISITS',
                              style: AppStyles.extraSmallText(
                                textColor: colors.primary,
                              ).copyWith(letterSpacing: 1.5),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _formatCount(count),
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: colors.primary,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tracked across global web sessions',
                              style: AppStyles.extraSmallText(
                                textColor: colors.onSurface.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Feature Highlights
                      _buildMetricRow(
                        context,
                        icon: FontAwesomeIcons.chartLine,
                        title: 'Real-time Analytics',
                        subtitle: 'Powered by Google Analytics 4 (GA4)',
                      ),
                      const SizedBox(height: 12),
                      _buildMetricRow(
                        context,
                        icon: FontAwesomeIcons.bolt,
                        title: 'Ultra-Lightweight',
                        subtitle: 'Zero binary bloat & instant rendering',
                      ),
                      const SizedBox(height: 12),
                      _buildMetricRow(
                        context,
                        icon: FontAwesomeIcons.shieldHalved,
                        title: 'Privacy Respecting',
                        subtitle: 'No personal data or intrusive tracking',
                      ),
                      const SizedBox(height: 20),
                      // Bottom close button
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: colors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: AppSizes.borderRadiusSmall,
                            ),
                          ),
                          onPressed: () => Navigator.of(dialogContext).pop(),
                          child: Text(
                            'Close',
                            style: AppStyles.smallTextBold(
                              textColor: colors.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMetricRow(
    BuildContext context, {
    required dynamic icon,
    required String title,
    required String subtitle,
  }) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: colors.onSurface.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: icon is FaIconData
              ? FaIcon(icon, size: 14, color: colors.primary)
              : Icon(icon, size: 14, color: colors.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.smallTextBold(textColor: colors.onSurface),
              ),
              Text(
                subtitle,
                style: AppStyles.extraSmallText(
                  textColor: colors.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
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
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () => _showTrafficDialog(context),
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
                    '${_formatCount(count)} views',
                    style: AppStyles.extraSmallText(
                      textColor: colors.onSurface.withValues(alpha: 0.85),
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
