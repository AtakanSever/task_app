import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';

class HiveInitialize {
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CartItemAdapter());
    Hive.registerAdapter(FavoritesItemAdapter());
    await Hive.openBox<CartItem>('itemBox');
    await Hive.openBox<FavoritesItem>('favoritesBox');
  }
}
