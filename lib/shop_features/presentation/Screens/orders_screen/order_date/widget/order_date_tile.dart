import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/previous_products/previous_product.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/all_orders.dart';
import 'package:intl/intl.dart';

class SorderDateTile extends StatefulWidget {
  const SorderDateTile({super.key, required this.data});
  final Map<dynamic, dynamic> data;
  @override
  State<SorderDateTile> createState() => _SorderDateTileState();
}

class _SorderDateTileState extends State<SorderDateTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SallOrders(
                  data: widget.data["cart_items"],
                );
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/logos/Food Saver logo.jpg',
                  width: 90.0,
                  height: 90.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order status is:${widget.data["status"]}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      'Date: ${DateFormat("yyyy-MM-dd").format(DateTime.parse(widget.data["start_cart"]))} ${DateFormat.jm().format(DateTime.parse(widget.data["start_cart"]))}',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}