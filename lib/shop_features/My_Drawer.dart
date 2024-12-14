import 'package:flutter/material.dart';
import 'package:food_saver/features/authentications/screens/login/login.dart';
import 'package:food_saver/shop_features/presentation/Screens/home%20screen/home_page.dart';
import 'package:food_saver/shop_features/presentation/Screens/orders_screen/new_order_Date.dart';
import 'package:food_saver/shop_features/presentation/Screens/products%20screen/All_products.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class MYNavigationDrawer extends StatelessWidget {
  const MYNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Drawer(
      child: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 10, bottom: 10),
            child: ListTile(
                leading: Icon(
                  Icons.home_filled,
                  color: darkMode ? Color(0xFFCF5051) : Colors.black54,
                ),
                title: Text(
                  'Home',
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return CHomePage();
                      },
                    ),
                  );
                }),
          ),
          const Divider(
            color: Color(0xFF6C8090),
            thickness: 1,
            indent: 60,
            endIndent: 60,
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 10, bottom: 10),
            child: ListTile(
              leading: Icon(
                Icons.shopping_bag,
                color: darkMode ? Color(0xFFCF5051) : Colors.black54,
              ),
              title: Text(
                'My Products',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return allProductScreen();
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Color(0xFF6C8090),
            thickness: 1,
            indent: 60,
            endIndent: 60,
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 10, bottom: 10),
            child: ListTile(
              leading: Icon(
                Icons.receipt_long,
                color: darkMode ? Color(0xFFCF5051) : Colors.black54,
              ),
              title: Text(
                'ALL Orders',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SnewOrderDate();
                    },
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Color(0xFF6C8090),
            thickness: 1,
            indent: 60,
            endIndent: 60,
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => loginScreen(),
                    ),
                    // Always return false to remove all other screens
                    (Route route) => false,
                  );
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Color(0xFFCF5051), fontSize: 13),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
