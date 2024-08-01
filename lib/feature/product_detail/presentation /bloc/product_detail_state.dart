part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final int productPiece;
  final Map<String, int> ratings; 

  const ProductDetailState({
    this.isLoading = false,
    this.hasError = false,
    this.productPiece = 1,
    this.ratings = const {}, 
  });

  ProductDetailState copyWith({
    bool? isLoading,
    bool? hasError,
    int? productPiece,
    Map<String, int>? ratings, 
  }) {
    return ProductDetailState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      productPiece: productPiece ?? this.productPiece,
      ratings: ratings ?? this.ratings, 
    );
  }

  @override
  List<Object> get props => [isLoading, hasError, productPiece, ratings]; 
}
