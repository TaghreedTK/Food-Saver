import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/previous_products/widgets/previous_Product_tile.dart';

class previousProductListView extends StatelessWidget {
  previousProductListView({super.key, required this.data});
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    log("all items is : $data");
    return SliverList(
      
        delegate: SliverChildBuilderDelegate(childCount: data.length,
            (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: previousProductsTile(data: data[index],)
      );
    }));
  }
}
