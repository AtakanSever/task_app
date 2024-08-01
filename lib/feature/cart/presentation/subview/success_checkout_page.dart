import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class SuccessCheckoutPage extends StatefulWidget {
  const SuccessCheckoutPage({super.key});

  @override
  State<SuccessCheckoutPage> createState() => _SuccessCheckoutPageState();
}

class _SuccessCheckoutPageState extends State<SuccessCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/success_page_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            context.height > 900 ? VerticalSpace(height: context.dynamicHeight(0.2)) : VerticalSpace.xxSmall(),
            SvgPicture.asset('assets/images/success_check.svg'),
            VerticalSpace.medium(),
            Text(
              'Your Order has been \naccepted',
              style: context.textTheme.bodyLarge?.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            VerticalSpace.small(),
            Text(
              'Your items have been placed and are \non their way to being processed',
              style: context.textTheme.labelLarge?.copyWith(
                  color: context.theme.colorScheme.onBackground.withOpacity(0.5)),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            CustomGeneralButtonWidget(onTap: () {}, text: 'Track Order', width: context.width /1.2, borderRadius: 19,),
            VerticalSpace.xSmall(),
            TextButton(onPressed: () {
              context.push('/home_page');
            }, child: Text('Back to home', style: context.textTheme.bodyMedium,)),
            VerticalSpace.large()
          ],
        ),
      ),
    );
  }
}
