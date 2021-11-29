import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListPrestadoresService {
  getListaPrestadores() async {
    final dio = Dio();
    Response response = await dio.get("http://192.168.15.7:5000/api/Imagem");

    if (response.statusCode == 200) {
      String imgBase64 = response.data;
      return imgBase64;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }
}
