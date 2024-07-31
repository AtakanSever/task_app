import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/bloc/product_detail_bloc.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/init/application_initialize.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> _allItems = [];
  late LocalStorage _localStorage;

  @override
  void initState() {
    _localStorage = locator<LocalStorage>();
    getAllTaskFromDb();
    super.initState();
  }

  void getAllTaskFromDb() async {
    _allItems = await _localStorage.getAllItems();
    setState(() {});
  }

  void deleteItemFromCart(CartItem item) async {
    final localStorage = HiveLocalStorage();
    await localStorage.deleteItem(item: item);
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
                  'My Cart',
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
                    ? const Center(child: Text('You have not add to cart a meal yet'))
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
                                                  onPressed: () {
                                                    setState(() {
                                                      context.read<CartBloc>().add(
                                                          DecrementCartProductPiece(
                                                              cartItem: item));
                                                      getAllTaskFromDb();
                                                    });
                                                  },
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
                                                  onPressed: () {
                                                    setState(() {
                                                      context.read<CartBloc>().add(
                                                          IncrementCartProductPiece(
                                                              cartItem: item));
                                                      getAllTaskFromDb();
                                                    });
                                                  },
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
                                              deleteItemFromCart(item);
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
                onTap: () {},
                width: context.width / 2,
                text: 'Go To Checkout',
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
