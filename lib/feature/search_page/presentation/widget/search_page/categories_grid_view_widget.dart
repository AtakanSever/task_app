import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class CategoriesGridViewWidget extends StatelessWidget {
  final SearchPageState state;
  const CategoriesGridViewWidget({
    super.key,
    required this.backgroundColors,
    required this.state
  });

  final List<Color> backgroundColors;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
        });
  }
}