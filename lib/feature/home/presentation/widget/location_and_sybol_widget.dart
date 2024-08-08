import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class LocationAndSymbolWidget extends StatelessWidget {
  const LocationAndSymbolWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace.xxSmall(),
        Center(
          child: SvgPicture.asset('assets/images/logo_colorful.svg'),
        ),
        const VerticalSpace.xxSmall(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_pin,
              color: context.theme.colorScheme.onBackground
                  .withOpacity(0.6),
            ),
            const HorizontalSpace.xxxSmall(),
            const Text('Canada, Montreal'),
            const VerticalSpace.medium(),
          ],
        ),
      ],
    );
  }
}
