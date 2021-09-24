import 'package:rxdart/rxdart.dart';
import 'package:severino/Servicos/LoginService.dart';

class LoginBloc {
  final login = LoginService();
  final _controlador = BehaviorSubject();

  Stream get saida => _controlador.stream;
  Sink get entrada => _controlador.sink;

  _chamadaRequestLogin() async {
    //await login.requestLogin().then(entrada.add);
  }

  void dispose() {
    _controlador.close();
  }
}
