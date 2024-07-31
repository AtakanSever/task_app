import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:task_app/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:task_app/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:task_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:task_app/feature/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:task_app/feature/product_detail/presentation%20/bloc/product_detail_bloc.dart';
import 'package:task_app/feature/search_page/presentation/bloc/search_page_bloc.dart';
import 'package:task_app/product/router/app_router.dart';
import 'package:task_app/product/theme/notifier/theme_notifier.dart';

final appRouter = AppRouter();

final class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<ProductDetailBloc>(
            create: (context) => ProductDetailBloc()),
        BlocProvider<SearchPageBloc>(create: (context) => SearchPageBloc()),
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
        BlocProvider<FavoritesBloc>(create: (context) => FavoritesBloc()),
      ],
      child: ChangeNotifierProvider(
        create: (context) => ThemeNotifier(),
        child: child,
      ),
    );
  }
}
