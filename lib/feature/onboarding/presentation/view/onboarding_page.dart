import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/product/extensions/context_extensions.dart';
import 'package:task_app/product/widget/button/custom_button.dart';
import 'package:task_app/product/widget/dynamic_vertical_spacer.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: context.width,
            height: context.height,
            child: Positioned(
              bottom: 30,
              left: 20,
              right: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/logo.svg'),
                  const VerticalSpace.xSmall(),
                  Text(
                    'Welcome \nto our store',
                    style: context.textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const VerticalSpace.xSmall(),
                  Text(
                    'Get your groceries in as fast as one hour',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const VerticalSpace.small(),
                  Padding(
                    padding: context.paddingHorizontalHigh,
                    child: CustomGeneralButtonWidget(
                      height: context.dynamicHeight(0.08),
                      width: context.width,
                      borderRadius: 19,
                      onTap: () {
                        context.push('/home_page');
                      },
                      text: 'Get Started',
                    ),
                  ),
                  const VerticalSpace.large()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
