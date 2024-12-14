import 'package:http_parser/http_parser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_saver/core/Di.dart';
import 'package:food_saver/core/Sh.dart';
import 'package:food_saver/cubit/auth_state.dart';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  XFile? profilePic;
  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  var dio = Dio();
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String username,
    required String password,
    required String name,
    required String phone_number,
    required String gender,
    required String birthday,
  }) async {
    try {
      emit(AuthLoading());
      var data = FormData.fromMap({
        'image': [
          await MultipartFile.fromFile(profilePic!.path,
              filename: profilePic!.name,
              contentType: new MediaType("image", "jpeg"))
        ],
        'email': email,
        'username': username,
        'name': name,
        'phone_number': phone_number,
        'gender': gender,
        'birthday': birthday,
        'password': password
      });

      var response = await dio.request(
        'https://mnnt.shop/api/register/',
        options: Options(
          method: 'POST',
        ),
        data: data,
      );

      if (response.statusCode == 201) {
        // Handle successful registration
        final token = response.data['token'];

        sl<MySharedPrefInterface>().putString(
          key: MySharedKeys.apiToken,
          value: token,
        );
        emit(AuthLoaded());
      } else {
        // Handle error
        emit(AuthError(
            error: 'Register failed with status code: ${response.statusCode}'));
      }
    } on DioException catch (error) {
      emit(AuthError(error: 'Error: ${error.response!.data.toString()}'));
    }
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      var response = await dio.request(
        'https://mnnt.shop/api/login',
        options: Options(
          method: 'GET',
          headers: {
            'accept': 'application/json',
          },
        ),
        queryParameters: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];

        sl<MySharedPrefInterface>().putString(
          key: MySharedKeys.apiToken,
          value: token,
        );
        emit(AuthLoaded());
      } else {
        // Handle error
        emit(AuthError(
            error: 'Login failed with status code: ${response.statusCode}'));
      }
    } on DioException catch (error) {
      emit(AuthError(error: 'Error: ${error.response!.data.toString()}'));
    }
  }
}
