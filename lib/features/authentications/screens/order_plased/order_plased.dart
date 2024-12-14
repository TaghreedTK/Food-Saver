import 'package:flutter/material.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class orderPlaced extends StatelessWidget {
  const orderPlaced({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: darkMode ? TColors.light : TColors.primary,
          onPressed: () {
            Navigator.pop(context);

            // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 100,
              backgroundImage: AssetImage('assets/images/right sign.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'Thank you for using our app and for helping to protect the environment. Please head to our center to pick up your order.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
