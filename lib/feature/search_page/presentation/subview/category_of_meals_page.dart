import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/search_page/data/category_of_meals.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/view/product_detail.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(),
      ),
    );
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
                          )),
                      Text(
                        state.selectedCategory!.strCategory,
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
                                      VerticalSpace.large(),
                                      Stack(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                icon: SvgPicture.asset(
                                                  'assets/icons/cancel_icon.svg',
                                                ),
                                                onPressed: () {
                                                  context.pop();
                                                },
                                              ),
                                              Text(
                                                'Filters',
                                                style: context.textTheme.bodyLarge,
                                              ),
                                              SizedBox(width: 48), 
                                            ],
                                          ),]
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: context.theme.colorScheme.onBackground.withOpacity(0.5),
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
                          ))
                    ],
                  ),
                  VerticalSpace.small(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: CustomGridViewList<CategoryOfMeals>(
                        isHaveWidget: false,
                        meals: state.categoryOfMeals,
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
