import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter/core/utils/app_extensions.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import 'custom_header_btn.dart';

class HorizontalHeaders extends StatelessWidget {
  const HorizontalHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            ...List.generate(
              AppBarHeaders.values.length,
              (index) {
                return CustomHeaderBtn(headerIndex: index);
              },
            ),
            Visibility(
              visible: (context.width > DeviceType.ipad.getMaxWidth()),
              replacement: Container(),
              child: InkWell(
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                enableFeedback: false,
                highlightColor: Colors.transparent,
                onTap: () {
                  context.read<HomeBloc>().add(
                        DownloadResumeAppBar(),
                      );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Resume",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Lottie.asset(AppAssets.resumeLottie,
                              repeat: true,
                              fit: BoxFit.contain,
                              width:
                                  context.width < DeviceType.ipad.getMaxWidth()
                                      ? 30
                                      : 60),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
