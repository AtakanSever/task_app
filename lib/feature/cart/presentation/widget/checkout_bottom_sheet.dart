import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:task_app/feature/cart/presentation/widget/checkout_info_widget.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({
    super.key,
    required List<CartItem> allItems,
  }) : _allItems = allItems;

  final List<CartItem> _allItems;

  @override
  Widget build(BuildContext context) {
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
                      '\$${context.read<CartBloc>().state.totalPrice.toStringAsFixed(2)}',
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
  }
}
