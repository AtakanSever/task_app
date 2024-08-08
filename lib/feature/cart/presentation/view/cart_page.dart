import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:task_app/feature/cart/presentation/mixin/cart_page_mixin.dart';
import 'package:task_app/feature/cart/presentation/widget/cart_item_list_widget.dart';
import 'package:task_app/feature/cart/presentation/widget/checkout_bottom_sheet.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> with CartPageMixin {
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
                const VerticalSpace.small(),
                Text(
                  'My Cart',
                  style: context.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace.small(),
                Divider(
                  thickness: 0.6,
                  color:
                      context.theme.colorScheme.onBackground.withOpacity(0.3),
                ),
                ValueListenableBuilder<Box<CartItem>>(
                  valueListenable: Hive.box<CartItem>('itemBox').listenable(),
                  builder: (context, box, _) {
                    final allItems = box.values.toList();
                    return allItems.isEmpty
                        ? const Center(
                            child: Text('You have not add to cart a meal yet'))
                        : Expanded(
                            child: ListView.builder(
                              itemCount: allItems.length,
                              itemBuilder: (context, index) {
                                final item = allItems[index];
                                return CartItemWidget(
                                    item: item,
                                    onDelete: () => deleteItemFromCart(item),
                                    onIncrement: () {
                                      context.read<CartBloc>().add(
                                          IncrementCartProductPiece(
                                              cartItem: item));
                                    },
                                    onDecrement: () {
                                      context.read<CartBloc>().add(
                                          DecrementCartProductPiece(
                                              cartItem: item));
                                    });
                              },
                            ),
                          );
                  },
                ),
                const VerticalSpace.large()
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)
                      ),
                      minimumSize: Size(context.width, context.dynamicHeight(0.07)),
                      backgroundColor: context.theme.colorScheme.primary,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return CheckoutBottomSheet(
                                allItems: Hive.box<CartItem>('itemBox')
                                    .values
                                    .toList());
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Go To Checkout', style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),),
                        HorizontalSpace.small(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: context.theme.colorScheme.onBackground.withOpacity(0.2),
                          ),
                          child: Text('\$ ${state.totalPrice.toStringAsFixed(2)}', style: context.textTheme.bodySmall?.copyWith(color: Colors.white),),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
