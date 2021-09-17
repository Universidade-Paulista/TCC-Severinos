import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class Login {
  final Dio dio = Dio();

  suaRequisicao() async {
    Response response = await dio.get('https://localhost:44319/api/Login');
    return response.data;
  }
}
