import 'package:flutter/material.dart';
import 'package:food_saver/common/widgets/circular_icons.dart';
import 'package:food_saver/data/network/api.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/views/offer_detalies_screen.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

// cached network image
class SProductTile extends StatefulWidget {
  const SProductTile({super.key, required this.onPressed, required this.data});
  final VoidCallback? onPressed;
  final Map<String, dynamic> data;
  @override
  State<SProductTile> createState() => _SProductTileState();
}

class _SProductTileState extends State<SProductTile> {
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap:                 (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OfferDetalies(
                ProductId: widget.data["id"],
              );
            },
          ),
        );
      }, 
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 11, right: 11),
        child: Container(
          decoration: BoxDecoration(
            color: THelperFunctions.isDarkMode(context)
                ? TColors.darkerGrey
                : TColors.light,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 5, bottom: 0),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor:
                          dark ? Colors.grey.shade500 : Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 42,
                        backgroundImage: NetworkImage(
                            "${Api.baseUrl2}${widget.data["image"]}"),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:
                    (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OfferDetalies(
                ProductId: widget.data["id"],
              );
            },
          ),
        );
      }, 
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data["name"],
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.data["shop_name"],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.labelLarge,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ends after:',
                                style: Theme.of(context).textTheme.bodyMedium),
                            Text(widget.data["expire_time_humified"],
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                        Text(
                          
                          'Price: ${widget.data["price"]}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 1,
                right: 0,
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(Iconsax.trash,
                      color: dark ? TColors.primary : Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
