import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeService {
  Dio dio = new Dio();

  getListProfissoes() async {
    try {
      final dio = Dio();
      var response = await dio.get("http://192.168.15.9:5000/api/profissao/");

      if (response.statusCode == 200) {
        return response.data;
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

  // getNome(String email, String senha) async {
  //   final dio = Dio();
  //   var response = await dio.get(
  //       "http://https://apiseverinos.azurewebsites.net/api/Cadastro/" +
  //           email +
  //           "/" +
  //           senha);

  //   if (response.statusCode == 200) {
  //     var lista = response.data as List;
  //     return lista;
  //   } else {
  //     AlertDialog(
  //       title: Text(response.statusMessage),
  //     );
  //   }
  // }
}
