import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
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
import 'package:task_app/product/widget/tabbar/tabbar_widget.dart';

final class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
    
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');
      

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home_page',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnboardingPage(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return PageTransition<Widget>(
                      child: child, type: PageTransitionType.fade)
                  .child;
            },
            child: TabBarPage(
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            name: 'home_page',
            path: '/home_page',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return PageTransition<Widget>(
                    child: child,
                    type: PageTransitionType.fade,
                  ).child;
                },
                child: const HomePage(),
              );
            },
          ),
          GoRoute(
            name: 'search_page',
            path: '/search_page',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return PageTransition<Widget>(
                    child: child,
                    type: PageTransitionType.fade,
                  ).child;
                },
                child: const SearchPage(),
              );
            },
          ),
          GoRoute(
            name: 'cart_page',
            path: '/cart_page',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return PageTransition<Widget>(
                    child: child,
                    type: PageTransitionType.fade,
                  ).child;
                },
                child: const CartPage(),
              );
            },
          ),
          GoRoute(
            name: 'favourite_page',
            path: '/favourite_page',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return PageTransition<Widget>(
                    child: child,
                    type: PageTransitionType.fade,
                  ).child;
                },
                child: const FavoritesPage(),
              );
            },
          ),
          GoRoute(
            name: 'account_page',
            path: '/account_page',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return PageTransition<Widget>(
                    child: child,
                    type: PageTransitionType.fade,
                  ).child;
                },
                child: const AccountPage(),
              );
            },
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
          return SearchWithNamePage();
        },
      ),
      GoRoute(
        path: '/success_checkout_page',
        builder: (context, state) {
          return SuccessCheckoutPage();
        },
      ),
    ],
  );
}
