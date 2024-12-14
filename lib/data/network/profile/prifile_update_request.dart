


import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';

import 'package:food_saver/data/network/api.dart';

import 'package:dio/dio.dart';

class ProfileUpdateRequest {
  Future<void> updateProfileData({
    required String email,
   
    required String phone_number,
    required String birthday,
    required String gender,
    required String name
  }) async {
    var headers = {
      'Authorization': 'Token ${sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken)}'
    };
    var data = FormData.fromMap({
        'email': email,
        'name': name,
        'phone_number': phone_number,
        'gender': gender,
        'birthday': birthday,
      
    });

    var dio = Dio();
    await dio.request(
      '${Api.profile}',
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );
  }
}
