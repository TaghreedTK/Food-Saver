import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_saver/data/network/home_request.dart';
import 'package:food_saver/features/presentation/screens/category_screen/views/categories_list_view.dart';
import 'package:food_saver/features/presentation/screens/home screen/widgets/foodSaving_card.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:food_saver/features/presentation/screens/home screen/viwes/offer_list_view.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen.dart';
import 'package:get/get.dart';
import 'package:food_saver/features/presentation/screens/home screen/home_page.dart';
import 'package:food_saver/features/presentation/screens/cart_screen/cart_screen_items.dart';
import 'package:food_saver/features/presentation/screens/home screen/navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class homeScreen extends StatefulWidget {
  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  var future;
  HomeRequest _homeData = HomeRequest();
  void initState() {
    super.initState();
    future = _homeData.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Food',
              style: TextStyle(color: darkMode ? Colors.white : Colors.black),
            ),
            const Text(
              'Saver',
              style: TextStyle(color: Color(0xFFCF5051)),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset(darkMode
                ? 'assets/icons/robot.png'
                : 'assets/icons/robot (1).png'), // Use the imported asset path
            onPressed: () async {
              final Uri url = Uri.parse('https://poe.com/FoodSaverHelperr');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'opps can\'t reach ';
              }
            },
          ),
        ],
      ),
      //   bottomNavigationBar: My_navigationBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              future = _homeData.getHomeData();
              ;
            });
          },
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: foodsaving_card(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 16, top: 16),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: CategoriesListView()),
              SliverToBoxAdapter(
                child: Divider(
                  height: 40,
                  thickness: 1,
                  color: Colors.grey,
                  endIndent: 60,
                  indent: 60,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, bottom: 16, top: 5),
                  child: Text(
                    'Running Out',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              OfferListView(
                future: future,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
