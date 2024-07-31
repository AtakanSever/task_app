import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';

abstract class LocalStorage {
  Future<void> addItem({required CartItem item});
  Future<CartItem> getItem({required CartItem item});
  Future<List<CartItem>> getAllItems();
  Future<bool> deleteItem({required CartItem item});
  Future<CartItem> updateItem({required CartItem item});
}

class HiveLocalStorage extends LocalStorage{
  late Box<CartItem> _itemBox;

  HiveLocalStorage() {
    _itemBox = Hive.box<CartItem>('itemBox');
  }

  @override
  Future<void> addItem({required CartItem item}) async{
    await _itemBox.add(item);
  }

  @override
  Future<bool> deleteItem({required CartItem item}) async{
    await item.delete();
    return true;
  }

  @override
  Future<List<CartItem>> getAllItems() async{
    List<CartItem> _allItems = <CartItem>[];
    _allItems = _itemBox.values.toList();

    if(_allItems.isNotEmpty) {
      _allItems.sort((CartItem a, CartItem b) => a.price.compareTo(b.price));
    }
    return _allItems;
  }

  @override
  Future<CartItem> getItem({required CartItem item}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<CartItem> updateItem({required CartItem item}) async{
    await item.save();
    return item;

  }
}