import 'package:flutter/material.dart';
import 'package:food_saver/data/network/wishlist/del_wishlist_request.dart';
import 'package:food_saver/data/network/wishlist/wishlist_request.dart';
import 'package:food_saver/data/shop_network/products/Sproduct_request.dart';
import 'package:food_saver/data/shop_network/products/del_product_request.dart';

import 'package:food_saver/features/presentation/screens/wishlist_screen/views/wishlist_list_view.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen/widget/wishlist_tail.dart';
import 'package:food_saver/shop_features/My_Drawer.dart';
import 'package:food_saver/shop_features/presentation/Screens/products%20screen/widgets/pruducts_tile.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/category__list_Builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class allProductScreen extends StatefulWidget {
  const allProductScreen({super.key});

  @override
  State<allProductScreen> createState() => _allProductScreenScreenState();
}

class _allProductScreenScreenState extends State<allProductScreen> {
  var future;
  ShopProductDelRequest _shopProductDel = ShopProductDelRequest();
  ShopProductRequest _shopProductsData = ShopProductRequest();

  void initState() {
    super.initState();
    future = _shopProductsData.getShopProductData();
  }

  void _removeFromProductslist(String productId) async {
    await _shopProductDel.delShopProduct(id: productId);

    // Refresh the wishlist data after deletion
    setState(() {
      future = _shopProductsData.getShopProductData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      drawer: const MYNavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'All My Products',
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
                      future = _shopProductsData.getShopProductData();
                      ;
                    });
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 14),
                              child: SProductTile(
                                data: snapshot.data[index],
                                onPressed: () => _removeFromProductslist(
                                    snapshot.data[index]["id"].toString()),
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
