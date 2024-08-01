part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToCartMeal extends CartEvent {}

class DeleteItem extends CartEvent {
  final CartItem cartItem;

  DeleteItem({required this.cartItem});

  @override
  List<Object?> get props => [cartItem];
}

class IncrementCartProductPiece extends CartEvent {
  final CartItem cartItem;

  IncrementCartProductPiece({required this.cartItem});

  @override
  List<Object?> get props => [cartItem];
}

class DecrementCartProductPiece extends CartEvent {
  final CartItem cartItem;

  DecrementCartProductPiece({required this.cartItem});

  @override
  List<Object?> get props => [cartItem];
}

class ClearAllCart extends CartEvent {
  final List<CartItem> cartList;
  ClearAllCart({required this.cartList});
  @override
  List<Object?> get props => [cartList];
}
