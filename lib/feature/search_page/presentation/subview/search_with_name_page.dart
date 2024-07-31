import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/input/custom_text_input.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/product/widget/list/gridview_list.dart';

class SearchWithNamePage extends StatefulWidget {
  const SearchWithNamePage({super.key});

  @override
  State<SearchWithNamePage> createState() => _SearchWithNamePageState();
}

class _SearchWithNamePageState extends State<SearchWithNamePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingAllDefault,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintStyle: context.textTheme.labelMedium?.copyWith(
                        color: context.theme.colorScheme.onBackground.withOpacity(0.6),
                      ),
                      filled: true,
                      fillColor: context.theme.colorScheme.onBackground.withOpacity(0.1),
                      controller: _searchController,
                      inputType: TextInputType.text,
                      hintText: 'Search Store',
                      prefixWidget: IconButton(
                        onPressed: () {
                          context.read<SearchPageBloc>().add(GetSearchWithName(mealName: _searchController.text));
                        },
                        icon: Icon(
                          Icons.search,
                          color: context.theme.colorScheme.onBackground,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const HorizontalSpace.xSmall(),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Icon(Icons.filter_alt, color: context.theme.colorScheme.onBackground, size: context.dynamicHeight(0.04),),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<SearchPageBloc, SearchPageState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.hasError) {
                      return const Center(child: Text('Meals could not be brought with mealName'));
                    } else if (state.meals.isEmpty) {
                      return const Center(child: Text('meals not found'));
                    } else {
                      return CustomGridViewList(meals: state.meals);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
