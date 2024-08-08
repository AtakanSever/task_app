import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/feature/search_page/presentation/widget/category_of_meals/filter_check.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class FiltersBottomSheet extends StatelessWidget {
  final SearchPageState state;
  const FiltersBottomSheet({
    super.key,
    required this.state
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      child: Column(
        children: [
          const VerticalSpace.large(),
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Filters',
                  style: context.textTheme.bodyLarge,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/cancel_icon.svg',
                    color: context.theme.colorScheme
                        .onBackground,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: context.height,
              width: context.width,
              decoration: BoxDecoration(
                  color: context
                      .theme.colorScheme.onBackground
                      .withOpacity(0.05),
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(22))),
              child: Padding(
                padding: context.paddingAllDefault,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text('Categories',
                        style: context
                            .textTheme.displaySmall
                            ?.copyWith(fontSize: 24)),
                    const VerticalSpace.xSmall(),
                    FilterCheck(
                      label: 'Dessert',
                      initialValue:
                          state.filteredCategoryStates['Dessert'] ?? false,
                      onChanged: (bool value) {
                        value == true
                            ? context
                                .read<
                                    SearchPageBloc>()
                                .add(AddFilteredCategory(
                                    category:
                                        'Dessert'))
                            : context
                                .read<
                                    SearchPageBloc>()
                                .add(const RemoveFilteredCategory(
                                    category:
                                        'Dessert'));
                      },
                    ),
                    FilterCheck(
                      label: 'Pasta',
                      initialValue:
                          state.filteredCategoryStates['Pasta'] ?? false,
                      onChanged: (bool value) {
                        value == true
                            ? context
                                .read<
                                    SearchPageBloc>()
                                .add(
                                    AddFilteredCategory(
                                        category:
                                            'Pasta'))
                            : context
                                .read<
                                    SearchPageBloc>()
                                .add(
                                    const RemoveFilteredCategory(
                                        category:
                                            'Pasta'));
                      },
                    ),
                    FilterCheck(
                      label: 'Seafood',
                      initialValue:
                          state.filteredCategoryStates['Seafood'] ?? false,
                      onChanged: (bool value) {
                        value == true
                            ? context
                                .read<
                                    SearchPageBloc>()
                                .add(AddFilteredCategory(
                                    category:
                                        'Seafood'))
                            : context
                                .read<
                                    SearchPageBloc>()
                                .add(const RemoveFilteredCategory(
                                    category:
                                        'Seafood'));
                      },
                    ),
                    FilterCheck(
                      label: 'Vegetarian',
                      initialValue:
                          state.filteredCategoryStates['Vegetarian'] ?? false,
                      onChanged: (bool value) {
                        value == true
                            ? context
                                .read<
                                    SearchPageBloc>()
                                .add(AddFilteredCategory(
                                    category:
                                        'Vegetarian'))
                            : context
                                .read<
                                    SearchPageBloc>()
                                .add(const RemoveFilteredCategory(
                                    category:
                                        'Vegetarian'));
                      },
                    ),
                    const VerticalSpace.medium(),
                    Text('Brand',
                        style: context
                            .textTheme.displaySmall
                            ?.copyWith(fontSize: 24)),
                    const VerticalSpace.xxSmall(),
                    FilterCheck(
                      label: 'Breakfast',
                      initialValue:
                          state.filteredCategoryStates['Breakfast'] ?? false,
                      onChanged: (bool value) {
                        value == true
                            ? context
                                .read<
                                    SearchPageBloc>()
                                .add(AddFilteredCategory(
                                    category:
                                        'Breakfast'))
                            : context
                                .read<
                                    SearchPageBloc>()
                                .add(const RemoveFilteredCategory(
                                    category:
                                        'Breakfast'));
                      },
                    ),
                    FilterCheck(
                      label: 'Starter',
                      initialValue:
                          state.filteredCategoryStates['Starter'] ?? false,
                      onChanged: (bool value) {
                        value == true
                            ? context
                                .read<
                                    SearchPageBloc>()
                                .add(AddFilteredCategory(
                                    category:
                                        'Starter'))
                            : context
                                .read<
                                    SearchPageBloc>()
                                .add(const RemoveFilteredCategory(
                                    category:
                                        'Starter'));
                      },
                    ),
                    FilterCheck(
                      label: 'Beef',
                      initialValue:
                          state.filteredCategoryStates['Beef'] ?? false,
                      onChanged: (bool value) {
                        value == true
                            ? context
                                .read<
                                    SearchPageBloc>()
                                .add(
                                    AddFilteredCategory(
                                        category:
                                            'Beef'))
                            : context
                                .read<
                                    SearchPageBloc>()
                                .add(
                                    const RemoveFilteredCategory(
                                        category:
                                            'Beef'));
                      },
                    ),
                    FilterCheck(
                      label: 'Chicken',
                      initialValue:
                          state.filteredCategoryStates['Chicken'] ?? false,
                      onChanged: (bool value) {
                        value == true
                            ? context
                                .read<
                                    SearchPageBloc>()
                                .add(AddFilteredCategory(
                                    category:
                                        'Chicken'))
                            : context
                                .read<
                                    SearchPageBloc>()
                                .add(const RemoveFilteredCategory(
                                    category:
                                        'Chicken'));
                      },
                    ),
                    const Spacer(),
                    SizedBox(
                        width: double.infinity,
                        child:
                            CustomGeneralButtonWidget(
                          onTap: () {
                            context
                                .read<SearchPageBloc>()
                                .add(const GetFilteredCategoriesMeals());
                            context.pop();
                          },
                          text: 'Apply Filter',
                          buttonColor: context.theme
                              .colorScheme.primary,
                          width: context.width / 1.4,
                        )),
                    const VerticalSpace.medium()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}