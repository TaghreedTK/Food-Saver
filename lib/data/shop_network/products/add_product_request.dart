

import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';

import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AddProductRequest {
  XFile? offerPic;
  uploadofferPic(XFile image) {
    offerPic = image;
  }

  Future<void> addProduct({required name , required  price ,required  description ,required  expire_time ,required  category }
   
  ) async {
  var headers = {
  'Authorization': 'Token ${sl<MySharedPrefInterface>().getString(key: MySharedKeys.apiToken)}'
};
    if (offerPic != null) {
 // Use null safety operator (!)
      var data = FormData.fromMap({
          'image': [
    await MultipartFile.fromFile(offerPic!.path, filename: offerPic!.name, contentType: new MediaType("image", "jpeg"))
  ],
        'name': name,
        'price': price,
        'description': description,
        'expire_time': expire_time,
        'category': category
      });

      var dio = Dio();
      await dio.request(
        'https://mnnt.shop/api/shop_products/',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
    }else{  print("haaaaaaaaaay No image selected");}
  }
}
