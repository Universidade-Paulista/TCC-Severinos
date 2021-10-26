import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:severino/Servicos/LoginService.dart';
import 'package:get/get.dart';
import 'package:severino/telas/HomeSev.dart';
import 'package:severino/telas/PreCadastro.dart';
import 'package:severino/telas/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _txtEmail = TextEditingController();
  final _txtSenha = TextEditingController();
  final log = new LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 40,
          right: 40,
        ),
        color: Colors.grey.shade300,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset('assets/Logos/LogoNome2.png'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _txtEmail,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: _txtSenha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Recuperar senha",
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFF80DEEA),
                    Color(0xFF4DD0E1),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () async {
                    if (await log
                            .getLogin(_txtEmail.text, _txtSenha.text)
                            .toString() !=
                        null) {
                      _getSalvar();
                      Get.to(Home());
                    } else {
                      _showMyDialog("E-mail e/ou senha inválidos");
                    }
                    // Get.to(Home());
                    // Get.to(HomeSev());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Acessar",
                        style: TextStyle(
                          fontSize: 25,
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
              height: 60,
            ),
            Container(
              height: 35,
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () async {
                  Get.to(PreCadastro());
                },
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getSalvar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('Email', _txtEmail.text);
    prefs.setString('Senha', _txtSenha.text);
  }

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
