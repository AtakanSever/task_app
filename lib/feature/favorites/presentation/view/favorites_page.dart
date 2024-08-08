import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:task_app/feature/favorites/presentation/mixin/favorites_page_mixin.dart';
import 'package:task_app/feature/favorites/presentation/widget/favorites_list_item_widget.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with FavoritesPageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                VerticalSpace.small(),
                Text(
                  'Favorites',
                  style: context.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                VerticalSpace.small(),
                Divider(
                  thickness: 0.6,
                  color: context.theme.colorScheme.onBackground.withOpacity(0.3),
                ),
                allItems.isEmpty
                    ? const Center(child: Text('You have not favorited a meal yet'))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: allItems.length,
                          itemBuilder: (context, index) {
                            final item = allItems[index];
                            return FavoritesItemWidget(
                              item: item,
                              onDelete: () => deleteItemFromFavorites(item),
                            );
                          },
                        ),
                      ),
                VerticalSpace.large(),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: CustomGeneralButtonWidget(
                onTap: () {
                  context.read<FavoritesBloc>().add(AddFavoritesToCart(favoritesList: allItems));
                  print('basıldı');
                },
                width: context.width / 2,
                text: 'Add All To Cart',
                height: context.dynamicHeight(0.075),
                borderRadius: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
