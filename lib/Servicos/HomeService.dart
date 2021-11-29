import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeService {
  Dio dio = new Dio();

  getListProfissoes() async {
    final dio = Dio();
    Response response = await dio
        .get("http://https://apiseverinos.azurewebsites.net/api/profissao/");

    if (response.statusCode == 200) {
      return response.data;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
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
