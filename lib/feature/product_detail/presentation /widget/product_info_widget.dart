import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/feature/product_detail/presentation%20/bloc/product_detail_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/mixin/product_info_mixin.dart/product_info_page_mixin.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class ProductInfoWidget extends StatefulWidget {
  const ProductInfoWidget({super.key, required this.meal});

  final Meal meal;

  @override
  State<ProductInfoWidget> createState() => _ProductInfoWidgetState();
}

class _ProductInfoWidgetState extends State<ProductInfoWidget> with ProductInfoPageMixin{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalDefault,
      child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.meal.strMeal,
                          maxLines: 2,
                          style: context.textTheme.titleSmall,
                        ),
                        Text(
                          widget.meal.strMeasure1!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.theme.colorScheme.onBackground
                                .withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: isFavoriteMeal,
                    builder: (context, isFavorite, child) {
                      return IconButton(
                        onPressed: () {
                          isFavoriteMeal.value = !isFavorite;
                          if (isFavorite == false) {
                            final favoritesItem = FavoritesItem.create(
                              imageUrl: widget.meal.strMealThumb,
                              name: widget.meal.strMeal,
                              weight: widget.meal.strMeasure1 ?? 'N/A',
                              price: 4.99,
                              amount: context
                                  .read<ProductDetailBloc>()
                                  .state
                                  .productPiece,
                            );
                            context.read<FavoritesBloc>().add(
                                AddToFavoritesMeal(
                                    favoritesItem: favoritesItem));
                            favoriteItem = favoritesItem;
                          } else {
                            deleteItemFromFavorites(favoriteItem!);
                          }
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite :
                          Icons.favorite_border,
                          size: 28,
                          color: isFavorite
                              ? Colors.red
                              : context.theme.colorScheme.onBackground
                                  .withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const VerticalSpace.small(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove, size: 30),
                    onPressed: () {
                      context
                          .read<ProductDetailBloc>()
                          .add(DecrementProductPiece());
                    },
                    color: context.theme.colorScheme.onBackground.withOpacity(0.4),
                  ),
                  Container(
                    padding: context.paddingHorizontalDefault +
                        context.paddingVerticalLow,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '${state.productPiece}',
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, size: 30),
                    onPressed: () {
                      context
                          .read<ProductDetailBloc>()
                          .add(IncrementProductPiece());
                    },
                    color: context.theme.colorScheme.primary,
                  ),
                  const Spacer(),
                  Text('\$1.99', style: context.textTheme.headlineMedium),
                ],
              ),
              const VerticalSpace.small(),
              const Divider(thickness: 2),
            ],
          );
        },
      ),
    );
  }
}
