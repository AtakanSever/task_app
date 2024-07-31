import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_app/product/init/application_initialize.dart';
import 'package:task_app/product/init/product_localization.dart';
import 'package:task_app/product/init/state_initialize.dart';
import 'package:task_app/product/router/app_router.dart';
import 'package:task_app/product/theme/custom_light_theme.dart';

Future<void> main() async {
  await ApplicationInitialize().make();
  runApp(ProductLocalization(child: const StateInitialize(child: _MyApp())));
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'task app',
      locale: context.locale,
      theme: CustomLightTheme().themeData,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      routerConfig: AppRouter().router,
      builder: BotToastInit(),
    );
  }
}
