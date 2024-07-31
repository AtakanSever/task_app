import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/product_detail/presentation%20/view/product_detail.dart';
import 'package:task_app/product/core/t_types/meal_t_model.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class CustomGridViewList<T extends MealItem> extends StatelessWidget {
  final List<T> meals;
  final bool isHaveWidget;
  final Widget? topWidget;

  const CustomGridViewList(
      {super.key,
      required this.meals,
      this.isHaveWidget = false,
      this.topWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (isHaveWidget && topWidget != null) topWidget!,
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: meals.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final meal = meals[index];
            return InkWell(
              onTap: () {
                context.push('/product_detail_page',
                    extra: {'mealId': meal.idMeal});
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        context.theme.colorScheme.onBackground.withOpacity(0.2),
                  ),
                ),
                child: Padding(
                  padding: context.paddingHorizontalDefault,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            meal.strMealThumb,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const VerticalSpace.xSmall(),
                      Text(
                        meal.strMeal,
                        style: context.textTheme.bodyLarge,
                        maxLines: 2,
                      ),
                      Text(
                        '${meal.strMeal}, Price',
                        style: context.textTheme.bodySmall?.copyWith(
                            color: context.theme.colorScheme.onBackground
                                .withOpacity(0.4)),
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              '\$1.99',
                              style: context.textTheme.bodyLarge,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                  vertical: context.dynamicHeight(0.015)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: context.theme.colorScheme.primary),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
