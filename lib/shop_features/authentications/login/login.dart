import 'package:flutter/material.dart';
import 'package:food_saver/common/styles/spacing_styles.dart';
import 'package:food_saver/shop_features/authentications/widgets/Clogin_form.dart';
import 'package:food_saver/shop_features/authentications/widgets/Clogin_header.dart';

class CloginScreen extends StatefulWidget {
  CloginScreen({super.key});

  @override
  State<CloginScreen> createState() => _CloginScreenState();
}

class _CloginScreenState extends State<CloginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(children: [
          SizedBox(
            height: 60,
          ),
          CLoginHeader(),
          CLoginForm(),

          // footer
        ]),
      )),
    );
  }
}
