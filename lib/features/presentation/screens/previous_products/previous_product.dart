import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/previous_products/views/previous_Products_views.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class previousProduct extends StatelessWidget {
  const previousProduct({super.key, required this.data});
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Order Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: darkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        body: 
        CustomScrollView(
          slivers: [previousProductListView(data:data)],
        )
        );
  }
}
