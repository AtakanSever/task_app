import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/feature/favorites/data/favourites_item.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class FavoritesItemWidget extends StatelessWidget {
  final FavoritesItem item;
  final VoidCallback onDelete;

  const FavoritesItemWidget({
    Key? key,
    required this.item,
    required this.onDelete,
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
                  Text('\$${item.price.toString()}'),
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
