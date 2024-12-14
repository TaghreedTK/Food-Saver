import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/previous_orders_screen/widgets/previous_tile.dart';

class previousListView extends StatelessWidget {
  previousListView({super.key, required this.data});
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    log("all items is : $data");
    return SliverList(
      
        delegate: SliverChildBuilderDelegate(childCount: data.length,
            (context, index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: previousTile(
          data: data[index],
        ),
      );
    }));
  }
}
