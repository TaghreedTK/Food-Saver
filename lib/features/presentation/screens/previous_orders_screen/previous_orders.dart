import 'package:flutter/material.dart';
import 'package:food_saver/data/network/previous_orders.dart';
import 'package:food_saver/features/presentation/screens/previous_orders_screen/views/previous_order_builder.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';







class previousOrders extends StatefulWidget {
  const previousOrders({super.key});

  @override
  State<previousOrders> createState() => _previousOrdersState();
}

class _previousOrdersState extends State<previousOrders> {
  var future;
  PreviousOrderRequest _previousOrderData = PreviousOrderRequest();

  void initState() {
    super.initState();
    future = _previousOrderData.getPastOrdersData();
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
          'Previous Orders',
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
            future =_previousOrderData.getPastOrdersData();
            ;
          });
        },
        child: CustomScrollView(slivers: [
          PreviousListBilder(

            future: future,
           
          )
        ]),
      ),
      
    );
  }
}


  // SliverList(
  //                         delegate: SliverChildBuilderDelegate(
  //                       childCount: snapshot.data.length,
  //                       (context, index) {
  //                         return Padding(
  //                           padding: const EdgeInsets.only(bottom: 2),
  //                           child: previousOrderTile(data: snapshot.data[index],),
  //                         );
  //                       },
  //                     ))