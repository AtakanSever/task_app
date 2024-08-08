part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class GetProductPiece extends ProductDetailEvent {}

class IncrementProductPiece extends ProductDetailEvent {}

class DecrementProductPiece extends ProductDetailEvent {}

class GiveRating extends ProductDetailEvent {
  final String mealId;
  final int stars;

  GiveRating({required this.mealId, required this.stars});

  @override
  List<Object> get props => [mealId, stars];
}

class IsFavorite extends ProductDetailEvent {
  final String mealId;
  IsFavorite({required this.mealId});

  @override
  List<Object> get props => [mealId];
}

