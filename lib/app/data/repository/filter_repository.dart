import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/user_model.dart';

class FilterRepository {
  Dio dio = Dio();
  Future<List<UserApiResults>> filterByGender(String gender) async {
    try {
      final Response<dynamic> response =
          await dio.get('https://randomuser.me/api/?gender=$gender');
      log(response.toString());
      if (response.statusCode == 200) {
        final UserModel userModel =
            UserModel.fromJson(response.data as Map<String, dynamic>);
        return userModel.results!;
      } else {
        return <UserApiResults>[];
      }
    } catch (e) {
      log('Data $e');
      return <UserApiResults>[];
    }
  }
}
