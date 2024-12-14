import 'package:flutter/material.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class foodsaving_card extends StatelessWidget {
  const foodsaving_card({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 10),
      child: GestureDetector(
        onTap: () async {
          final Uri url = Uri.parse(
              'https://docs.google.com/forms/d/e/1FAIpQLScfYFeHZsi6QZiRF5tfbhuOg3DZXVXsmsvt1yfb2TJlHTyQ3w/viewform?pli=1');
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            throw 'opps can\'t reach ';
          }
        },
        child: Container(
          height: 160,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: DecorationImage(
                image: AssetImage('assets/images/foodsaving card.jpeg'),
                fit: BoxFit.fill),
          ),
          child: Stack(children: [
            Positioned(
              top: 12,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm, vertical: TSizes.xs),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: TColors.secondry.withOpacity(0.8),
                  ),
                  child: Text(
                    'Rate Us',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
