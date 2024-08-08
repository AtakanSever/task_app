import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_horizontal_spacer.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: context.paddingAllDefault,
                child: Row(
                  children: [
                    Container(
                      padding: context.paddingAllDefault,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: context.theme.colorScheme.onBackground,
                        ),
                      ),
                      child: SvgPicture.asset('assets/images/logo_colorful.svg'),
                    ),
                    HorizontalSpace.small(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Atakan Sever',
                          style: context.textTheme.bodyLarge,
                        ),
                        Text(
                          'atakansvrs@gmail.com',
                          style: context.textTheme.labelMedium?.copyWith(
                              color: context.theme.colorScheme.onBackground
                                  .withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.7,
                color: context.theme.colorScheme.onBackground.withOpacity(0.4),
              ),
              _accountInfoWidget(
                  context, 'assets/icons/orders_icon.svg', 'Orders'),
              _accountInfoWidget(
                  context, 'assets/icons/my_details_icon.svg', 'My Details'),
              _accountInfoWidget(context,
                  'assets/icons/delivery_address_icon.svg', 'Delivery Address'),
              _accountInfoWidget(context, 'assets/icons/payment_method_icon.svg',
                  'Payment Methods'),
              _accountInfoWidget(
                  context, 'assets/icons/bell_icon.svg', 'Notifications'),
              _accountInfoWidget(context, 'assets/icons/help_icon.svg', 'Help'),
              _accountInfoWidget(context, 'assets/icons/about_icon.svg', 'About'),
              Padding(
                padding: context.paddingAllDefault,
                child: CustomGeneralButtonWidget(
                  width: context.width,
                  height: context.dynamicHeight(0.07),
                  onTap: () {},
                  text: 'Log Out',
                  buttonColor:
                      context.theme.colorScheme.onBackground.withOpacity(0.05),
                  textStyle: context.textTheme.bodyMedium
                      ?.copyWith(color: context.theme.colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _accountInfoWidget(
    BuildContext context,
    String iconPath,
    String text,
  ) {
    return Column(
      children: [
        Padding(
          padding: context.paddingAllDefault,
          child: Row(
            children: [
              SvgPicture.asset(iconPath),
              HorizontalSpace.xSmall(),
              Text(text),
              const Spacer(),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
        Divider(
          thickness: 0.7,
          color: context.theme.colorScheme.onBackground.withOpacity(0.4),
        ),
      ],
    );
  }
}
