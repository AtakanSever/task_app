part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final bool isLoading;
  final bool hasError;

  const FavoritesState({
    this.isLoading = false,
    this.hasError = false,
  });

  FavoritesState copyWith({
    bool? isLoading,
    bool? hasError,
    List<FavoritesItem>? allItems,
  }) {
    return FavoritesState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError,];
}
