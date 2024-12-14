import 'package:flutter/material.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';

class TRoundImage extends StatelessWidget {
  const TRoundImage({
    super.key,
    required this.imageUrl,
    this.border,
    this.padding,
    this.width,
    this.height,
    this.applyImageRadius = true,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.backgroundColor = TColors.light,
    this.borderRadius = TSizes.md,
    this.onPressed,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BoxFit? fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(fit: fit, image: NetworkImage(imageUrl)
              // isNetworkImage
              //   ? NetworkImage(imageUrl)
              //    : AssetImage(imageUrl) as ImageProvider,
              ),
        ),
      ),
    );
  }
}
