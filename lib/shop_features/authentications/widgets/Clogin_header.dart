import 'package:flutter/material.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/constants/text_strings.dart';

class CLoginHeader extends StatelessWidget {
  const CLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          'How about we turn those lose into some cold hard cash',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}