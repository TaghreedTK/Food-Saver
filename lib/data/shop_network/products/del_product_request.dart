

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class ShopProductDelRequest {
  delShopProduct({required String id}) async {
    var headers = {
      'Authorization':
          'Token ${sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken)}'
    };
    var request = http.MultipartRequest('DELETE', Uri.parse('${Api.shopProduct}'));

    request.headers.addAll(headers);
    request.fields.addAll({'id': '$id'});

    http.StreamedResponse response = await request.send();
  }
}