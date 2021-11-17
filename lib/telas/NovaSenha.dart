import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:severino/telas/Login.dart';

class NovaSenha extends StatefulWidget {
  @override
  _NovaSenhaState createState() => _NovaSenhaState();
}

class _NovaSenhaState extends State<NovaSenha> {
  final _formKey = GlobalKey<FormState>();
  final cpf = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: Image.asset(
          'assets/Logos/Logo-original.png',
          height: 40,
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Container(
        child: _formulario(context),
      ),
    );
  }

  Widget _formulario(context) {
    return Form(
      key: _formKey,
      child: ListView(
          padding: EdgeInsets.only(
            top: 100,
            left: 50,
            right: 50,
          ),
          children: <Widget>[
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              controller: cpf,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Informe seu CPF:",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
              validator: (value) {
                if (value.length == 0) return "Preencha CPF";

                if (value.length != 14) return "CPF inválido";

                return null;
              },
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.cyan.shade300,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      // String result =
                      //     await log.getLogin(_txtEmail.text, _txtSenha.text);
                      // if (result == 'N') {
                      //   email = _txtEmail.text;
                      //   senha = _txtSenha.text;
                      //   _getSalvar();
                      //   Get.to(Home());
                      // } else {
                      //   _showMyDialog("CPF inválido.");
                      // }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "OK",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            TextFormField(
              //controller: senha,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Nova Senha:",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
              validator: (value) {
                if (value.length == 0) return "Preencha Senha";

                // if (value.length < 7) return "Senha muito curta";

                return null;
              },
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              //controller: senha,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Confirmar Senha:",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
              validator: (value) {
                if (value.length == 0) return "Preencha Senha igual anterior";

                // if (value.length != senha) return "Senhas diferentes";

                return null;
              },
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.cyan.shade300,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      Get.to(Login());
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Alterar",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ]),
    );
  }

  // Widget _recuperar() {
  //   return Scaffold(
  //     body: Container(
  //       child: ListView(
  //         children: <Widget>[
  //           TextFormField(
  //             keyboardType: TextInputType.text,
  //             //controller: _txtSenha,
  //             obscureText: true,
  //             decoration: InputDecoration(
  //               labelText: "Senha",
  //               labelStyle: TextStyle(
  //                 color: Colors.black38,
  //                 fontWeight: FontWeight.w400,
  //                 fontSize: 20,
  //               ),
  //             ),
  //             validator: (value) {
  //               if (value.length == 0) return "Informe a Senha";

  //               return null;
  //             },
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Container(
  //             height: 35,
  //             alignment: Alignment.centerRight,
  //             child: TextButton(
  //               onPressed: () {
  //                 Get.to(NovaSenha());
  //               },
  //               child: Text(
  //                 "Recuperar senha",
  //                 style: TextStyle(fontSize: 10, color: Colors.black),
  //               ),
  //             ),
  //           ),
  //           SizedBox(
  //             height: 40,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Future<void> _showMyDialog(sMensagem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(sMensagem),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
