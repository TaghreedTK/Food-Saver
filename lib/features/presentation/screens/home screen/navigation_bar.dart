import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/cart_screen_items.dart';
import 'package:food_saver/features/presentation/screens/previous_orders_screen/previous_orders.dart';
import 'package:food_saver/features/presentation/screens/profile/profile.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/utils/constants/colors.dart';

class My_navigationBar extends StatefulWidget {
  My_navigationBar({super.key});

  @override
  State<My_navigationBar> createState() => _My_navigationBarState();
}

class _My_navigationBarState extends State<My_navigationBar> {
  int _selectedindex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  final items = <Widget>[
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(Icons.favorite, size: 30),
    Icon(Icons.shopping_cart, size: 30),
    Icon(Icons.person, size: 30),
    Icon(Icons.receipt_long_rounded, size: 30),
  ];

  List Screens = [
    homeScreen(),
    wishlistScreen(),
    CartScreen(),
    ProfileScreen(),
    previousOrders(),
  ];

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: _selectedindex,
        onTap: _onItemTapped,
        color: darkMode ? TColors.dark : TColors.primary,
        backgroundColor: darkMode ? TColors.white : TColors.light,
      ),
      body: Screens[_selectedindex],
    );
  }
}
