import 'package:flutter/material.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:food_saver/utils/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu(
      {super.key,
      this.icon = Iconsax.edit,
      required this.onPressed,
      required this.title,
      required this.value});
  final IconData icon;
  final VoidCallback onPressed;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                child: Icon(
              icon,
              color: darkMode ? TColors.primary : Colors.white,
              size: 18,
            ))
          ],
        ),
      ),
    );
  }
}
