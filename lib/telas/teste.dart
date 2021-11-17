import 'package:flutter/material.dart';

class teste extends StatefulWidget {
  @override
  _testeState createState() => _testeState();
}

class _testeState extends State<teste> {
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
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 40,
          right: 40,
        ),
        color: Colors.grey.shade300,
        child: Container(
          height: 100,
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
            child: TextFormField(
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
          ),
        ),
      ),
    );
  }
}
