import 'package:rxdart/rxdart.dart';
import 'package:severino/Servi%C3%A7os/Login.dart';

class LoginBlock {  

final login = Login();
  final _controlador = BehaviorSubject();
  
  Stream get saida => _controlador.stream;
  Sink get entrada => _controlador.sink;
  
  chamadaDaSuaRequisição() async {
    await _service.suaRequisicao().then(entrada.add);
  }
  
  void dispose() {
    _controlador.close();
  }

}
