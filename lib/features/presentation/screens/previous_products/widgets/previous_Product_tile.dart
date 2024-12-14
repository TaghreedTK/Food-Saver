import 'package:flutter/material.dart';
import 'package:food_saver/data/network/api.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class previousProductsTile extends StatefulWidget {
  const previousProductsTile({super.key, required this.data});
  final Map<dynamic, dynamic> data;

  @override
  State<previousProductsTile> createState() => _previousProductsTileState();
}

class _previousProductsTileState extends State<previousProductsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              "${Api.baseUrl2}${widget.data['product_image']}",
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.data['product_name'],
                      style: Theme.of(context).textTheme.headlineSmall,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "${widget.data['product_price']} E£",
                      // widget.data["product_name"],
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    Text(
                      widget.data["product_shop_name"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      width: TSizes.xs,
                    ),
                    Icon(
                      Iconsax.verify5,
                      color: TColors.primary,
                      size: TSizes.iconxs,
                    )
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  "quantity:${widget.data['quantity']}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    Text(
                      "From: ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      "${widget.data['product_expire_time_humified']}",
                      // widget.data['product_name'],
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
