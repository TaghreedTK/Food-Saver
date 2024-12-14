import 'package:flutter/material.dart';
import 'package:food_saver/data/network/cart/cart_request.dart';
import 'package:food_saver/data/network/cart/clear_cart_request.dart';
import 'package:food_saver/data/network/cart/del_product_from_cart.dart';
import 'package:food_saver/data/network/cart/place_order_request.dart';
import 'package:food_saver/data/network/cart/quantiti_change_request.dart';
import 'package:food_saver/features/authentications/screens/order_plased/order_plased.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/cart_items.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_price.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/c_widget/product_quntity_button.dart';
import 'package:food_saver/utils/constants/colors.dart';

import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var future;
  CartListRequest _carttData = CartListRequest();
  CartDelRequest _cartDelRequest = CartDelRequest();
  ClearCartRequest _clearCartRequest = ClearCartRequest();
  updateQuantityRequest _changeQuantity = updateQuantityRequest();
  PlaceOrderRequest _placeOrder = PlaceOrderRequest();

  @override
  void initState() {
    super.initState();
    future = _carttData.getCartData();
  }

  void _clearCart() async {
    await _clearCartRequest.clearCart();
    setState(() {
      future = _carttData.getCartData();
    });
  }

  void _orderPlaced() async {
    await _placeOrder.PlaceOrder();
    setState(() {
      future = _carttData.getCartData();
    });
  }

  void _removeFromCart(productId) async {
    await _cartDelRequest.delFromwCart(id: productId);
    // Refresh the wishlist data after deletion
    setState(() {
      future = _carttData.getCartData();
    });
  }

  void _incrementQuantity(productId) async {
    await _changeQuantity.updateQuantity(operation: '+', product_id: productId);
    // Refresh the wishlist data after deletion
    setState(() {
      future = _carttData.getCartData();
    });
  }

  void _decrementQuantity(productId) async {
    await _changeQuantity.updateQuantity(operation: '-', product_id: productId);
    // Refresh the wishlist data after deletion
    setState(() {
      future = _carttData.getCartData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      //AppBar(
      //title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      //),
      body: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<dynamic>? snapshot) {
            if (snapshot!.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("Error while getting data"),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  print('taghreed ${snapshot.data.length}');
                  return Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          future = _carttData.getCartData();
                        });
                      },
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        separatorBuilder: (_, __) => const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        itemBuilder: (_, index) => SingleChildScrollView(
                          child: Column(
                            children: [
                              CartItem(data: snapshot.data[index]),
                              SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: TSizes.iconlg * 1.2,
                                        height: TSizes.iconlg * 1.2,
                                        child: Center(
                                          child: IconButton(
                                            icon: Icon(Iconsax.trash,
                                                color: darkMode
                                                    ? TColors.primary
                                                    : Colors.black),
                                            onPressed: () => _removeFromCart(
                                                snapshot.data[index]
                                                    ["product_id"]),
                                            // _cartDelRequest.delFromwCart(
                                            //     id: snapshot.data[index]
                                            //         ["product_id"]);
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      ProductQuantityaddRemoveButton(
                                        onPreespluss: () => _incrementQuantity(
                                            snapshot.data[index]["product_id"]
                                                .toString()),
                                        onPreessmin: () => _decrementQuantity(
                                            snapshot.data[index]["product_id"]
                                                .toString()),
                                        quantity: snapshot.data[index],
                                      ),
                                    ],
                                  ),
                                  ProductPriceText(
                                    data: snapshot.data[index]!,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );

                  //
                } else {
                  return Center(
                    child: Text("let,s fill our cart "),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                _orderPlaced;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return orderPlaced();
                    },
                  ),
                );
              },
              child: Text('Place Order '),
              style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(200, 70))),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              height: 100,
              width: 70,
              decoration: BoxDecoration(
                  color: Color(0xFFCF5051), shape: BoxShape.circle),
              child: SizedBox(
                width: TSizes.iconlg * 1.2,
                height: TSizes.iconlg * 1.2,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Iconsax.trash,
                      color: Colors.white,
                    ),
                    onPressed: () => _clearCart(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
