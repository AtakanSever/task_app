part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToFavoritesMeal extends FavoritesEvent {
  final FavoritesItem favoritesItem;
  AddToFavoritesMeal({required this.favoritesItem});
  @override
  List<Object?> get props => [favoritesItem];
}

class DeleteFavoritesItem extends FavoritesEvent {
  final FavoritesItem favoritesItem;

  DeleteFavoritesItem({required this.favoritesItem});

  @override
  List<Object?> get props => [favoritesItem];
}

class IncrementFavoritesProductPiece extends FavoritesEvent {
  final FavoritesItem favoritesItem;

  IncrementFavoritesProductPiece({required this.favoritesItem});

  @override
  List<Object?> get props => [favoritesItem];
}

class DecrementFavoritesProductPiece extends FavoritesEvent {
  final FavoritesItem favoritesItem;

  DecrementFavoritesProductPiece({required this.favoritesItem});

  @override
  List<Object?> get props => [favoritesItem];
}

class AddFavoritesToCart extends FavoritesEvent {
  final List<FavoritesItem> favoritesList;
  AddFavoritesToCart({required this.favoritesList});
  @override
  List<Object?> get props => [favoritesList];
}

