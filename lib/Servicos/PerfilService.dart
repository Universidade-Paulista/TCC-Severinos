import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PerfilService {
  Dio dio = new Dio();

  getWhats(String id) async {
    final dio = Dio();
    Response response = await dio.get(
        "http://https://apiseverinos.azurewebsites.net/api/Colaborador/$id/whatsapp");

    if (response.statusCode == 200) {
      String edit = response.data;
      return edit;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }
}
