import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:task_app/feature/cart/presentation/view/cart_page.dart';
import 'package:task_app/feature/home/presentation/view/home_page.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';
import 'package:task_app/product/init/application_initialize.dart';

mixin CartPageMixin on State<CartPage> {
  late List<CartItem> allItems = [];
  late LocalStorage localStorage;
  double totalPrice = 0;

  @override
  void initState() {
    localStorage = locator<LocalStorage>();
    context.read<CartBloc>().add(GetTotalPrice());
    getAllTaskFromDb();
    super.initState();
  }

  void getAllTaskFromDb() async {
    allItems = await localStorage.getAllItems();
    totalPrice = localStorage.getTotalPrice();
    setState(() {});
  }

  void deleteItemFromCart(CartItem item) async {
    final localStorage = HiveLocalStorage();
    await localStorage.deleteItem(item: item);
    getAllTaskFromDb();
  }

  void incremetItem(CartItem item) async {
    final localStorage = HiveLocalStorage();
    await localStorage.updateItem(
        item: item,
        amount: (item.amount + 1),
        price: (item.price * (item.amount + 1) / item.amount));
    getAllTaskFromDb();
  }
}
