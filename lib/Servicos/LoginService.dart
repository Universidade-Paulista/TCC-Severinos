import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginService {
  Dio dio = new Dio();

  getLogin(String usuario, String senha) async {
    final dio = Dio();
    Response response = await dio.get(
        "http://10.0.0.77:5000/api/Login/'" + usuario + "'/'" + senha + "'");

    if (response.statusCode == 200) {
      return response.data;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }
}
