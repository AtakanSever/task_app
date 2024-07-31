import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:task_app/product/database/hive_initialize.dart';
import 'package:task_app/product/database/local_storage/favorites_storage.dart';
import 'package:task_app/product/database/local_storage/local_storage.dart';

final locator = GetIt.instance;

@immutable
final class ApplicationInitialize {
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
      },
    );
  }

  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    await _setRotation();
    await HiveInitialize().init();
    setUpGetIt();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  Future<void> _setRotation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void setUpGetIt() {
    locator.registerSingleton<LocalStorage>(HiveLocalStorage());
    locator.registerSingleton<FavoritesLocalStorage>(FavoritesHiveLocalStorage());
  }
}
