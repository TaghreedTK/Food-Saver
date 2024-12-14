import 'package:flutter/material.dart';
import 'package:food_saver/data/network/product_request.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/o_widgets/add_to_cart_model.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/o_widgets/favourite_button.dart';
import 'package:food_saver/features/presentation/screens/offer_card_screen/views/specific_product_list.dart';


class OfferDetalies extends StatefulWidget {
  OfferDetalies({super.key, required this.ProductId});
  final ProductId;

  @override
  State<OfferDetalies> createState() => _OfferDetaliesState();
}

class _OfferDetaliesState extends State<OfferDetalies> {
  ProductRequest _PrudoctData = ProductRequest();
  var future;
  @override
  void initState() {
    super.initState();
    future = _PrudoctData.getProductData(id: widget.ProductId);
  }

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      body: CustomScrollView(slivers: [
        FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<dynamic>? snapshot) {
            if (snapshot!.hasError) {
              print(snapshot.error);
              return SliverToBoxAdapter(
                child: Center(
                  child: Text("Error while getting data"),
                ),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  print('taghreed ${snapshot.data.length}');

                  return specificProductList(
                    data: snapshot.data,
                  );
                } else {
                  return Center(
                    child: Text("No Data"),
                  );
                }
              } else {
                return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()));
              }
            }
          },
        ),
      ]
          // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //   Container(
          //     height: MediaQuery.of(context).size.height / 2,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //       color: dark ? Colors.grey.shade400 : Color(0xffD4ECF7),
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(30),
          //         bottomRight: Radius.circular(30),
          //       ),
          //     ),
          //     child: Stack(
          //       children: [
          //         Center(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8),
          //             child: Image.asset(
          //               'assets/categories/Bakery.jpg',
          //               scale: 1.8,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(
          //             left: 15,
          //             top: 20,
          //           ),
          //           child: InkWell(
          //             onTap: () {
          //               Navigator.pop(context);
          //             },
          //             child: Icon(
          //               Icons.arrow_back_ios_new,
          //               size: 27,
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          //   SizedBox(
          //     height: 10,
          //   ),
          //   Padding(
          //     padding: EdgeInsets.all(20),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'bread', //name of product
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 26,
          //               ),
          //             ),
          //             Text(
          //               '\$140', //price
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 25,
          //               ),
          //             ),
          //           ],
          //         ),
          //         Text(
          //           'address', //address
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             color: Colors.grey,
          //             fontSize: 18,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 5,
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             RateOffer(),
          //             Text(
          //               ' 2 hours left', //address
          //               style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.grey,
          //                 fontSize: 18,
          //               ),
          //             ),
          //           ],
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Text(
          //           'description   Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
          //           style: TextStyle(
          //             fontSize: 16,
          //           ),
          //           textAlign: TextAlign.justify,
          //         ),
          //       ],
          //     ),
          //   ),
          // ]),
          ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddToCart(
              product_id: widget.ProductId.toString(),
            ),
            FavoriteButton(),
          ],
        ),
      ),
    );
  }
}
