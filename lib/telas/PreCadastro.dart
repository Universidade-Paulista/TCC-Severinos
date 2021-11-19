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
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
        title: Image.asset(
          'assets/Logos/Logo-original.png',
          height: 40,
        ),
      ),
      body: _preCadastro(),
    );
  }

  _preCadastro() {
    return Container(
      color: Colors.grey.shade300,
      child: ListView(
        padding: EdgeInsets.only(
          top: 100,
          left: 32,
        ),
        children: <Widget>[
          _destaqueFundo(
            Text(
              "Escolha a opção que deseja fazer parte:",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            Container(
              height: 50,
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
            Container(
              height: 50,
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
                    Get.to(CadastroSev());
                  },
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
          ),
        ],
      ),
    );
  }

  _destaqueFundo(Text titulo, Container botao1, Container botao2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _destaqueFrente(500, 330, titulo, botao1, botao2),
          ],
        )
      ],
    );
  }

  _destaqueFrente(double altura, double largura, Text titulo, Container botao1,
      Container botao2) {
    return Align(
      child: Container(
        width: largura,
        height: altura,
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            top: 20,
            left: 30,
            right: 25,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [
                Color(0xFF80DEEA),
                Colors.lightGreenAccent,
              ],
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: SizedBox.expand(
            child: TextButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  titulo,
                  SizedBox(
                    height: 60,
                  ),
                  botao1,
                  SizedBox(
                    height: 20,
                  ),
                  botao2,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
