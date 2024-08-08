import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/search_page/data/category_of_meals.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/feature/search_page/presentation/subview/category_of_meals_page.dart';

mixin CategoryOfMealsMixin on State<CategoryOfMelas> {
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

}