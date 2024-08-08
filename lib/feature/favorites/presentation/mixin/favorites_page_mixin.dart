import 'package:flutter/material.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/feature/favorites/presentation/view/favorites_page.dart';
import 'package:task_app/product/database/local_storage/favorites_storage.dart';
import 'package:task_app/product/init/application_initialize.dart';

mixin FavoritesPageMixin on State<FavoritesPage> {
  List<FavoritesItem> allItems = [];
  late FavoritesLocalStorage _localStorage;

  @override
  void initState() {
    _localStorage = locator<FavoritesLocalStorage>();
    getAllTaskFromDb();
    super.initState();
  }

  void getAllTaskFromDb() async {
    allItems = await _localStorage.getAllItems();
    setState(() {});
  }

  void deleteItemFromFavorites(FavoritesItem item) async {
    final localStorage = FavoritesHiveLocalStorage();
    await localStorage.deleteItem(favoritesItem: item);
    getAllTaskFromDb();
  }

}