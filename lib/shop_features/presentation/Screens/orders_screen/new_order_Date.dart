import 'package:flutter/material.dart';
import 'package:food_saver/data/shop_network/orders/shop_orderd_request.dart';
import 'package:food_saver/shop_features/My_Drawer.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/order_date/views/order_date_builder.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';







class SnewOrderDate extends StatefulWidget {
  const SnewOrderDate({super.key});

  @override
  State<SnewOrderDate> createState() => _SnewOrderDateState();
}

class _SnewOrderDateState extends State<SnewOrderDate> {
  var future;
  ShopOrdersRequest _shopOrderData = ShopOrdersRequest();

  void initState() {
    super.initState();
    future = _shopOrderData.getShopOrdersData();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      drawer: MYNavigationDrawer(),
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'All Orders',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            future = _shopOrderData.getShopOrdersData();
            ;
          });
        },
        child: CustomScrollView(slivers: [
          SorderDateBilder(

            future: future,
           
          )
        ]),
      ),
      
    );
  }
}