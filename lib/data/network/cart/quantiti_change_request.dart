
import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';

import 'package:food_saver/data/network/api.dart';

import 'package:dio/dio.dart';

class updateQuantityRequest {
  Future<void> updateQuantity(
      {required String operation, required String product_id}) async {
    var headers = {
      'Authorization':
          'Token ${sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken)}'
    };
    var data =
        FormData.fromMap({'operation': operation, 'product_id': product_id});

    var dio = Dio();
    await dio.request(
      '${Api.quantity}',
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );
  }
}
