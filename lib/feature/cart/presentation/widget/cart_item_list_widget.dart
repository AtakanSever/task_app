import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/feature/cart/data/cart_item.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemWidget({
    Key? key,
    required this.item,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              HorizontalSpace.small(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: context.textTheme.bodyLarge,
                    ),
                    Text(
                      item.weight,
                      style: context.textTheme.bodySmall?.copyWith(
                          color: context.theme.colorScheme.onBackground.withOpacity(0.5)),
                    ),
                    VerticalSpace.small(),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: 30),
                          onPressed: onDecrement,
                          color: Colors.grey,
                        ),
                        Container(
                          padding: context.paddingHorizontalDefault + context.paddingVerticalLow,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text('${item.amount}', style: const TextStyle(fontSize: 20.0)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, size: 30),
                          onPressed: onIncrement,
                          color: context.theme.colorScheme.primary,
                        ),
                        HorizontalSpace.medium(),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: onDelete,
                    child: SvgPicture.asset('assets/icons/cancel_icon.svg', width: 16, height: 16),
                  ),
                  VerticalSpace.large(),
                  VerticalSpace.xSmall(),
                  Text('\$${item.price.toStringAsFixed(2)}'),
                ],
              ),
            ],
          ),
          VerticalSpace.small(),
          Divider(
            thickness: 0.6,
            color: context.theme.colorScheme.onBackground.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
