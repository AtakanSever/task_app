part of 'cart_bloc.dart';

class CartState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final double totalPrice;

  const CartState({
    this.isLoading = false,
    this.hasError = false,
    this.totalPrice = 0,
  });

  CartState copyWith({
    bool? isLoading,
    bool? hasError,
    List<CartItem>? allItems,
    double? totalPrice,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        hasError,
        totalPrice,
      ];
}
