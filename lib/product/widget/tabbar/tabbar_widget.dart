import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/product/extensions/context_extensions.dart';

class TabBarPage extends StatefulWidget {
  final Widget child;

  const TabBarPage({required this.child, Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _calculateSelectedIndex(GoRouter.of(context).routerDelegate.currentConfiguration.fullPath);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        context.go('/home_page');
        break;
      case 1:
        context.go('/search_page');
        break;
      case 2:
        context.go('/cart_page');
        break;
      case 3:
        context.go('/favourite_page');
        break;
      case 4:
        context.go('/account_page');
        break;
    }
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/home_page')) {
      return 0;
    }
    if (location.startsWith('/search_page')) {
      return 1;
    }
    if (location.startsWith('/cart_page')) {
      return 2;
    }
    if (location.startsWith('/favourite_page')) {
      return 3;
    }
    if (location.startsWith('/account_page')) {
      return 4;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home_tab_icon.svg',
              color: _selectedIndex == 0 ? context.theme.colorScheme.primary : context.theme.colorScheme.onBackground,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/search_tab_icon.svg',
              color: _selectedIndex == 1 ? context.theme.colorScheme.primary : context.theme.colorScheme.onBackground,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart_tab_icon.svg',
              color: _selectedIndex == 2 ? context.theme.colorScheme.primary : context.theme.colorScheme.onBackground,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/favorites_tab_icon.svg',
              color: _selectedIndex == 3 ? context.theme.colorScheme.primary : context.theme.colorScheme.onBackground,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/account_tab_icon.svg',
              color: _selectedIndex == 4 ? context.theme.colorScheme.primary : context.theme.colorScheme.onBackground,
            ),
            label: 'Account',
          ),
        ],
        selectedLabelStyle: context.textTheme.bodySmall?.copyWith(color: context.theme.colorScheme.primary),
        unselectedLabelStyle: context.textTheme.labelMedium?.copyWith(color: context.theme.colorScheme.onBackground),
        currentIndex: _selectedIndex,
        selectedItemColor: context.theme.colorScheme.primary,
        unselectedItemColor: context.theme.colorScheme.onBackground,
        onTap: _onItemTapped,
      ),
    );
  }
}
