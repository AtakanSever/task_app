import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:equatable/equatable.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/product_detail/data/rating.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';
import 'package:task_app/product/database/local_storage/rating_storage.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {

  ProductDetailBloc() : super(const ProductDetailState()) {
    on<GetProductPiece>(_onGetProductPiece);
    on<IncrementProductPiece>(_onIncrementProductPiece);
    on<DecrementProductPiece>(_onDecrementProductPiece);
    on<AddToCart>(_onAddToCart);
    on<GiveRating>(_onGiveRating);
  }

  Future<void> _onGetProductPiece(
      GetProductPiece event, Emitter<ProductDetailState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      emit(state.copyWith(isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  void _onIncrementProductPiece(
      IncrementProductPiece event, Emitter<ProductDetailState> emit) {
    emit(state.copyWith(productPiece: state.productPiece + 1));
  }

  void _onDecrementProductPiece(
      DecrementProductPiece event, Emitter<ProductDetailState> emit) {
    if (state.productPiece > 1) {
      emit(state.copyWith(productPiece: state.productPiece - 1));
    }
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<ProductDetailState> emit) async {
    final LocalStorage localStorage = HiveLocalStorage();
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      await localStorage.addItem(item: event.cartItem);
      BotToast.showText(text: 'Added to Cart Successfully');
      emit(state.copyWith(isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }

  Future<void> _onGiveRating(GiveRating event, Emitter<ProductDetailState> emit) async {
    final RatingLocalStorage localStorage = RatingHiveLocalStorage();
    emit(state.copyWith(isLoading: true, hasError: false));
    try {
      final rating = Rating(mealId: event.mealId, stars: event.stars);
      await localStorage.addItem(rating: rating);
      final updatedRatings = Map<String, int>.from(state.ratings)
        ..[event.mealId] = event.stars;
      emit(state.copyWith(isLoading: false, ratings: updatedRatings));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}

