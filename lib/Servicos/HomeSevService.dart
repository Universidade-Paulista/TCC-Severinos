import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSevService {
  putImagem(String imgBase64) async {
    String sbody = "{\"imagem\": \"$imgBase64\"}";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('Email');

    var headers = {'Content-Type': 'application/json'};

    var request = http.Request('PUT',
        Uri.parse('https://apiseverinos.azurewebsites.net/api/imagem/$id'));

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
    try {
      final dio = Dio();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String id = prefs.getString('Idpessoa');

      Response response = await dio
          .get("https://apiseverinos.azurewebsites.net/api/imagem/$id");

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
