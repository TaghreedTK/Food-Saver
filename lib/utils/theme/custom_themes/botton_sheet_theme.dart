import 'package:flutter/material.dart';
import 'package:food_saver/utils/constants/colors.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();
  static BottomSheetThemeData LightBottomSheetTheme = BottomSheetThemeData(
      backgroundColor: TColors.primary,
      modalBackgroundColor: TColors.primary,
      showDragHandle: true,
      constraints: const BoxConstraints(maxWidth: double.infinity),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ));

  static BottomSheetThemeData DarkBottomSheetTheme = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.black,
      modalBackgroundColor: Colors.black,
      constraints: const BoxConstraints(maxWidth: double.infinity),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ));
}
