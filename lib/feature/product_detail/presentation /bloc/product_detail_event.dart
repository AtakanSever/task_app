part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class GetProductPiece extends ProductDetailEvent {}

class IncrementProductPiece extends ProductDetailEvent {}

class DecrementProductPiece extends ProductDetailEvent {}

class AddToCart extends ProductDetailEvent {
  final CartItem cartItem;
  const AddToCart({required this.cartItem});

  @override
  List<Object> get props => [cartItem];
}

class GiveRating extends ProductDetailEvent {
  final String mealId;
  final int stars;

  GiveRating({required this.mealId, required this.stars});

  @override
  List<Object> get props => [mealId, stars];
}

