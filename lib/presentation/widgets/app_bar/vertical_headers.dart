import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import 'custom_header_btn.dart';

class VerticalHeaders extends StatelessWidget {
  const VerticalHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (context.width > DeviceType.ipad.getMaxWidth()) {
          return const SizedBox();
        }
        return SizedBox(
          width: context.width,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ...List.generate(
              AppBarHeaders.values.length,
              (index) => SizedBox(
                width: context.width,
                child: CustomHeaderBtn(headerIndex: index),
              ),
            ),
            InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              enableFeedback: false,
              highlightColor: Colors.transparent,
              onTap: () {
                context.read<HomeBloc>().add(
                      DownloadResumeAppBar(),
                    );
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                height: MediaQuery.sizeOf(context).height * 0.05,
                width: MediaQuery.sizeOf(context).width * 0.5,
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
                          fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Lottie.asset(AppAssets.resumeLottie,
                            repeat: true,
                            fit: BoxFit.contain,
                            width: context.width < DeviceType.ipad.getMaxWidth()
                                ? 60
                                : 120)),
                  ],
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}
