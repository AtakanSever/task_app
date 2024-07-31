import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCartMeal>(_onAddToCartMeal);
    on<DeleteItem>(_onDeleteItem);
    on<IncrementCartProductPiece>(_onIncrementProductPiece);
    on<DecrementCartProductPiece>(_onDecrementProductPiece);
  }

  Future<void> _onAddToCartMeal(AddToCartMeal event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      emit(state.copyWith(isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onDeleteItem(DeleteItem event, Emitter<CartState> emit) async {
    final LocalStorage localStorage = HiveLocalStorage();
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      await localStorage.deleteItem(item: event.cartItem);
      final updatedItems = await localStorage.getAllItems();
      emit(state.copyWith(isLoading: false, allItems: updatedItems));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onIncrementProductPiece(IncrementCartProductPiece event, Emitter<CartState> emit) async {
    final LocalStorage localStorage = HiveLocalStorage();
    final updatedItem = event.cartItem.copyWith(
      amount: event.cartItem.amount + 1,
      price: event.cartItem.price * (event.cartItem.amount + 1) / event.cartItem.amount,
    );
    await localStorage.updateItem(item: updatedItem);
    final updatedItems = await localStorage.getAllItems();
    emit(state.copyWith(allItems: updatedItems));
  }

  Future<void> _onDecrementProductPiece(DecrementCartProductPiece event, Emitter<CartState> emit) async {
    if (event.cartItem.amount > 1) {
      final LocalStorage localStorage = HiveLocalStorage();
      final updatedItem = event.cartItem.copyWith(
        amount: event.cartItem.amount - 1,
        price: event.cartItem.price * (event.cartItem.amount - 1) / event.cartItem.amount,
      );
      await localStorage.updateItem(item: updatedItem);
      final updatedItems = await localStorage.getAllItems();
      emit(state.copyWith(allItems: updatedItems));
    }
  }
}

