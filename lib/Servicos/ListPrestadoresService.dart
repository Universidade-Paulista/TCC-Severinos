import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListPrestadoresService {
  getListaPrestadores(String profissao) async {
    final dio = Dio();
    Response response = await dio
        .get("http://192.168.15.9:5000/api/Colaborador/$profissao/lista");

    if (response.statusCode == 200) {
      return response.data;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }
}
