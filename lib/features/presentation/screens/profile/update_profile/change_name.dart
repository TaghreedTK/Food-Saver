import 'package:flutter/material.dart';
import 'package:food_saver/data/network/profile/prifile_update_request.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class changeName extends StatefulWidget {
  changeName(
      {Key? key,
      required this.phoneNo,
      required this.birthday,
      required this.email,
      required this.gender})
      : super(key: key);
  String phoneNo;
  String gender;
  String email;
  String birthday;

  @override
  State<changeName> createState() => _changeNamelState();
}

class _changeNamelState extends State<changeName> {
  ProfileUpdateRequest _UpdateProfileData = ProfileUpdateRequest();
  GlobalKey<FormState> formNameKey = GlobalKey<FormState>();

  TextEditingController NameUpdatController = TextEditingController();
  late TextEditingController phoneNoController;
  late TextEditingController genderController;
  late TextEditingController birthdayController;
  late TextEditingController emailController;
  @override
  void initState() {
    phoneNoController = TextEditingController(text: widget.phoneNo);
    genderController = TextEditingController(text: widget.gender);
    birthdayController = TextEditingController(text: widget.birthday);
    emailController = TextEditingController(text: widget.email);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);

            // Navigate back to the previous screen
          },
        ),
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use rememberable Name for easy verification . ',
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
                      controller: NameUpdatController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your New Name';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: ' New Name',
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
                      name: NameUpdatController.text,
                      email: emailController.text,
                      phone_number: phoneNoController.text,
                      birthday: birthdayController.text,
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
