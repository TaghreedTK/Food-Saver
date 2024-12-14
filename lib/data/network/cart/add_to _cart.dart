import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:http/http.dart' as http;
import 'package:food_saver/data/network/api.dart';

class CartAddRequest {
  addToCart({required id}) async {
    var headers = {
      'Authorization':
          'Token ${sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken)}'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${Api.cart}'));

    request.headers.addAll(headers);
    request.fields.addAll({'product_id': id});

    http.StreamedResponse response = await request.send();
  }
}
