import 'package:flutter/material.dart';
import 'package:food_saver/data/network/profile/prifile_update_request.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class changeGender extends StatefulWidget {
  changeGender(
      {Key? key,
      required this.name,
      required this.email,
      required this.birthday,
      required this.phoneNo})
      : super(key: key);
  String email;
  String phoneNo;
 String name;
  String birthday;

  @override
  State<changeGender> createState() => _changeGenderState();
}

class _changeGenderState extends State<changeGender> {
  ProfileUpdateRequest _UpdateProfileData = ProfileUpdateRequest();
  GlobalKey<FormState> formGenderKey = GlobalKey<FormState>();

  TextEditingController GenderUpdatController = TextEditingController();
  late TextEditingController emailController;
  late TextEditingController PhoneNOController;
  late TextEditingController birthdayController;
     late TextEditingController NameController;

  @override
  void initState() {
    emailController = TextEditingController(text: widget.email);
    PhoneNOController = TextEditingController(text: widget.phoneNo);
    birthdayController = TextEditingController(text: widget.birthday);
     NameController =TextEditingController(text: widget.name);
    
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
          'My Gender',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real Gender for easy verification . ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
                key: formGenderKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: GenderUpdatController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Gender';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: ' My Gender',
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
                      birthday: birthdayController.text,
                      gender: GenderUpdatController.text,
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