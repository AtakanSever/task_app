part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final int productPiece;
  final Map<String, int> ratings; 
  final Map<String, bool> isFavoriteMeal;

  const ProductDetailState({
    this.isLoading = false,
    this.hasError = false,
    this.productPiece = 1,
    this.ratings = const {}, 
    this.isFavoriteMeal = const {}
  });

  ProductDetailState copyWith({
    bool? isLoading,
    bool? hasError,
    int? productPiece,
    Map<String, int>? ratings, 
    Map<String, bool>? isFavoriteMeal
  }) {
    return ProductDetailState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      productPiece: productPiece ?? this.productPiece,
      ratings: ratings ?? this.ratings, 
      isFavoriteMeal: isFavoriteMeal ?? this.isFavoriteMeal
    );
  }

  @override
  List<Object> get props => [isLoading, hasError, productPiece, ratings]; 
}
