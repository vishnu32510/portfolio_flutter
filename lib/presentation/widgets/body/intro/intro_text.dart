import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          'Software Engineer',
          'Applied AI Engineer',
          'Full-stack Engineer',
          'Backend Engineer',
          'Frontend Engineer',
          'Mobile & Web Developer',
          'Flutter Developer',
          'AI Engineer',
          'Cross-platform Expert',
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
            // Animated scale text for multiple roles
            SizedBox(
              height: context.width < DeviceType.ipad.getMaxWidth() ? 48 : 80,
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 1500),
                animatedTexts: roles.map((role) {
                  return ScaleAnimatedText(
                    role,
                    textStyle: (context.width < DeviceType.ipad.getMaxWidth()
                            ? AppStyles.s18
                            : AppStyles.s28)
                        .copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: const [
                _HighlightBadge(
                  icon: FontAwesomeIcons.trophy,
                  label: 'Floxi · Scarlet Hacks 2025 Winner',
                  urls: ['https://floxi.co', 'https://devpost.com/software/floxi', "https://apps.apple.com/us/app/floxi/id6749322113", ],
                ),
                _HighlightBadge(
                  icon: FontAwesomeIcons.trophy,
                  label: 'Chi Planner · Scarlet Hacks 2024 Winner',
                  urls: ['https://devpost.com/software/chi-town-places-event-planner'],
                ),
                _HighlightBadge(
                  icon: FontAwesomeIcons.wandMagicSparkles,
                  label: 'Fact Dynamics · Perplexity API Showcase',
                  urls: ['https://docs.perplexity.ai/cookbook/showcase/fact-dynamics', 'https://devpost.com/software/fact-dynamics'],
                ),
                _HighlightBadge(
                  icon: FontAwesomeIcons.box,
                  label: 'perplexity_flutter · pub.dev',
                  urls: ['https://pub.dev/packages/perplexity_flutter', 'https://docs.perplexity.ai/cookbook/showcase/perplexity-flutter'],
                ),
                _HighlightBadge(
                  icon: FontAwesomeIcons.box,
                  label: 'perplexity_dart · pub.dev',
                  urls: ['https://pub.dev/packages/perplexity_dart', 'https://docs.perplexity.ai/cookbook/showcase/perplexity-flutter'],
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
    required this.urls,
  });

  final IconData icon;
  final String label;
  final List<String> urls;

  @override
  Widget build(BuildContext context) {
    Future<void> onTap(String url) async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }

    String chipLabel(String url) {
      try {
        final host = Uri.parse(url).host.replaceFirst(RegExp(r'^www\.'), '');
        return host.isEmpty ? url : host;
      } catch (_) {
        return url;
      }
    }

    final isSingle = urls.length == 1;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isSingle ? () => onTap(urls.first) : null,
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
              if (!isSingle) ...[
                const SizedBox(width: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: urls
                      .map(
                        (u) => GestureDetector(
                          onTap: () => onTap(u),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(999),
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withValues(alpha: 0.35),
                              ),
                            ),
                            child: Text(
                              chipLabel(u),
                              style: AppStyles.extraSmallTextThin(
                                textColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
