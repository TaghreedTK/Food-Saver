import 'package:flutter/material.dart';
import 'package:food_saver/data/network/profile/prifile_update_request.dart';
import 'package:food_saver/features/authentications/widgets/my_button.dart';
import 'package:food_saver/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class changeEmail extends StatefulWidget {
  changeEmail(
      {Key? key,
      required this.name,
      required this.phoneNo,
      required this.birthday,
      required this.gender})
      : super(key: key);
  String phoneNo;
  String gender;
    String name;
  String birthday;

  @override
  State<changeEmail> createState() => _changeEmailState();
}

class _changeEmailState extends State<changeEmail> {
  ProfileUpdateRequest _UpdateProfileData = ProfileUpdateRequest();
  GlobalKey<FormState> formEmailKey = GlobalKey<FormState>();

  TextEditingController EmailUpdatController = TextEditingController();
  late TextEditingController phoneNoController;
  late TextEditingController genderController;
  late TextEditingController birthdayController;
   late TextEditingController NameController;

  @override
  void initState() {
    phoneNoController = TextEditingController(text: widget.phoneNo);
    genderController = TextEditingController(text: widget.gender);
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
          
            // Navigate back to the previous screen
          },
        ),
        title: Text(
          'Change Email',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use rememberable Email for easy verification . ',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Form(
                key: formEmailKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: EmailUpdatController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your New Email';
                        }
                        return null;
                      },
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: ' New Email',
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
                      email: EmailUpdatController.text,
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
