import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/product/database/local_storage/favorites_storage.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';
import 'package:uuid/uuid.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesState()) {
    on<AddToFavoritesMeal>(_onAddToFavoritesMeal);
    on<DeleteFavoritesItem>(_onDeleteFavoritesItem);
    on<AddFavoritesToCart>(_onAddFavoritesToCart);
  }

  final FavoritesLocalStorage localStorage = FavoritesHiveLocalStorage();
  final LocalStorage localCartStorage = HiveLocalStorage();

  Future<void> _onAddToFavoritesMeal(
      AddToFavoritesMeal event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      await localStorage.addItem(favoritesItem: event.favoritesItem);
      emit(state.copyWith(isLoading: false, isFavorite: {event.favoritesItem.id : true}));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onDeleteFavoritesItem(
      DeleteFavoritesItem event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      await localStorage.deleteItem(favoritesItem: event.favoritesItem);
      final updatedItems = await localStorage.getAllItems();
      emit(state.copyWith(isLoading: false, allItems: updatedItems, isFavorite: {event.favoritesItem.id : true}));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onAddFavoritesToCart(
      AddFavoritesToCart event, Emitter<FavoritesState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      for (var item in event.favoritesList) {
        CartItem cartItem = CartItem.create(
          id: Uuid().v1(),
            imageUrl: item.imageUrl,
            name: item.name,
            weight: item.weight,
            price: item.price,
            amount: item.amount);
        await localCartStorage.addItem(item: cartItem);
        BotToast.showText(text: 'Added to Cart Successfully');
      }
      emit(state.copyWith(isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
