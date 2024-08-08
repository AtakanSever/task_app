import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';

abstract class LocalStorage {
  Future<void> addItem({required CartItem item});
  Future<CartItem> getItem({required String id});
  Future<List<CartItem>> getAllItems();
  Future<bool> deleteItem({required CartItem item});
  Future<CartItem> updateItem({required CartItem item, required double price, required int amount});
  double getTotalPrice();
}

class HiveLocalStorage extends LocalStorage {
  late Box<CartItem> _itemBox;

  HiveLocalStorage() {
    _itemBox = Hive.box<CartItem>('itemBox');
  }

  @override
  Future<void> addItem({required CartItem item}) async {
    await _itemBox.put(item.id, item);
  }

  @override
  Future<bool> deleteItem({required CartItem item}) async {
    await item.delete();
    return true;
  }

  @override
  Future<List<CartItem>> getAllItems() async {
    List<CartItem> _allItems = <CartItem>[];
    _allItems = _itemBox.values.toList();

    if (_allItems.isNotEmpty) {
      _allItems.sort((CartItem a, CartItem b) => b.price.compareTo(a.price));
    }
    return _allItems;
  }

  @override
  double getTotalPrice() {
    double totalPrice = 0.0;
    List<CartItem> _allItems = _itemBox.values.toList();
    for(CartItem item in _allItems) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  @override
  Future<CartItem> getItem({required String id}) async {
    return _itemBox.get(id) as CartItem;
  }

  @override
  Future<CartItem> updateItem({required CartItem item, required double price, required int amount}) async {
    final updatedItem = item.copyWith(amount: amount, price: price);
    await _itemBox.put(item.id, updatedItem); 
    return updatedItem;
  }
}
