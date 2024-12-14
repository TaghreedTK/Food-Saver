import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_saver/common/styles/spacing_styles.dart';
import 'package:food_saver/features/authentications/screens/login/login.dart';
import 'package:food_saver/utils/constants/image_strings.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/constants/text_strings.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: TSpacingStyle.paddingWithAppBarHeight * 2,
      child: Column(children: [
        Image(
          image: const AssetImage(TImages.staticSuccessIllustration),
          width: THelperFunctions.screenWidth() * 0.6,
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        // title
        Text(
          TTexts.yourAccountCreatedTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Text(
          TTexts.yourAccountCreatedSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        // Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => loginScreen()),
            child: const Text(TTexts.tContinue),
          ),
        ),
      ]),
    )));
  }
}
