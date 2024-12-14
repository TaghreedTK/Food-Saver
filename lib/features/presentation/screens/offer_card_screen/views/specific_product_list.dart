import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/o_widgets/product_card.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class specificProductList extends StatelessWidget {
  const specificProductList({super.key, required this.data});
  final List<dynamic> data;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: data.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: productCard(
              dark: dark,
              data: data[index],
            ),
          );
        },
      ),
    );
  }
}
