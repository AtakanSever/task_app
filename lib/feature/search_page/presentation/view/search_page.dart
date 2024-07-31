import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';
import 'package:task_app/product/widget/input/custom_text_input.dart';
import 'package:task_app/product/widget/list/gridview_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    context.read<SearchPageBloc>().add(GetCategories());
    super.initState();
  }

  List<Color> backgroundColors = [
    Colors.green,
    Colors.red,
    Colors.purple,
    Colors.yellow,
    Colors.pink,
    Colors.orange,
    Colors.cyanAccent,
    Colors.indigo,
    Colors.teal,
    Colors.limeAccent,
    Colors.deepPurpleAccent,
    Colors.deepOrange,
    Colors.pinkAccent,
    Colors.tealAccent,
  ];

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
                    const Text('Find Products'),
                    const VerticalSpace.xSmall(),
                    InkWell(
                        onTap: () {
                          context.push('/search_with_name_page');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: context.dynamicHeight(0.018),
                              horizontal: context.dynamicWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: context.theme.colorScheme.onBackground
                                .withOpacity(0.06),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/search_icon.svg'),
                              HorizontalSpace.xSmall(),
                              Text(
                                'Search Store',
                                style: context.textTheme.labelMedium?.copyWith(
                                    color: context
                                        .theme.colorScheme.onBackground
                                        .withOpacity(0.6)),
                              )
                            ],
                          ),
                        )),
                    VerticalSpace.small(),
                    Expanded(
                      child: GridView.builder(
                          itemCount: state.categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.9,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.read<SearchPageBloc>().add(
                                    GetSelectedCategory(
                                        selectedCategory:
                                            state.categories[index]));
                                context.push('/category_of_meals', extra: {
                                  'category':
                                      state.categories[index].strCategory
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: backgroundColors[index]
                                            .withOpacity(0.9)),
                                    borderRadius: BorderRadius.circular(18),
                                    color: backgroundColors[index]
                                        .withOpacity(0.2)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    VerticalSpace.medium(),
                                    Expanded(
                                        flex: 6,
                                        child: Image.network(
                                          state.categories[index]
                                              .strCategoryThumb,
                                          fit: BoxFit.contain,
                                        )),
                                    const Spacer(),
                                    Expanded(
                                        flex: 3,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional.bottomCenter,
                                          child: Text(state
                                              .categories[index].strCategory),
                                        )),
                                    const VerticalSpace.medium(),
                                  ],
                                ),
                              ),
                            );
                          }),
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
