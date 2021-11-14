import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginService {
  Dio dio = new Dio();

  getLogin(String email, String senha) async {
    final dio = Dio();
    Response response = await dio.get(
        "https://apiseverinos.azurewebsites.net/api/Login/" +
            email +
            "/" +
            senha);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }
}
