import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../navigation/navigation.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';
import '../../../../core/services/download_service.dart';
import 'package:flutter/foundation.dart';

class IntoActions extends StatelessWidget {
  const IntoActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final resumeLink = portfolioState.data?.resumeLink;

        List<Widget> actions = [
          CustomButton(
            label: AppBarHeaders.skills.getString(),
            icon: Icons.code,
            borderColor: AppColors.lowPriority,
            onPressed: () {
              AppNavigator.pushReplacement(Routes.skills);
            },
            width: 160,
          ),
          context.width < DeviceType.ipad.getMaxWidth()
              ? const SizedBox(height: 6)
              : const SizedBox(width: 32),
          CustomButton(
            label: AppBarHeaders.projects.getString(),
            icon: Icons.remove_red_eye,
            borderColor: AppColors.lowPriority,
            onPressed: () {
              AppNavigator.pushReplacement(Routes.projects);
            },
            width: 160,
          ),
          if (resumeLink != null && resumeLink.isNotEmpty) ...[
            context.width < DeviceType.ipad.getMaxWidth()
                ? const SizedBox(height: 6)
                : const SizedBox(width: 32),
            CustomButton(
              label: 'Download Resume',
              icon: Icons.download,
              borderColor: AppColors.lowPriority,
              onPressed: () async {
                DownloadService downloadService =
                    kIsWeb ? WebDownloadService() : MobileDownloadService();
                await downloadService.downloadResume(url: resumeLink);
              },
              width: 180,
            ),
          ],
        ];
        return context.width < DeviceType.ipad.getMaxWidth()
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: actions,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: actions,
              );
      },
    );
  }
}
