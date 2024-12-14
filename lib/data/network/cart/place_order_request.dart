import 'dart:convert';

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';


import 'package:dio/dio.dart';
class PlaceOrderRequest {
  PlaceOrder() async {
   var headers = {
  'Authorization': 'Token ${sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken)}'
};
var dio = Dio();
var response = await dio.request(
  'https://mnnt.shop/api/make_order/',
  options: Options(
    method: 'POST',
    headers: headers,
  ),
);

if (response.statusCode == 200) {
  print(json.encode(response.data));
}
else {
  print(response.statusMessage);
}
  }
}