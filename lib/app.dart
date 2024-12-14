import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_saver/features/authentications/screens/login/login.dart';
import 'package:food_saver/features/authentications/screens/order_plased/order_plased.dart';
import 'package:food_saver/features/authentications/screens/signup/widgets/verify_email.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:food_saver/utils/theme/custom_themes/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lottie/lottie.dart';
import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final token =
      sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      /*routes: {
        'loginScreen': (context) => loginScreen(),
        'SignupScreen': (context) => SignupScreen(),
        'homeScreen': (context) => homeScreen(),
        'verifyEmailScreen': (context) => verifyEmailScreen(),
      },
      initialRoute: 'SignupScreen',*/

      home: SplashSceen(),
      /*routes: {
        'homeScreen': (context) => homeScreen(),
        'favListView': (context) => favListView(),
        'CartScreen': (context) => CartScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'homeScreen',*/
    );
  }
}

class SplashSceen extends StatelessWidget {
  SplashSceen({super.key});
  final token =
      sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken);
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(
              child: LottieBuilder.asset(dark
                  ? 'assets/splash_screen/VID 20240516 WA0044.json'
                  : 'assets/splash_screen/WhatsApp Video 2024 06 08 at 3.39.02 PM (1).json')),
        ],
      ),
      nextScreen: loginScreen(),
      // token == ""
      //     ? loginScreen()
      //     : Scaffold(
      //         bottomNavigationBar: My_navigationBar(),
      //       ),

      backgroundColor: dark ? Colors.black : Colors.white,
      splashIconSize: 1000,
      animationDuration: const Duration(seconds: 3),
    );
  }
}
