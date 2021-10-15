import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListaPrestadores extends StatefulWidget {
  @override
  _ListaPrestadoresState createState() => _ListaPrestadoresState();
}

class _ListaPrestadoresState extends State<ListaPrestadores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/Logos/Logo-original.png',
          height: 40,
        ),
      ),
      body: Column(
        children: [
          _getCaixaDeInfo("Eletricista - Elétrica bom encanador", 3),
        ],
      ),
    );
  }

  _getCaixaDeInfo(String titulo, double nota) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.cyan.shade300,
          ),
        ),
        margin: EdgeInsets.fromLTRB(10, 40, 10, 40),
        height: 150,
        child: Container(
          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(125, 0, 0, 0),
                color: Colors.white,
                height: 500.0,
                width: 500,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      color: Colors.white,
                      height: 500.0,
                      width: 500.0,
                      child: Flexible(
                        child: Text(
                          titulo,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(125, 100, 0, 0),
                color: Colors.white,
                height: 150.0,
                width: 500.0,
                child: Icon(Icons.star),
                alignment: Alignment.centerLeft,
              ),
              Container(
                color: Colors.black,
                height: 150.0,
                width: 120.0,
              )
            ],
          ),
        ));
  }
}
