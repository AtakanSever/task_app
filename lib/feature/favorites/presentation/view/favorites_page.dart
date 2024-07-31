import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/bloc/product_detail_bloc.dart';
import 'package:task_app/product/database/local_storage/favorites_storage.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/init/application_initialize.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<FavoritesItem> _allItems = [];
  late FavoritesLocalStorage _localStorage;

  @override
  void initState() {
    _localStorage = locator<FavoritesLocalStorage>();
    getAllTaskFromDb();
    super.initState();
  }

  void getAllTaskFromDb() async {
    _allItems = await _localStorage.getAllItems();
    setState(() {});
  }

  void deleteItemFromFavorites(FavoritesItem item) async {
    final localStorage = FavoritesHiveLocalStorage();
    await localStorage.deleteItem(favoritesItem: item);
    getAllTaskFromDb();
  }

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
                  color:
                      context.theme.colorScheme.onBackground.withOpacity(0.3),
                ),
                _allItems.isEmpty
                    ? const Center(child: Text('You have not favorited a meal yet'))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _allItems.length,
                          itemBuilder: (context, index) {
                            final item = _allItems[index];
                            return Padding(
                              padding: context.paddingAllDefault,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.network(
                                            item.imageUrl,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          )),
                                      HorizontalSpace.small(),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.name,
                                              style:
                                                  context.textTheme.bodyLarge,
                                            ),
                                            Text(
                                              item.weight,
                                              style: context.textTheme.bodySmall
                                                  ?.copyWith(
                                                      color: context
                                                          .theme
                                                          .colorScheme
                                                          .onBackground
                                                          .withOpacity(0.5)),
                                            ),
                                            VerticalSpace.small(),
                                            Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    size: 30,
                                                  ),
                                                  onPressed: () {},
                                                  color: Colors.grey,
                                                ),
                                                Container(
                                                  padding: context
                                                          .paddingHorizontalDefault +
                                                      context
                                                          .paddingVerticalLow,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Text(
                                                    '${item.amount}',
                                                    style: const TextStyle(
                                                        fontSize: 20.0),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.add,
                                                    size: 30,
                                                  ),
                                                  onPressed: () {},
                                                  color: context.theme
                                                      .colorScheme.primary,
                                                ),
                                                HorizontalSpace.medium(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              deleteItemFromFavorites(item);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/icons/cancel_icon.svg',
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          VerticalSpace.large(),
                                          VerticalSpace.xSmall(),
                                          Text(
                                            item.price.toString(),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  VerticalSpace.small(),
                                  Divider(
                                    thickness: 0.6,
                                    color: context
                                        .theme.colorScheme.onBackground
                                        .withOpacity(0.3),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      VerticalSpace.large()
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: CustomGeneralButtonWidget(
                onTap: () {
                  context.read<FavoritesBloc>().add(AddFavoritesToCart(favoritesList: _allItems));
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
