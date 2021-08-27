import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Severinos());
}

class Severinos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Severinos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/Logos/LogoEscrita.png',
          height: 200,
          width: 600,
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            width: 250,
            height: 250,
            alignment: Alignment.centerRight,
            child: Image.asset('assets/Logos/LogoRedonda.png'),
          ),
        ],
      )),
    );
  }
}
