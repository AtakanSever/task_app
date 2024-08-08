import 'package:flutter/material.dart';
import 'package:task_app/feature/home/data/models/meals.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class ProductDetailExpansion extends StatefulWidget {
  final Meal meal;

  const ProductDetailExpansion({Key? key, required this.meal})
      : super(key: key);

  @override
  _ProductDetailExpansionState createState() => _ProductDetailExpansionState();
}

class _ProductDetailExpansionState extends State<ProductDetailExpansion> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingAllDefault,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              children: [
                Text('Product Detail', style: context.textTheme.bodyLarge),
                const Spacer(),
                Icon(
                  _isExpanded
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  size: 30,
                ),
              ],
            ),
          ),
          const VerticalSpace.xxSmall(),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            firstChild: Container(),
            secondChild: Text(
              widget.meal.strInstructions,
              style: context.textTheme.bodySmall?.copyWith(
                color: context.theme.colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }
}