import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginService {
  Dio dio = new Dio();

  getLogin() async {
    final dio = Dio();
    Response response = await dio.get("http://10.0.0.77:5000/api/Login");

    if (response.statusCode == 200) {
      return response.data[0].toString();
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }
}
