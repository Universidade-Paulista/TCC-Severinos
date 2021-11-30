import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PerfilService {
  Dio dio = new Dio();

  getWhats(String id) async {
    try {
      final dio = Dio();
      var response = await dio.get(
          "https://apiseverinos.azurewebsites.net/api/Colaborador/$id/whatsapp");

      if (response.statusCode == 200) {
        String edit = response.data;
        return edit;
      } else {
        AlertDialog(
          title: Text(response.statusMessage),
        );
      }
    } on DioError catch (error) {
      AlertDialog(
        title: Text(error.message),
      );
    }
  }
}
