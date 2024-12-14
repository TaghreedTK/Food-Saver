import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_saver/features/presentation/screens/previous_orders_screen/views/previous_order_view.dart';

class PreviousListBilder extends StatefulWidget {
  PreviousListBilder({super.key, required this.future});

  var future;
  @override
  State<PreviousListBilder> createState() => _PreviousListState();
}

class _PreviousListState extends State<PreviousListBilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
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
              log('All carts ${snapshot.data.length}');
     
              // log('all data is ${snapshot.data!}');
              // log('first item is ${snapshot.data![0]['items'][0]}');
              return previousListView(
                data: snapshot.data!,
              );
              //
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text("No Data"),
                ),
              );
            }
          } else {
            /*  */
            return SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
        }
      },
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:food_saver/features/presentation/screens/category_screen/widgets/category_tail.dart';
// import 'package:food_saver/features/presentation/screens/previous_orders_screen/widgets/previous_tile.dart';

// import 'package:food_saver/utils/constants/sizes.dart';

// import 'package:iconsax/iconsax.dart';
// class previousListView extends StatelessWidget {
//    previousListView({super.key, required this.data});
//       final List<dynamic> data;
//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         childCount: data.length,
//         (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 22),
//             child: previousOrderTile(
//               data:data[index]
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:food_saver/features/presentation/screens/category_screen/widgets/category_tail.dart';
// import 'package:food_saver/features/presentation/screens/previous_orders_screen/views/previous_order_view.dart';

// import 'package:food_saver/utils/constants/sizes.dart';

// import 'package:iconsax/iconsax.dart';

// import 'package:food_saver/features/presentation/model/offer_model.dart';
// import 'package:food_saver/utils/constants/sizes.dart';
// import 'package:food_saver/features/presentation/screens/category_screen/views/categoryProduct_view.dart';
// import 'package:food_saver/data/network/category_request.dart';

// class PreviousListBilder extends StatefulWidget {
//   PreviousListBilder(
//       {super.key, required this.future});

//   var future;
//   @override
//   State<PreviousListBilder> createState() => _PreviousListState();
// }

// class _PreviousListState extends State<PreviousListBilder> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: widget.future,
//       builder: (context, AsyncSnapshot<dynamic>? snapshot) {
//         if (snapshot!.hasError) {
//           print(snapshot.error);
//           return SliverToBoxAdapter(
//             child: Center(
//               child: Text("Error while getting data"),
//             ),
//           );
//         } else {
//           if (snapshot.hasData) {
//             if (snapshot.data.length > 0) {
//               print('taghreed ${snapshot.data.length}');
//               return previousListView(
//                 data: snapshot.data!,
//               );
//               //
//             } else {
//               return SliverToBoxAdapter(
//                 child: Center(
//                   child: Text("No Data"),
//                 ),
//               );
//             }
//           } else {
//             return SliverToBoxAdapter(
//                 child: Center(child: CircularProgressIndicator()));
//           }
//         }
//       },
//     );
//   }
// }