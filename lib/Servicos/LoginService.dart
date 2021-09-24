import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Dio dio = new Dio();

  /*requestLogin() async {
    Response response = await dio.get('https://localhost:44319/api/Login');
    return response.data.toString();
  }*/

  Future<String> getLogin() async {
    var request =
        http.Request('GET', Uri.parse('https://localhost:44319/api/Login'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

    return response.toString();
  }
}
