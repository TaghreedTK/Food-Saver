import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffD4ECF7)),
        minimumSize: MaterialStateProperty.all<Size>(Size(80, 70)),
      ),
      onPressed: () {},
      child: const Center(
        child: Icon(
          Icons.favorite_border_outlined,
          color: Color(0xffDB5E5E),
          size: 30,
        ),
      ),
    );
  }
}
