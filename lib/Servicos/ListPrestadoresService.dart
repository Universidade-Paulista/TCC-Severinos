import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListPrestadoresService {
  getListaPrestadores(String profissao) async {
    final dio = Dio();
    Response response = await dio.get(
        "https://apiseverinos.azurewebsites.net/api/Colaborador/Eletricista/lista");

    if (response.statusCode == 200) {
      final jSon = response.data;
      return jSon.toString();
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }
}
