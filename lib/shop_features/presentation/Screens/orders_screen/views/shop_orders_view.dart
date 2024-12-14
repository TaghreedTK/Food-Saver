import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/widget/shop_orders_tile.dart';

class SorderListView extends StatelessWidget {
  SorderListView({super.key, required this.data});
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    log("all items is : $data");
    return SliverList(
      
        delegate: SliverChildBuilderDelegate(childCount: data.length,
            (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: SOrderTile(data: data[index],)
      );
    }));
  }
}