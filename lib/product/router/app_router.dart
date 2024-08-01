import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/feature/account/presentation/view/account_page.dart';
import 'package:task_app/feature/cart/presentation/subview/success_checkout_page.dart';
import 'package:task_app/feature/cart/presentation/view/cart_page.dart';
import 'package:task_app/feature/favorites/presentation/view/favorites_page.dart';
import 'package:task_app/feature/home/presentation/view/home_page.dart';
import 'package:task_app/feature/onboarding/presentation/view/onboarding_page.dart';
import 'package:task_app/feature/product_detail/presentation%20/view/product_detail.dart';
import 'package:task_app/feature/search_page/presentation/subview/category_of_meals_page.dart';
import 'package:task_app/feature/search_page/presentation/subview/search_with_name_page.dart';
import 'package:task_app/feature/search_page/presentation/view/search_page.dart';
import 'package:task_app/feature/splash/presentation/view/splash_screen_page.dart';
import 'package:task_app/product/widget/tabbar/tabbar_widget.dart';

final class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home_page',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingPage(),
      ),
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) => TabBarPage(child: child),
        routes: [
          GoRoute(
            path: '/home_page',
            pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
          ),
          GoRoute(
            path: '/search_page',
            pageBuilder: (context, state) => const NoTransitionPage(child: SearchPage()),
          ),
          GoRoute(
            path: '/cart_page',
            pageBuilder: (context, state) => const NoTransitionPage(child: CartPage()),
          ),
          GoRoute(
            path: '/favourite_page',
            pageBuilder: (context, state) => const NoTransitionPage(child: FavoritesPage()), 
          ),
          GoRoute(
            path: '/account_page',
            pageBuilder: (context, state) => const NoTransitionPage(child: AccountPage()), 
          ),
        ],
      ),
      GoRoute(
        path: '/product_detail_page',
        builder: (context, state) {
          final extraState = state.extra as Map<String, dynamic>;
          return ProductDetailPage(
            mealId: extraState['mealId'],
          );
        },
      ),
      GoRoute(
        path: '/category_of_meals',
        builder: (context, state) {
          final extraState = state.extra as Map<String, dynamic>;
          return CategoryOfMelas(
            category: extraState['category'],
          );
        },
      ),
      GoRoute(
        path: '/search_with_name_page',
        builder: (context, state) {
          return SearchWithNamePage(
          );
        },
      ),
      GoRoute(
        path: '/success_checkout_page',
        builder: (context, state) {
          return SuccessCheckoutPage(
          );
        },
      ),
    ],
  );
}
