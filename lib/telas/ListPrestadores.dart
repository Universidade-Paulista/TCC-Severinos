import 'package:flutter/material.dart';

class ListaPrestadores extends StatefulWidget {
  @override
  _ListaPrestadoresState createState() => _ListaPrestadoresState();
}

class _ListaPrestadoresState extends State<ListaPrestadores> {
  List<String> _profissoes = [
    "Encanador",
    "Marceneiro",
    "Eletricista",
    "Mecanico",
    "Garota de aluguel",
    "Motorista"
  ];

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
      body: ListView(
        children: _profissoes
            .map(
              (element) => Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    for (var i = 0; i < _profissoes.length; i++)
                      _getCaixaDeInfo(_profissoes[i], 1)
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  _getCaixaDeInfo(String titulo, int nota) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.cyan.shade300,
        ),
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              child: _returnRating(nota),
              alignment: Alignment.centerLeft,
            ),
            Container(
              color: Colors.black,
              height: 150.0,
              width: 120.0,
            )
          ],
        ),
      ),
    );
  }

  _returnRating(int nota) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Icon(
              Icons.star,
              color: Colors.yellowAccent[700],
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            color: Colors.white,
            child: Icon(
              nota >= 2 ? Icons.star : Icons.star_border,
              color: Colors.yellowAccent[700],
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            color: Colors.white,
            child: Icon(
              nota >= 3 ? Icons.star : Icons.star_border,
              color: Colors.yellowAccent[700],
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            color: Colors.white,
            child: Icon(
              nota >= 4 ? Icons.star : Icons.star_border,
              color: Colors.yellowAccent[700],
            ),
            alignment: Alignment.centerLeft,
          ),
          Container(
            color: Colors.white,
            child: Icon(
              nota == 5 ? Icons.star : Icons.star_border,
              color: Colors.yellowAccent[700],
            ),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}
