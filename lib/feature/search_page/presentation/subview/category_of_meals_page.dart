import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/search_page/data/category_of_meals.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/view/product_detail.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';
import 'package:task_app/product/widget/list/gridview_list.dart';

class CategoryOfMelas extends StatefulWidget {
  final String category;

  const CategoryOfMelas({super.key, required this.category});

  @override
  State<CategoryOfMelas> createState() => _CategoryOfMelasState();
}

class _CategoryOfMelasState extends State<CategoryOfMelas> {
  @override
  void initState() {
    context
        .read<SearchPageBloc>()
        .add(GetCategoryOfMeals(category: widget.category));
    super.initState();
  }

  void _onCategoryTap(BuildContext context, CategoryOfMeals category) {
    context.push('/product_detail_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: context.paddingHorizontalDefault,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: context.theme.colorScheme.onBackground,
                        ),
                      ),
                      Text(
                        state.selectedCategory?.strCategory ?? 'Category',
                        style: context.textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
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
                            },
                          );
                        },
                        icon: Icon(
                          Icons.filter_alt,
                          size: 25,
                          color: context.theme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace.small(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: CustomGridViewList<CategoryOfMeals>(
                        isHaveWidget: false,
                        meals: state.filteredMeals.isNotEmpty ? state.filteredMeals : state.categoryOfMeals, // Update here
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FilterCheck extends StatefulWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const FilterCheck({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _FilterCheckState createState() => _FilterCheckState();
}

class _FilterCheckState extends State<FilterCheck> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialValue;
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onChanged(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: _toggleSelection,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      context.theme.colorScheme.onBackground.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(8),
                color: _isSelected
                    ? context.theme.colorScheme.primary
                    : Colors.transparent,
              ),
              child: Icon(
                Icons.check,
                color: _isSelected
                    ? context.theme.colorScheme.onPrimary
                    : Colors.transparent,
                size: 20,
              ),
            ),
            const HorizontalSpace.xSmall(),
            Text(
              widget.label,
              style: context.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
