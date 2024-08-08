import 'package:flutter/material.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

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
        const VerticalSpace.xSmall(),
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
                const HorizontalSpace.xSmall(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                )
              ],
            )
          ],
        ),
        const VerticalSpace.xxSmall(),
        Divider(
          color: context.theme.colorScheme.onBackground.withOpacity(0.5),
          thickness: 0.3,
        ),
      ],
    );
  }
}