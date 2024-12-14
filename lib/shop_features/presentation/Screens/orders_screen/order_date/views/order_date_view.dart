import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/order_date/widget/order_date_tile.dart';

class SOrderDateListView extends StatelessWidget {
  SOrderDateListView({super.key, required this.data});
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    log("all items is : $data");
    return SliverList(
      
        delegate: SliverChildBuilderDelegate(childCount: data.length,
            (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: SorderDateTile(
          data: data[index],
        ),
      );
    }));
  }
}