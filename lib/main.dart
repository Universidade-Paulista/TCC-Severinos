import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:severino/telas/Login.dart';
import 'package:get/get.dart';

void main() {
  runApp(Severinos());
}

class Severinos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Severinos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey.shade300,
      ),
      home: Login(),
    );
  }
}
