import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset('assets/Logos/LogoRedonda.png'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

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
          width: 600,R
          alignment: Alignment.centerLeft,
        ),
      ),*/
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 300,
              child: Image.asset('assets/Logos/LogoRedonda.png'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              autofocus: true,
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
      child: Image.asset('assets/Logos/LogoRedonda.png'),
    );
  }

  Container campos() {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration:
                InputDecoration(hintText: "E-mail", labelText: "E-mail"),
          )
        ],
      ),
    );
  }
}
