import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/search_page/data/category_of_meals.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/feature/search_page/presentation/mixin/category_of_meals_mixin.dart';
import 'package:task_app/feature/search_page/presentation/widget/category_of_meals/filters_bottom_sheet.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';
import 'package:task_app/product/widget/list/gridview_list.dart';

class CategoryOfMelas extends StatefulWidget {
  final String category;

  const CategoryOfMelas({super.key, required this.category});

  @override
  State<CategoryOfMelas> createState() => _CategoryOfMelasState();
}

class _CategoryOfMelasState extends State<CategoryOfMelas> with CategoryOfMealsMixin{

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
                              return FiltersBottomSheet(state: state,);
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