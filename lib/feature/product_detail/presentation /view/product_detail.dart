import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/bloc/product_detail_bloc.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class ProductDetailPage extends StatefulWidget {
  final String? mealId;
  const ProductDetailPage({super.key, this.mealId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(GetMeals(mealId: widget.mealId ?? '52928'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.hasError) {
            return const Center(child: Text('Failed to load meal details'));
          } else if (state.meals.isEmpty) {
            return const Center(child: Text('No meal details available'));
          } else {
            final meal = state.meals.first;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImage(meal: meal),
                      const VerticalSpace.xSmall(),
                      ProductInfoWidget(meal: meal),
                      ProductDetailExpansion(meal: meal),
                      Padding(
                        padding: context.paddingHorizontalDefault,
                        child: const Divider(),
                      ),
                      const ProductAnotherInfo(),
                      VerticalSpace.large(),
                      VerticalSpace.large()
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: CustomGeneralButtonWidget(
                    onTap: () {
                      final cartItem = CartItem.create(
                        imageUrl: meal.strMealThumb,
                        name: meal.strMeal,
                        weight: meal.strMeasure1 ?? 'N/A',
                        price:
                            4.99, 
                        amount: context
                            .read<ProductDetailBloc>()
                            .state
                            .productPiece,
                      );
                      context
                          .read<ProductDetailBloc>()
                          .add(AddToCart(cartItem: cartItem));
                    },
                    width: context.width / 2,
                    text: 'Add To Basket',
                    height: context.dynamicHeight(0.075),
                    borderRadius: 19,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class ProductAnotherInfo extends StatelessWidget {
  const ProductAnotherInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontalDefault,
      child: Column(
        children: [
          Row(
            children: [
              Text('Nutritions', style: context.textTheme.bodyLarge),
              const Spacer(),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: context.theme.colorScheme.onBackground
                          .withOpacity(0.2),
                    ),
                    child: Text(
                      '100gr',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.theme.colorScheme.onBackground
                            .withOpacity(0.5),
                      ),
                    ),
                  ),
                  const HorizontalSpace.xSmall(),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ],
          ),
          Divider(
            height: context.dynamicHeight(0.05),
            thickness: 2,
          ),
          Row(
            children: [
              Text('Review', style: context.textTheme.bodyLarge),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return const Icon(
                    Icons.star,
                    color: Colors.deepOrange,
                    size: 26,
                  );
                }),
              ),
              const Row(
                children: [
                  HorizontalSpace.xSmall(),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
    required this.meal,
  });

  final Meal meal;

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
                          meal.strMeal,
                          maxLines: 2,
                          style: context.textTheme.titleSmall,
                        ),
                        Text(
                          meal.strMeasure1!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.theme.colorScheme.onBackground
                                .withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {
                    final favoritesItem = FavoritesItem.create(
                        imageUrl: meal.strMealThumb,
                        name: meal.strMeal,
                        weight: meal.strMeasure1 ?? 'N/A',
                        price:
                            4.99, 
                        amount: context
                            .read<ProductDetailBloc>()
                            .state
                            .productPiece,
                      );
                    context.read<FavoritesBloc>().add(AddToFavoritesMeal(favoritesItem: favoritesItem));
                    print('basıldıı');
                  }, icon: Icon(
                    Icons.favorite_border,
                    size: 28,
                    color:
                        context.theme.colorScheme.onBackground.withOpacity(0.5),
                  ),)
                ],
              ),
              const VerticalSpace.small(),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove,
                      size: 30,
                    ),
                    onPressed: () {
                      context
                          .read<ProductDetailBloc>()
                          .add(DecrementProductPiece());
                    },
                    color: Colors.grey,
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
                    icon: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                    onPressed: () {
                      context
                          .read<ProductDetailBloc>()
                          .add(IncrementProductPiece());
                    },
                    color: Colors.green,
                  ),
                  const Spacer(),
                  Text('\$1.99', style: context.textTheme.headlineMedium),
                ],
              ),
              const VerticalSpace.small(),
              const Divider(
                thickness: 2,
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProductDetailExpansion extends StatefulWidget {
  final Meal meal;

  const ProductDetailExpansion({Key? key, required this.meal})
      : super(key: key);

  @override
  _ProductDetailExpansionState createState() => _ProductDetailExpansionState();
}

class _ProductDetailExpansionState extends State<ProductDetailExpansion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              children: [
                Text(
                  'Product Detail',
                  style: context.textTheme.bodyLarge,
                ),
                const Spacer(),
                Icon(
                  _isExpanded
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  size: 30,
                ),
              ],
            ),
          ),
          const VerticalSpace.xxSmall(),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            firstChild: Container(),
            secondChild: Text(
              widget.meal.strInstructions,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.theme.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(25)),
          child: Image.network(
            meal.strMealThumb,
            fit: BoxFit.cover,
            height: context.height > 900 ? 400 : 300,
            width: context.width,
          ),
        ),
        Positioned(
          top: context.height > 900 ? 45 : 30,
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.share,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
