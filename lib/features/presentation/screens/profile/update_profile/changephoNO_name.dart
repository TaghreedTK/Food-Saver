// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:food_saver/data/network/profile/prifile_update_request.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class changePhoneN0 extends StatefulWidget {
  changePhoneN0(
      {Key? key,
      required this.name,
      required this.email,
      required this.birthday,
      required this.gender})
      : super(key: key);
  String email;
  String gender;
  String name;
  String birthday;

  @override
  State<changePhoneN0> createState() => _changeNameState();
}

class _changeNameState extends State<changePhoneN0> {
  ProfileUpdateRequest _UpdateProfileData = ProfileUpdateRequest();
  GlobalKey<FormState> formNameKey = GlobalKey<FormState>();

  TextEditingController PhoneNoUpdatController = TextEditingController();
  late TextEditingController emailController;
  late TextEditingController genderController;
  late TextEditingController birthdayController;
  late TextEditingController NameController;
  @override
  void initState() {
    emailController = TextEditingController(text: widget.email);
    genderController = TextEditingController(text: widget.gender);
    birthdayController = TextEditingController(text: widget.birthday);
    NameController = TextEditingController(text: widget.name);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            setState(() {});
            // Navigate back to the previous screen
          },
        ),
        title: Text(
          'Change Phone Number',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real Phone Number for easy verification . ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
                key: formNameKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: PhoneNoUpdatController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your New Number';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: ' New phone Number',
                          prefixIcon: Icon(Iconsax.user)),
                    )
                  ],
                )),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
                width: double.infinity,
                child: My_Button(
                  onPressed: () {
                    _UpdateProfileData.updateProfileData(
                      name: NameController.text,
                      email: emailController.text,
                      phone_number: PhoneNoUpdatController.text,
                      birthday: birthdayController.text,
                      gender: genderController.text,
                    );
                  },
                  label: "Save",
                )),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Center(
              child: Text(
                'Please refresh your Profile Screen . ',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
