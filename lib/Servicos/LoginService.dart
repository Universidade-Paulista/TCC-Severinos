import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Dio dio = new Dio();

  getLogin1() async {
    final dio = Dio();
    Response response = await dio.get("http://10.0.0.77:5000/api/Login");

    if (response.statusCode == 200) {
      var tes = response.data().toString();
    } else {
      print(response.statusCode);
    }
  }

  // Future<String> getLogin() async {
  //   var request =
  //       http.Request('GET', Uri.parse('http://10.0.0.77:5000/api/Login'));

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     var teste = await response.stream.bytesToString();
  //   } else {
  //     print(response.reasonPhrase);
  //   }

  //   return response.data;
  // }
}
