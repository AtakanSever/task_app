import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/product/database/local_storage/favorites_storage.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesState()) {
    on<AddToFavoritesMeal>(_onAddToFavoritesMeal);
    on<DeleteFavoritesItem>(_onDeleteFavoritesItem);
    on<IncrementFavoritesProductPiece>(_onIncrementFavoritesProductPiece);
    on<DecrementFavoritesProductPiece>(_onDecrementFavoritesProductPiece);
    on<AddFavoritesToCart>(_onAddFavoritesToCart);
  }

  Future<void> _onAddToFavoritesMeal(
      AddToFavoritesMeal event, Emitter<FavoritesState> emit) async {
    final FavoritesLocalStorage localStorage = FavoritesHiveLocalStorage();
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      await localStorage.addItem(favoritesItem: event.favoritesItem);
      emit(state.copyWith(isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onDeleteFavoritesItem(
      DeleteFavoritesItem event, Emitter<FavoritesState> emit) async {
    final FavoritesLocalStorage localStorage = FavoritesHiveLocalStorage();
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      await localStorage.deleteItem(favoritesItem: event.favoritesItem);
      final updatedItems = await localStorage.getAllItems();
      emit(state.copyWith(isLoading: false, allItems: updatedItems));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onIncrementFavoritesProductPiece(
      IncrementFavoritesProductPiece event,
      Emitter<FavoritesState> emit) async {
    final FavoritesLocalStorage localStorage = FavoritesHiveLocalStorage();
    final updatedItem = event.favoritesItem.copyWith(
      amount: event.favoritesItem.amount + 1,
      price: event.favoritesItem.price *
          (event.favoritesItem.amount + 1) /
          event.favoritesItem.amount,
    );
    await localStorage.updateItem(favoritesItem: updatedItem);
    final updatedItems = await localStorage.getAllItems();
    emit(state.copyWith(allItems: updatedItems));
  }

  Future<void> _onDecrementFavoritesProductPiece(
      DecrementFavoritesProductPiece event,
      Emitter<FavoritesState> emit) async {
    if (event.favoritesItem.amount > 1) {
      final FavoritesLocalStorage localStorage = FavoritesHiveLocalStorage();
      final updatedItem = event.favoritesItem.copyWith(
        amount: event.favoritesItem.amount - 1,
        price: event.favoritesItem.price *
            (event.favoritesItem.amount - 1) /
            event.favoritesItem.amount,
      );
      await localStorage.updateItem(favoritesItem: updatedItem);
      final updatedItems = await localStorage.getAllItems();
      emit(state.copyWith(allItems: updatedItems));
    }
  }

  Future<void> _onAddFavoritesToCart(
      AddFavoritesToCart event, Emitter<FavoritesState> emit) async {
    final FavoritesLocalStorage localFavoriteStorage =
        FavoritesHiveLocalStorage();
    final LocalStorage localCartStorage = HiveLocalStorage();
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      for (var item in event.favoritesList) {
        CartItem cartItem = CartItem.create(
            imageUrl: item.imageUrl,
            name: item.name,
            weight: item.weight,
            price: item.price,
            amount: item.amount);
        await localCartStorage.addItem(item: cartItem);
        await localFavoriteStorage.deleteItem(favoritesItem: item);
        BotToast.showText(text: 'Added to Cart Successfully');
      }
      emit(state.copyWith(isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
