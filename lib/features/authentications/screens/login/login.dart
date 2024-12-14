import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_saver/common/styles/spacing_styles.dart';
import 'package:food_saver/cubit/auth_cubit.dart';
import 'package:food_saver/features/authentications/screens/login/widgets/login_form.dart';
import 'package:food_saver/features/authentications/screens/login/widgets/login_header.dart';

class loginScreen extends StatefulWidget {
  loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            TLoginHeader(),
            TLoginForm(),

            // footer
          ]),
        )),
      ),
    );
  }
}
