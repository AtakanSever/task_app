import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.primary,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            const HorizontalSpace.xSmall(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('nectar', style: context.textTheme.displayMedium?.copyWith(color: Colors.white, ),),
                Text('online groceriet', style: context.textTheme.labelMedium?.copyWith(color: Colors.white, letterSpacing: 3),)
              ],
            )
          ],
        ),
      ),
    );
  }
}