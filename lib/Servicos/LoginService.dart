import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Dio dio = new Dio();

  requestLogin() async {
    // Response response = await dio.get('https://localhost:44319/api/Login');
    // return response.data.toString();

    final dio = Dio();
    Response response = await dio.get("http://localhost:64045/api/Login");
    if (response.statusCode == 200) {
      return response.data().toString();
    }
    //já convertendo em objeto para salvar no banco futuramente

    // Se o usuário fez o login com sucesso, gravo o usuário e a senha no interceptor pra usar
    // nas próximas requisições
  }

  // Future<String> getLogin() async {
  //   var request =
  //       http.Request('GET', Uri.parse('https://localhost:44319/api/Login'));

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }

  //   return response.toString();
  // }
}
