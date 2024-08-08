import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';

class SearchAreaWidget extends StatelessWidget {
  const SearchAreaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.push('/search_page');
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: context.dynamicHeight(0.018),
              horizontal: context.dynamicWidth(0.03)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: context.theme.colorScheme.onBackground
                .withOpacity(0.06),
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/icons/search_icon.svg'),
              HorizontalSpace.xSmall(),
              Text(
                'Search Store',
                style: context.textTheme.labelMedium?.copyWith(
                    color: context.theme.colorScheme.onBackground
                        .withOpacity(0.6)),
              )
            ],
          ),
        ));
  }
}