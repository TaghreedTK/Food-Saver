import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_saver/cubit/auth_cubit.dart';
import 'package:food_saver/cubit/auth_state.dart';
import 'package:food_saver/features/authentications/screens/signup/widgets/signup.dart';
import 'package:food_saver/features/authentications/widgets/auth_text_field.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/features/presentation/screens/home%20screen/navigation_bar.dart';
import 'package:food_saver/shop_features/authentications/login/login.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class TLoginForm extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TLoginForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AuthLoaded) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                bottomNavigationBar: My_navigationBar(),
              ),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Form(
            key: formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
              child: Column(
                children: [
                  TAuthTextField(
                    controller: userNameController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: 'Username'),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  TAuthTextField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.password_check),
                      labelText: TTexts.password,
                      suffixIcon: Icon(Iconsax.eye),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Forget Info',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        TextButton(
                            onPressed: () async {
                              final Uri url =
                                  Uri.parse('https://poe.com/FoodSaverHelperr');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'opps can\'t reach ';
                              }
                            },
                            child: const Text(
                              'Need Help ?',
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections / 2,
                  ),

                  // signin button
                  SizedBox(
                    width: double.infinity,
                    child: My_Button(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          context.read<AuthCubit>().login(
                                username: userNameController.text,
                                password: passwordController.text,
                              );
                        }
                      },
                      label: TTexts.signIn,
                      isLoading: state is AuthLoading,
                    ),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  // creat account
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (_) {
                              return BlocProvider.value(
                                value: context.read<AuthCubit>(),
                                child: SignupScreen(),
                              );
                            },
                          ));
                        },
                        child: Text(TTexts.createAccount)),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return CloginScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Login as Business Owner',
                        style: TextStyle(color: Colors.amber),
                      ))
                ],
              ),
            ));
      },
    );
  }
}
