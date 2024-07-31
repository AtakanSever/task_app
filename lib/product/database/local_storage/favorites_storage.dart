import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';

abstract class FavoritesLocalStorage {
  Future<void> addItem({required FavoritesItem favoritesItem});
  Future<FavoritesItem> getItem({required FavoritesItem favoritesItem});
  Future<List<FavoritesItem>> getAllItems();
  Future<bool> deleteItem({required FavoritesItem favoritesItem});
  Future<FavoritesItem> updateItem({required FavoritesItem favoritesItem});
}

class FavoritesHiveLocalStorage extends FavoritesLocalStorage{
  late Box<FavoritesItem> _favoritesItemBox;

  FavoritesHiveLocalStorage() {
    _favoritesItemBox = Hive.box<FavoritesItem>('favoritesBox');
  }

  @override
  Future<void> addItem({required FavoritesItem favoritesItem}) async{
    await _favoritesItemBox.add(favoritesItem);
  }

  @override
  Future<bool> deleteItem({required FavoritesItem favoritesItem}) async{
    await favoritesItem.delete();
    return true;
  }

  @override
  Future<List<FavoritesItem>> getAllItems() async{
    List<FavoritesItem> _allFavoritesItems = <FavoritesItem>[];
    _allFavoritesItems = _favoritesItemBox.values.toList();

    if(_allFavoritesItems.isNotEmpty) {
      _allFavoritesItems.sort((FavoritesItem a, FavoritesItem b) => a.price.compareTo(b.price));
    }
    return _allFavoritesItems;
  }

  @override
  Future<FavoritesItem> getItem({required FavoritesItem favoritesItem}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<FavoritesItem> updateItem({required FavoritesItem favoritesItem}) async{
    await favoritesItem.save();
    return favoritesItem;

  }
}