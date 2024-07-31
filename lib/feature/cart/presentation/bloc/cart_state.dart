part of 'cart_bloc.dart';

class CartState extends Equatable {
  final bool isLoading;
  final bool hasError;

  const CartState({
    this.isLoading = false,
    this.hasError = false,
  });

  CartState copyWith({
    bool? isLoading,
    bool? hasError,
    List<CartItem>? allItems,
  }) {
    return CartState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [isLoading, hasError,];
}
