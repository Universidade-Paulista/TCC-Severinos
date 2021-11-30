import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:severino/telas/HomeSev.dart';

class HomeSevService {
  putImagem(String imgBase64) async {
    String sbody = "{\"imagem\": \"$imgBase64\"}";
    var headers = {'Content-Type': 'application/json'};

    var request = http.Request('PUT',
        Uri.parse('https://apiseverinos.azurewebsites.net/api/Cadastro/39'));

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
    Response response =
        await dio.get("https://apiseverinos.azurewebsites.net/api/Imagem");

    if (response.statusCode == 200) {
      String imgBase64 = response.data;
      return imgBase64;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }

  postStatus(final context, String status, String id) async {
    final response = await http.post(Uri.parse(
        'https://apiseverinos.azurewebsites.net/api/Status/$id/$status'));

    if (response.statusCode == 200) {
      response.body;
    } else {
      AlertDialog(
        title: Text(response.reasonPhrase),
      );
    }
  }
}
