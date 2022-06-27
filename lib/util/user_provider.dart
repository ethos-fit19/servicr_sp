import 'package:dio/dio.dart';
import "package:servicr_sp/constants.dart";
import "package:flutter/material.dart";
import '../views/login/login_page.dart';

import 'package:servicr_sp/views/login/login_page.dart';

class UserProvider {
  final dio = Dio();

  Future<Response> login(Map body) async {
    const url = "$apiUrl/auth/login";

    var response = await dio.post(url, data: body);
    return response;
  }

  void logout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginPage()),
        (route) => false);
  }

  Future<Response> register(Map body) async {
    const url = "$apiUrl/auth/register";

    var response = await dio.post(url, data: body);
    return response;
  }

  Future<Response> updateUser(Map body, String userId) async {
    var url = '$apiUrl/users/$userId';

    try {
      var response = await dio.patch(url, data: body);
      return response;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
