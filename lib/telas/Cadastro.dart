import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/Logos/LogoEscrita.png',
          height: 225,
          width: 600,
          alignment: Alignment.centerLeft,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        color: Colors.white,
        child: ListView(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmar senha",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CpfInputFormatter()
              ],
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "CPF",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter()
              ],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "CEP",
                labelStyle: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
