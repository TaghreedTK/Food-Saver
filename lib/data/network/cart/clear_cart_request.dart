

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class ClearCartRequest {
  clearCart() async {
    var headers = {
      'Authorization':
          'Token ${sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken)}'
    };
    var request = http.MultipartRequest('DELETE', Uri.parse('${Api.cart}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
  }
}
