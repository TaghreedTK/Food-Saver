import 'package:flutter/material.dart';
import 'package:food_saver/data/network/profile/prifile_update_request.dart';
import 'package:food_saver/data/network/profile/profile_request.dart';
import 'package:food_saver/features/presentation/screens/profile/widgets/profile_card.dart';
import 'package:food_saver/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileRequest _ProfileData = ProfileRequest();
  ProfileUpdateRequest _UpdateProfileData = ProfileUpdateRequest();
  var future;
  @override
  void initState() {
    super.initState();
    future = _ProfileData.getProfileData();
  }

  void _refreshProfile(name,email, phone_number, birthday, gender) async {
    await _UpdateProfileData.updateProfileData(
      name: name,
       email: email,
        phone_number: phone_number,
        birthday: birthday,
        gender: gender);
    // Refresh the wishlist data after deletion
    setState(() {
      future = _ProfileData.getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'My Profile',
            style: TextStyle(color: darkMode ? Colors.white : Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<dynamic>? snapshot) {
            if (snapshot!.hasError) {
              print(snapshot.error);
              return Center(
                child: Text("Error while getting data"),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.data.length > 0) {
                  print('taghreed ${snapshot.data.length}');
                  return RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        future = _ProfileData.getProfileData();
                        ;
                      });
                    },
                    child: SingleChildScrollView(
                      child: profileCard(
                        data: snapshot.data!,
                      ),
                    ),
                  );
                  //
                } else {
                  return Center(
                    child: Text("No Data"),
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
          },
        ));
  }
}
