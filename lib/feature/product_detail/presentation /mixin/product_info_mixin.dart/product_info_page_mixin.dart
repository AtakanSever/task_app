import 'package:flutter/material.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/feature/product_detail/presentation%20/widget/product_info_widget.dart';
import 'package:task_app/product/database/local_storage/favorites_storage.dart';
import 'package:task_app/product/init/application_initialize.dart';

mixin ProductInfoPageMixin on State<ProductInfoWidget> {
    ValueNotifier<bool> isFavoriteMeal = ValueNotifier<bool>(false);
  List<FavoritesItem> allItems = [];
  late FavoritesLocalStorage _localStorage;
  FavoritesItem? favoriteItem;

  @override
  void initState() {
    super.initState();
    _localStorage = locator<FavoritesLocalStorage>();
    findFavoriteItem();
    getAllTaskFromDb();
  }

  Future<void> findFavoriteItem() async {
    List<FavoritesItem> _allItems = await _localStorage.getAllItems();
    for (FavoritesItem item in _allItems) {
      if (item.name == widget.meal.strMeal) {
        favoriteItem = item;
        isFavoriteMeal.value = true;
        return;
      }
    }
    isFavoriteMeal.value = false;
  }

  void deleteItemFromFavorites(FavoritesItem item) async {
    final localStorage = FavoritesHiveLocalStorage();
    await localStorage.deleteItem(favoritesItem: item);
    findFavoriteItem(); 
  }

  void getAllTaskFromDb() async {
    allItems = await _localStorage.getAllItems();
    setState(() {});
  }

}