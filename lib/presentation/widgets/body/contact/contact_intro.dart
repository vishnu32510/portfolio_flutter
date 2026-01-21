import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_flutter/presentation/widgets/body/contact/contact_me_personally.dart';
import 'package:portfolio_flutter/presentation/widgets/body/contact/social_medial_icons.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';

class ContactIntro extends StatelessWidget {
  const ContactIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final socialLinks = portfolioState.data?.socialLinks ?? {};
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: SelectableText(
                AppStrings.contactWithMe,
                style: AppStyles.s32,
              ),
            ),
            const SizedBox(height: 8),
            SelectableText(
              AppStrings.contactMsg,
              style: AppStyles.s18,
            ),
            const SizedBox(height: 10),
            SocialMediaIcons(socialLinks: socialLinks),
            const SizedBox(height: 20),
            const ContactMePersonally(),
          ],
        );
      },
    );
  }
}
