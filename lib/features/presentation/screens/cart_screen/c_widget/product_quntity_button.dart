// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/t_circular_icon.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantityaddRemoveButton extends StatefulWidget {
  ProductQuantityaddRemoveButton({
    Key? key,
    required this.quantity,
    required this.onPreespluss,
    required this.onPreessmin,
  }) : super(key: key);
  final Map<dynamic, dynamic> quantity;
  final VoidCallback? onPreespluss;
  final VoidCallback? onPreessmin;
  @override
  State<ProductQuantityaddRemoveButton> createState() =>
      _ProductQuantityaddRemoveButtonState();
}

class _ProductQuantityaddRemoveButtonState
    extends State<ProductQuantityaddRemoveButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 70,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TCircularIcon(
              onPressed:widget.onPreessmin,
              // () {
              //   _changeQuantity.updateQuantity(
              //       operation: '-',
              //       product_id: widget.quantity["product_id"].toString());
              // },
              icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.white
                  : TColors.black,
              backgroundColor: THelperFunctions.isDarkMode(context)
                  ? TColors.darkGrey
                  : TColors.light,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              widget.quantity["quantity"].toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            TCircularIcon(
              onPressed: widget.onPreespluss,
              // _changeQuantity.updateQuantity(
              //     operation: '+',
              //     product_id: widget.quantity["quantity"].toString());

              icon: Iconsax.add,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: TColors.white,
              backgroundColor: TColors.primary,
            ),
          ],
        )
      ],
    );
  }
}
