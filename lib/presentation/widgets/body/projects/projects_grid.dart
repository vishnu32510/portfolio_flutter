import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../blocs/portfolio_bloc/portfolio_bloc.dart';
import 'project_item.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, portfolioState) {
        final projects = portfolioState.data?.projects ?? [];
        
        if (projects.isEmpty) {
          return const SizedBox.shrink();
        }

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getCrossAxisCount(context.width, projects.length),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            return ProjectItem(
              project: projects[index],
            );
          },
          itemCount: projects.length,
        );
      },
    );
  }

  int _getCrossAxisCount(double deviceWidth, int numOfProjects) {
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return 1;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return 1;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return 3;
    } else {
      return numOfProjects > 3 ? 3 : numOfProjects;
    }
  }
}
