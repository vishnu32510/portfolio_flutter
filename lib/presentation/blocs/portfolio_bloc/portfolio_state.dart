part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  final PortfolioData? data;
  final bool isLoading;
  final String? error;
  final Set<String> loadedSections; // Track which sections are loaded

  const PortfolioState({
    this.data,
    this.isLoading = false,
    this.error,
    this.loadedSections = const {},
  });

  PortfolioState copyWith({
    PortfolioData? data,
    bool? isLoading,
    String? error,
    Set<String>? loadedSections,
  }) {
    return PortfolioState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      loadedSections: loadedSections ?? this.loadedSections,
    );
  }

  bool isSectionLoaded(String section) => loadedSections.contains(section);

  @override
  List<Object?> get props => [data, isLoading, error, loadedSections];
}
