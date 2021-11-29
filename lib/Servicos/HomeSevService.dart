import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeSevService {
  putImagem(String imgBase64) async {
    String sbody = "{\"imagem\": \"$imgBase64\"}";
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request(
        'PUT', Uri.parse('http://192.168.15.9:5000/api/Cadastro/39'));

    request.body = jsonEncode(sbody);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      AlertDialog(
        title: Text(response.reasonPhrase),
      );
    }
  }

  getImagem() async {
    final dio = Dio();
    Response response = await dio.get("http://192.168.15.9:5000/api/Imagem");

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
