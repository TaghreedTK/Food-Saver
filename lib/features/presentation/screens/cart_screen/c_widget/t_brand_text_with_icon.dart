import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/enums.dart';
import 'package:food_saver/utils/constants/sizes.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Flexible(
        child: Text(
          title,
          maxLines: maxLines,
          textAlign: textAlign,
          style: TextStyle(color: textColor, fontSize: 10),
        ),
      ),
      const SizedBox(width: TSizes.xs),
      Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconxs),
    ]);
  }
}