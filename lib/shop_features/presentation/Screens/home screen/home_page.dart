import 'package:flutter/material.dart';
import 'package:food_saver/shop_features/My_Drawer.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:food_saver/shop_features/presentation/Screens/add_offer/add_offer.dart';
import 'package:food_saver/shop_features/presentation/widgets/container.dart';

class CHomePage extends StatelessWidget {
  const CHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        
        toolbarHeight: 70,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Food',
                style: TextStyle(color: darkMode ? Colors.white : Colors.black),
              ),
              Text(
                'Saver',
                style: TextStyle(color: Color(0xFFCF5051)),
              ),
            ],
          ),
        ),
      ),
      drawer: const MYNavigationDrawer(
        
      ) ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyImageContainer(),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16, right: 14, left: 25),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () => Get.to(() => AddOffer()),
                      child: Text('Add Your Offer Now  ',
                          style: TextStyle(
                              color: darkMode
                                  ? Color(0xFFF6BE00)
                                  : Color(0xFFCF5051),
                              fontSize: 16))),
                  IconButton(
                      onPressed: () => Get.to(() => AddOffer()),
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: darkMode ? Color(0xFFCF5051) : Color(0xFFF6BE00),
                      ))
                ],
              ),
            )
          ],
        ),
      ),

      /*Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 16, right: 16, left: 10),
            child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage('assets/logos/Food Saver logo.jpg'),
                      fit: BoxFit.fill),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 25),
            child: Column(
              children: [
                Text(
                  'Transform surplus into success with ',
                  style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontFamily: 'Ubuntu Sans',
                      fontSize: 17,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  ' our food-saving app, where every meal rescued ',
                  style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontFamily: 'Ubuntu Sans',
                      fontSize: 17,
                      fontStyle: FontStyle.italic),
                ),
                Text(
                  '  is a win for your business and the planet!',
                  style: TextStyle(
                      color: darkMode ? Colors.white : Colors.black,
                      fontFamily: 'Ubuntu Sans',
                      fontSize: 17,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),*/
    );
  }
}
