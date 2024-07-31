part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final int productPiece;

  const ProductDetailState({
    this.isLoading = false,
    this.hasError = false,
    this.productPiece = 1,
  });

  ProductDetailState copyWith({
    bool? isLoading,
    bool? hasError,
    int? productPiece,
  }) {
    return ProductDetailState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      productPiece: productPiece ?? this.productPiece,
    );
  }

  @override
  List<Object> get props => [isLoading, hasError, productPiece];
}