import 'package:flutter/material.dart';

class ProductPriceText extends StatefulWidget {
  const ProductPriceText({
    super.key,
    this.islarge = false,
    this.maxLines = 1,
    this.LineThrough = false,
    required this.data,
  });

  final int maxLines;
  final bool islarge;
  final bool LineThrough;
  final Map<dynamic, dynamic> data;

  @override
  State<ProductPriceText> createState() => _ProductPriceTextState();
}

class _ProductPriceTextState extends State<ProductPriceText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data["product_price"].toString(),
      maxLines: widget.maxLines,
      overflow: TextOverflow.ellipsis,
      style: widget.islarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration:
                  widget.LineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration:
                  widget.LineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
