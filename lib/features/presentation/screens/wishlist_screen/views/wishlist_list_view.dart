// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:food_saver/data/network/wishlist/del_wishlist_request.dart';
// import 'package:food_saver/data/network/wishlist/wishlist_request.dart';
// import 'package:food_saver/features/presentation/model/offer_model.dart';
// import 'package:food_saver/features/presentation/screens/home screen/widgets/offer_tile.dart';
// import 'package:food_saver/features/presentation/screens/wishlist_screen/widget/wishlist_tail.dart';
// import 'package:food_saver/utils/constants/sizes.dart';
// import 'package:iconsax/iconsax.dart';

// class WishlistListView extends StatefulWidget {
//   const WishlistListView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<WishlistListView> createState() => _OfferListViewState();
// }

// class _OfferListViewState extends State<WishlistListView> {
//   var future;

//   WishlistRequest _wishlistData = WishlistRequest();
//   WishlistDelRequest _WishlistDel = WishlistDelRequest();
//   @override
//   void initState() {
//     super.initState();
//     future = _wishlistData.getwishlistData();
  
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: future,
//         builder: (context, AsyncSnapshot<dynamic>? snapshot) {
//           if (snapshot!.hasError) {
       
//             print(snapshot.error);
//             return SliverToBoxAdapter(
//               child: Center(
//                 child: Text("Error while getting data"),
//               ),
//             );
//           } else {
//             if (snapshot.hasData) {
//               if (snapshot.data.length > 0) {
//                 print('taghreed ${snapshot.data.length}');
//                 return SliverGrid(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: TSizes.gridViewSpacing,
//                       mainAxisSpacing: TSizes.gridViewSpacing,
//                       mainAxisExtent: 288),
//                   delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                       return Padding(
//                         padding: const EdgeInsets.only(right: 14),
//                         child: WishlistTail(
//                           color: Colors.red,
//                           icon: Iconsax.heart5,
//                           data: snapshot.data[index],
//                         ),
//                       );
//                     },
//                     childCount: snapshot.data.length,
//                   ),
//                 );
//               } else {
//                 return SliverToBoxAdapter(
//                   child: Center(
//                     child: Text("No Data"),
//                   ),
//                 );
//               }
//             } else {
//               return SliverToBoxAdapter(
//                   child: Center(child: CircularProgressIndicator()));
//             }
//           }
//         });
//   }
// }
