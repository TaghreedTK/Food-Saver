import 'package:flutter/material.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class MyImageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(top: 50, bottom: 16, right: 16, left: 20),
      child: Container(
        height: 450.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          image: DecorationImage(
            image: darkMode
                ? AssetImage('assets/logos/Food Saver logo2.jpg')
                : AssetImage('assets/logos/Food Saver logo.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 10.0,
              left: 16.0,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  right: 16,
                ),
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
                      '  our food-saving app, where every meal rescued ',
                      style: TextStyle(
                          color: darkMode ? Colors.white : Colors.black,
                          fontFamily: 'Ubuntu Sans',
                          fontSize: 15,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
