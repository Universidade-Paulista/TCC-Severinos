import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Dio dio = new Dio();

  getLogin(String email, String senha) async {
    // final dio = Dio();
    // Response response = await dio
    //     .get("http://192.168.15.9:5000/api/Login/" + email + "/" + senha);

    // http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200) {
    //   return response.data;
    // } else {
    //   AlertDialog(
    //     title: Text(response.statusMessage),
    //   );
    // }

    var request = http.Request('GET',
        Uri.parse('http://192.168.15.9:5000/api/Login/' + email + "/" + senha));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return response.stream.bytesToString();
    } else {
      print(response.reasonPhrase);
    }
  }
}
