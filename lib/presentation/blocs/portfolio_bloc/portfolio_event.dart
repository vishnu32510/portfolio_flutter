part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

class LoadBasicInfo extends PortfolioEvent {
  const LoadBasicInfo();
}

class LoadTechnicalSkills extends PortfolioEvent {
  const LoadTechnicalSkills();
}

class LoadProjects extends PortfolioEvent {
  const LoadProjects();
}

class LoadExperiences extends PortfolioEvent {
  const LoadExperiences();
}

class LoadEducation extends PortfolioEvent {
  const LoadEducation();
}

class LoadAllData extends PortfolioEvent {
  const LoadAllData();
}

class PortfolioDataUpdated extends PortfolioEvent {
  final PortfolioData data;
  const PortfolioDataUpdated(this.data);

  @override
  List<Object?> get props => [data];
}
