import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Dio dio = new Dio();

  getLogin(String email, String senha) async {
    final dio = Dio();

    Response response = await dio.get(
        "https://apiseverinos.azurewebsites.net/api/Login/" +
            email +
            "/" +
            senha);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }

  getCPF(String cpf) async {
    final dio = Dio();
    Response response = await dio
        .get("https://apiseverinos.azurewebsites.net/api/ValidacoesCPF/" + cpf);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }

  putSenha(final context, String cpf, String senha) async {
    final response = await http.put(Uri.parse(
        'https://apiseverinos.azurewebsites.net/api/Login/' +
            cpf +
            "/" +
            senha));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      AlertDialog(
        title: Text(response.reasonPhrase),
      );
    }
  }
}
