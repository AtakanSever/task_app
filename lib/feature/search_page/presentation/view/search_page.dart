import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/feature/search_page/presentation/mixin/search_page_mixin.dart';
import 'package:task_app/feature/search_page/presentation/widget/search_page/categories_grid_view_widget.dart';
import 'package:task_app/feature/search_page/presentation/widget/search_page/search_product_widget.dart';
import 'package:task_app/product/extensions/context_extensions.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with SearchPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPageBloc, SearchPageState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.hasError) {
            return const Center(child: Text('Failed to load categories'));
          } else if (state.categories.isEmpty) {
            return const Center(child: Text('No categories available'));
          } else {
            return SafeArea(
              child: Padding(
                padding: context.paddingAllDefault,
                child: Column(
                  children: [
                    SearchProductWidget(),
                    Expanded(
                      child: CategoriesGridViewWidget(
                          backgroundColors: backgroundColors, state: state),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
