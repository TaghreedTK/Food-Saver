import 'package:flutter/material.dart';
import 'package:food_saver/data/network/profile/prifile_update_request.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class changeBirth extends StatefulWidget {
  changeBirth(
      {Key? key,
      required this.email,
      required this.name,
      required this.PhoneNO,
      required this.gender})
      : super(key: key);
  String email;
  String gender;
  String name;

  String PhoneNO;

  @override
  State<changeBirth> createState() => _changeBirthState();
}

class _changeBirthState extends State<changeBirth> {
  ProfileUpdateRequest _UpdateProfileData = ProfileUpdateRequest();
  GlobalKey<FormState> formBirthKey = GlobalKey<FormState>();

  TextEditingController BirthUpdatController = TextEditingController();
  late TextEditingController emailController;
  late TextEditingController genderController;
  late TextEditingController PhoneNOController;
  late TextEditingController NameController;

  @override
  void initState() {
    emailController = TextEditingController(text: widget.email);
    genderController = TextEditingController(text: widget.gender);
    PhoneNOController = TextEditingController(text: widget.PhoneNO);
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
          'Change Birth Date',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real Birth date for easy verification . ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
                key: formBirthKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: BirthUpdatController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Birth Date';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: ' My Birth Date',
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
                      phone_number: PhoneNOController.text,
                      birthday: BirthUpdatController.text,
                      gender: genderController.text,
                    );
                    setState(() {});
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
