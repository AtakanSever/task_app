import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddToCart>(_onAddToCart);
    on<IncrementCartProductPiece>(_onIncrementProductPiece);
    on<DecrementCartProductPiece>(_onDecrementProductPiece);
    on<ClearAllCart>(_onClearAllCart);
    on<GetTotalPrice>(_onGetTotalPrice);
  }

  final LocalStorage localStorage = HiveLocalStorage();

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final LocalStorage localStorage = HiveLocalStorage();
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      await localStorage.addItem(item: event.cartItem);
      final totalPrice = localStorage.getTotalPrice();
      BotToast.showText(text: 'Added to Cart Successfully');
      emit(state.copyWith(isLoading: false, totalPrice: totalPrice));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onIncrementProductPiece(IncrementCartProductPiece event, Emitter<CartState> emit) async {
    int amount = event.cartItem.amount + 1;
    double price = (event.cartItem.price / event.cartItem.amount) * amount;
    await localStorage.updateItem(item: event.cartItem, price: price, amount: amount);
    final updatedItems = await localStorage.getAllItems();
    final totalPrice = localStorage.getTotalPrice();
    emit(state.copyWith(allItems: updatedItems, totalPrice: totalPrice));
  }

  Future<void> _onDecrementProductPiece(DecrementCartProductPiece event, Emitter<CartState> emit) async {
    if (event.cartItem.amount > 1) {
      int amount = event.cartItem.amount - 1;
      double price = (event.cartItem.price / event.cartItem.amount) * amount;
      await localStorage.updateItem(item: event.cartItem, amount: amount, price: price);
      final updatedItems = await localStorage.getAllItems();
      final totalPrice = localStorage.getTotalPrice();
      emit(state.copyWith(allItems: updatedItems, totalPrice: totalPrice));
    }
  }

  Future<void> _onClearAllCart(ClearAllCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      for (var item in event.cartList) {
        await localStorage.deleteItem(item: item);
      }
      final updatedItems = await localStorage.getAllItems();
      final totalPrice = localStorage.getTotalPrice();
      emit(state.copyWith(isLoading: false, allItems: updatedItems, totalPrice: totalPrice));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onGetTotalPrice(GetTotalPrice event, Emitter<CartState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final totalPrice = localStorage.getTotalPrice();
      emit(state.copyWith(isLoading: false, totalPrice: totalPrice));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
