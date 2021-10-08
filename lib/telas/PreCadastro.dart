import 'package:flutter/material.dart';
import 'package:severino/telas/Cadastro.dart';
import 'package:get/get.dart';
import 'package:severino/telas/CadastroSev.dart';

class PreCadastro extends StatefulWidget {
  @override
  _PreCadastroState createState() => _PreCadastroState();
}

class _PreCadastroState extends State<PreCadastro> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/Logos/Logo-original.png',
          height: 40,
        ),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: ListView(
          padding: EdgeInsets.only(
            top: 200,
            left: 50,
            right: 50,
          ),
          children: <Widget>[
            Container(
              child: Text(
                "Escolha a opção que deseja fazer parte:",
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 60,
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
                    Get.to(Cadastro());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cliente",
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
                    Get.to(CadastroSev());
                  },
                  onLongPress: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Profissional",
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
          ],
        ),
      ),
    );
  }
}
