import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/models/technical_skill.dart';

class TechnicalSkillsItem extends StatelessWidget {
  final TechnicalSkill skill;

  const TechnicalSkillsItem({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          '${skill.category}:',
          style: AppStyles.s18.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skill.skills.map((skillName) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: SelectableText(
                skillName,
                style: AppStyles.s14.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
