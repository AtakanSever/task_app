import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/feature/product_detail/presentation%20/bloc/product_detail_bloc.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';

class ProductAnotherInfo extends StatelessWidget {
  final Meal meal;
  const ProductAnotherInfo({super.key, required this.meal});

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
              BlocBuilder<ProductDetailBloc, ProductDetailState>(
                builder: (context, state) {
                  final int rating = state.ratings[meal.idMeal] ?? 0;
                  return Row(
                    children: List.generate(5, (index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          context.read<ProductDetailBloc>().add(GiveRating(
                                mealId: meal.idMeal,
                                stars: index + 1,
                              ));
                        },
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                child: child, scale: animation);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/star_ic.svg',
                            color: index < rating
                                ? Colors.deepOrange
                                : Colors.grey,
                            width: 25,
                            height: 25,
                            key: ValueKey<int>(index < rating ? 1 : 0),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
              const HorizontalSpace.xSmall(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ],
      ),
    );
  }
}