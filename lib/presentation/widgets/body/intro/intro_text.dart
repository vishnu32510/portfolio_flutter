import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final data = portfolioState.data;
        if (data == null) {
          return const Center(child: CircularProgressIndicator());
        }

        // Multiple roles to cycle through
        final List<String> roles = [
          data.developerTitle,
          'Software Engineer - Full-stack',
          'Flutter Developer',
          'Cross-platform Expert',
          'Mobile & Web Developer',
          'Software Engineer',
        ];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText(
              data.developerName,
              style: context.width < DeviceType.ipad.getMaxWidth()
                  ? AppStyles.s28
                  : AppStyles.s52,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Animated typewriter text for multiple roles
            SizedBox(
              height: context.width < DeviceType.ipad.getMaxWidth() ? 32 : 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1500),
                    animatedTexts: roles.map((role) {
                      return TypewriterAnimatedText(
                        role,
                        textStyle: context.width < DeviceType.ipad.getMaxWidth()
                            ? AppStyles.s18
                            : AppStyles.s28,
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 50),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                _HighlightBadge(
                  icon: Icons.emoji_events,
                  label: 'Floxi · Scarlet Hacks 2025 Winner',
                  url: 'https://floxi.co',
                ),
                _HighlightBadge(
                  icon: Icons.emoji_events,
                  label: 'Chi Planner · Scarlet Hacks 2024 Winner',
                  url: 'https://devpost.com/software/chi-town-places-event-planner',
                ),
                _HighlightBadge(
                  icon: Icons.auto_awesome,
                  label: 'Fact Dynamics · Perplexity API Showcase',
                  url: 'https://devpost.com/software/fact-dynamics',
                ),
                _HighlightBadge(
                  icon: Icons.widgets,
                  label: 'perplexity_flutter · pub.dev',
                  url: 'https://pub.dev/packages/perplexity_flutter',
                ),
                _HighlightBadge(
                  icon: Icons.widgets_outlined,
                  label: 'perplexity_dart · pub.dev',
                  url: 'https://pub.dev/packages/perplexity_dart',
                ),
              ],
            ),
          ],
        );
      },
    );
  }

}

class _HighlightBadge extends StatelessWidget {
  const _HighlightBadge({
    required this.icon,
    required this.label,
    required this.url,
  });

  final IconData icon;
  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    Future<void> _onTap() async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            color:
                Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
            border: Border.all(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withValues(alpha: 0.4),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: AppStyles.smallText(
                  textColor: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.85),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
