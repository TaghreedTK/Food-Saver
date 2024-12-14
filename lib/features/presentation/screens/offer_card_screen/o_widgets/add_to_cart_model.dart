import 'package:flutter/material.dart';
import 'package:food_saver/data/network/cart/add_to%20_cart.dart';

class AddToCart extends StatefulWidget {
  AddToCart({
    super.key,
    required this.product_id,
  });
  final product_id;

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  CartAddRequest _cartAddRequest = CartAddRequest();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
        minimumSize: MaterialStateProperty.all<Size>(Size(270, 70)),
      ),
      onPressed: () {
        _cartAddRequest.addToCart(
          id: widget.product_id,
        );
      },
      child: Center(
        child: Text(
          'Add To Cart',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
