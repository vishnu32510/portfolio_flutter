part of 'portfolio_bloc.dart';

abstract class PortfolioEvent extends Equatable {
  const PortfolioEvent();

  @override
  List<Object?> get props => [];
}

class LoadPortfolioData extends PortfolioEvent {
  const LoadPortfolioData();
}

class PortfolioDataUpdated extends PortfolioEvent {
  final PortfolioData data;
  const PortfolioDataUpdated(this.data);

  @override
  List<Object?> get props => [data];
}
