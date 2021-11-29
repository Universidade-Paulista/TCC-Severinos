import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Dio dio = new Dio();

  getLogin(String email, String senha) async {
    try {
      final dio = Dio();
      var response = await dio
          .get("http://192.168.15.7:5000/api/Login/" + email + "/" + senha);

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

  getCPF(String cpf) async {
    try {
      final dio = Dio();
      var response =
          await dio.get("http://192.168.15.7:5000/api/ValidacoesCPF/" + cpf);

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

  putSenha(final context, String cpf, String senha) async {
    final response = await http.put(
        Uri.parse('http://192.168.15.7:5000/api/Login/' + cpf + "/" + senha));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      AlertDialog(
        title: Text(response.reasonPhrase),
      );
    }
  }
}
