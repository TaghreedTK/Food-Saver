import 'package:flutter/material.dart';
import 'package:food_saver/data/network/wishlist/del_wishlist_request.dart';
import 'package:food_saver/data/network/wishlist/wishlist_request.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen/widget/wishlist_tail.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class wishlistScreen extends StatefulWidget {
  const wishlistScreen({super.key});

  @override
  State<wishlistScreen> createState() => _wishlistScreenState();
}

class _wishlistScreenState extends State<wishlistScreen> {
  var future;
  WishlistDelRequest _WishlistDel = WishlistDelRequest();
  WishlistRequest _wishlistData = WishlistRequest();

  void initState() {
    super.initState();
    future = _wishlistData.getwishlistData();
  }

  void _removeFromWishlist(productId) async {
    await _WishlistDel.delFromwishlist(id: productId);
    
    // Refresh the wishlist data after deletion
    setState(() {
      future = _wishlistData.getwishlistData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'My WishList',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<dynamic>? snapshot) {
          if (snapshot!.hasError) {
            return Center(
              child: Text("Error while getting data"),
            );
          } else {
            if (snapshot.hasData) {
              if (snapshot.data.length > 0) {
                print('taghreed ${snapshot.data.length}');
                return RefreshIndicator(
                   onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        future = _wishlistData.getwishlistData();
                        ;
                      });
                    },
                  
                  child: CustomScrollView(
                    slivers: [
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: TSizes.gridViewSpacing,
                          mainAxisSpacing: TSizes.gridViewSpacing,
                          mainAxisExtent: 288,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: WishlistTail(
                                onPressed: () => _removeFromWishlist(
                                    snapshot.data[index]["product_id"]),
                                color: Colors.red,
                                icon: Iconsax.heart5,
                                data: snapshot.data[index],
                              ),
                            );
                          },
                          childCount: snapshot.data.length,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text("you don't have any favourites"),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}
