import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:festa_assignment/app/data/models/user_model.dart';

class UserRepository {
  Dio dio = Dio();
  Future<List<UserApiResults>> fetchUserData() async {
    try {
      final Response<dynamic> response =
          await dio.get('https://randomuser.me/api');
      log(response.toString());
      if (response.statusCode == 200) {
        final UserModel userModel =
            UserModel.fromJson(response.data as Map<String, dynamic>);
        return userModel.results!;
      } else {
        return <UserApiResults>[];
      }
    } catch (e) {
      log(e.toString());
      return <UserApiResults>[];
    }
  }
}
