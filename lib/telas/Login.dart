import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Image.asset(
          'assets/Logos/LogoEscrita.png',
          height: 225,
          width: 600,
          alignment: Alignment.centerLeft,
        ),
      ),*/
      body: Container(
        child: Column(
          children: [
            logo(),
            campos(),
            Align(
              alignment: Alignment.center,
            )
          ],
        ),
      ),
    );
  }

  Container logo() {
    return Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      child: Image.asset('assets/Logos/LogoRedonda.png'),
    );
  }

  Container campos(){
    return Container(
      child: Column(children: [TextField(decoration: InputDecoration(hintText: "E-mail", labelText: "E-mail"),)],),
    )
  }
}
