import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_flutter/core/utils/app_extensions.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_sizes.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import 'custom_header_btn.dart';
import 'theme_header_btn.dart';

class HorizontalHeaders extends StatelessWidget {
  const HorizontalHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (context.width < DeviceType.ipad.getMaxWidth()) {
          return const SizedBox.shrink();
        }
        
        return SizedBox(
          width: context.width * 0.8,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                AppBarHeaders.values.length,
                (index) {
                  return CustomHeaderBtn(headerIndex: index);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
