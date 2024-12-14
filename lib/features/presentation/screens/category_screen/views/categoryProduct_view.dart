import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/category_screen/widgets/category_tail.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.data});
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: data.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: cateoryTail(
              data: data[index]!,
            ),
          );
        },
      ),
    );
  }
}
