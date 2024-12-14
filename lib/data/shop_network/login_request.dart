
import 'package:dio/dio.dart';

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';




class SLoginRequest {
  var dio = Dio();
  Future<void> Shoplogin({
    required String username,
    required String password,
  }) async {
    try {
      var response = await dio.request(
        'https://mnnt.shop/api/shop_login/?username=${username}&password=${password}',
        options: Options(
          method: 'GET',
         
        ),

      );

      if (response.statusCode == 200) {
        final token = response.data['token'];

        sl<MySharedPrefInterface>().putString(
          key: MySharedKeys.apiToken,
          value: token,
        );
        print('${token}');
      } else {
        // Handle error
      }
    } on DioException catch (error) {
      print(error.message);
    }
  }
  // SloginRequest({required String username ,required String password}) async {

  //   var request = http.MultipartRequest('GET', Uri.parse('https://mnnt.shop/api/shop_login/?username=$username&password=$password'));

  //   http.StreamedResponse response = await request.send();

  //   return jsonDecode(await response.stream.bytesToString());
  // }
}
