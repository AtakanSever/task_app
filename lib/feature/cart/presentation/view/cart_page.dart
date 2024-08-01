import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
                    ? const Center(
                        child: Text('You have not add to cart a meal yet'))
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
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: context.height > 900 ? context.height / 1.8 : context.height / 1.4,
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.background,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(24)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: context.paddingAllDefault,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Checkout',
                                      style: context.textTheme.titleSmall,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/cancel_icon.svg',
                                      color: context
                                          .theme.colorScheme.onBackground,
                                      height: 18,
                                      width: 18,
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: context.theme.colorScheme.onBackground
                                    .withOpacity(0.5),
                                thickness: 0.3,
                              ),
                              Padding(
                                padding: context.paddingHorizontalDefault,
                                child: Column(
                                  children: [
                                    CheckoutInfoWidget(
                                        title: 'Delivery',
                                        widget: Text(
                                          'Select Method',
                                          style: context.textTheme.bodySmall,
                                        )),
                                    CheckoutInfoWidget(
                                        title: 'Payment',
                                        widget: SvgPicture.asset(
                                            'assets/icons/payment_card_icon.svg')),
                                    CheckoutInfoWidget(
                                        title: 'Promo Code',
                                        widget: Text(
                                          'Pick Discount',
                                          style: context.textTheme.bodySmall,
                                        )),
                                    CheckoutInfoWidget(
                                        title: 'Total Cost',
                                        widget: Text(
                                          "₺13.97",
                                          style: context.textTheme.bodySmall,
                                        )),
                                    VerticalSpace.small(),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'By placing an order you agree to our\nTerms And Conditions',
                                          style: context.textTheme.labelMedium
                                              ?.copyWith(
                                                  color: context.theme
                                                      .colorScheme.onBackground
                                                      .withOpacity(0.5)),
                                        )),
                                        VerticalSpace.medium(),
                                        CustomGeneralButtonWidget(onTap: () {
                                          context.read<CartBloc>().add(ClearAllCart(cartList: _allItems));
                                          context.push('/success_checkout_page');
                                        }, text: 'Place Order', width: context.width / 1.1, height: context.dynamicHeight(0.07), borderRadius: 19,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
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

class CheckoutInfoWidget extends StatelessWidget {
  final String title;
  final Widget widget;
  const CheckoutInfoWidget({
    required this.title,
    required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace.xSmall(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(
                  color:
                      context.theme.colorScheme.onBackground.withOpacity(0.5)),
            ),
            Row(
              children: [
                widget,
                HorizontalSpace.xSmall(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            )
          ],
        ),
        VerticalSpace.xxSmall(),
        Divider(
          color: context.theme.colorScheme.onBackground.withOpacity(0.5),
          thickness: 0.3,
        ),
      ],
    );
  }
}
