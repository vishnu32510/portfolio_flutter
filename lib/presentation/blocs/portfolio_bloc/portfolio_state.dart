part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  final PortfolioData? data;
  final bool isLoading;
  final String? error;

  const PortfolioState({
    this.data,
    this.isLoading = false,
    this.error,
  });

  PortfolioState copyWith({
    PortfolioData? data,
    bool? isLoading,
    String? error,
  }) {
    return PortfolioState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [data, isLoading, error];
}
