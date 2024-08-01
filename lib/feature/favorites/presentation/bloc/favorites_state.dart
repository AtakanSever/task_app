part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final Map<String, bool> isFavorite;

  const FavoritesState({
    this.isLoading = false,
    this.hasError = false,
    this.isFavorite = const {}
  });

  FavoritesState copyWith({
    bool? isLoading,
    bool? hasError,
    List<FavoritesItem>? allItems,
     Map<String, bool>? isFavorite,

  }) {
    return FavoritesState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      isFavorite: isFavorite ?? this.isFavorite
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError, isFavorite];
}
