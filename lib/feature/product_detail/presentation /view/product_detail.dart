import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/bloc/product_detail_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/widget/product_another_info_widget.dart';
import 'package:task_app/feature/product_detail/presentation%20/widget/product_detail_expansion_widget.dart';
import 'package:task_app/feature/product_detail/presentation%20/widget/product_image_widget.dart';
import 'package:task_app/feature/product_detail/presentation%20/widget/product_info_widget.dart';
import 'package:task_app/product/database/local_storage/favorites_storage.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';
import 'package:uuid/uuid.dart';

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

  double generateRandomNumber() {
    final random = Random();
    return random.nextDouble() * 15;
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
                      ProductAnotherInfo(
                        meal: meal,
                      ),
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
                        id: Uuid().v1(),
                        imageUrl: meal.strMealThumb,
                        name: meal.strMeal,
                        weight: meal.strMeasure1 ?? 'N/A',
                        price: generateRandomNumber(),
                        amount: context
                            .read<ProductDetailBloc>()
                            .state
                            .productPiece,
                      );
                      context
                          .read<CartBloc>()
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
