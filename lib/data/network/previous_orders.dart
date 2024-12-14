import 'dart:convert';

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class PreviousOrderRequest {
  getPastOrdersData() async {
    var headers = {
      'Authorization': 'Token ${sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken)}'
    };
    var request =
        http.MultipartRequest('GET', Uri.parse('${Api.previousOrders}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return jsonDecode(await response.stream.bytesToString());
  }
}
