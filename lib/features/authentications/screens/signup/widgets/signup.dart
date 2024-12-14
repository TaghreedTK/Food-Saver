import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_saver/cubit/auth_cubit.dart';
import 'package:food_saver/cubit/auth_state.dart';
import 'package:food_saver/features/authentications/screens/signup/widgets/verify_email.dart';
import 'package:food_saver/features/authentications/widgets/auth_text_field.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/features/authentications/widgets/pick_image.dart';
import 'package:food_saver/utils/constants/colors.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:food_saver/utils/constants/text_strings.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birhadyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthLoaded) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const verifyEmailScreen(),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(children: [
              // Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Form
              Form(
                key: formKey2,
                child: Column(
                  children: [
                    const PickImageWidget(),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),

                    TAuthTextField(
                      controller: userNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.username,
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    TAuthTextField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Name';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        prefixIcon: Icon(Iconsax.pen_add),
                      ),
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TAuthTextField(
                            controller: genderController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your  Gender';
                              }
                              return null;
                            },
                            enabled: false,
                            decoration: const InputDecoration(
                              labelText: 'Gender',
                            
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwInputFields,
                        ),
                        Expanded(
                            child: TAuthTextField(
                          controller: birhadyController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Birthday';
                            }
                            return null;
                          },
                          expands: false,
                          decoration: const InputDecoration(
                            labelText: "Birthday",
                            hintText: '2002-03-12',
                            hintStyle: TextStyle(fontSize: 11),
                            prefixIcon: Icon(Iconsax.calendar),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    // username

                    // email
                    TAuthTextField(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    // phone number

                    TAuthTextField(
                      controller: phoneNoController,
                      textInputType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.phoneNo,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),
                    //password
                    TAuthTextField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'Please enter your password';
                        } else if (text.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: Icon(Iconsax.eye),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),

                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    // Terms&conditions checkbox
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: true,
                            onChanged: (Value) {},
                          ),
                        ),
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: '${TTexts.iAgreeTo}',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: '${TTexts.privacyPolicy}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      color: dark
                                          ? TColors.white
                                          : TColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? TColors.white
                                          : TColors.primary,
                                    )),
                            TextSpan(
                                text: '${TTexts.and}',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: '${TTexts.termsOfUse}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      color: dark
                                          ? TColors.white
                                          : TColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? TColors.white
                                          : TColors.primary,
                                    ))
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    SizedBox(
                        width: double.infinity,
                        child: My_Button(
                          onPressed: () {
                            if (formKey2.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                              context
                                  .read<AuthCubit>()
                                  .createUserWithEmailAndPassword(
                                    phone_number: phoneNoController.text,
                                    username: userNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    gender: genderController.text,
                                    birthday: birhadyController.text,
                                    name: nameController.text,
                                  );
                            }
                          },
                          label: TTexts.createAccount,
                          isLoading: state is AuthLoading,
                        ))
                  ],
                ),
              ),
            ]),
          )),
        );
      },
    );
  }
}
