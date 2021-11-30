import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:severino/Servicos/ListPrestadoresService.dart';
import 'package:severino/Servicos/ListaPrestadorMod.dart';

class ListaPrestadores extends StatefulWidget {
  final String profissao;

  ListaPrestadores({Key key, @required this.profissao})
      : super(key: key); /* Esse é o creator que vai receber os dados */

  @override
  _ListaPrestadoresState createState() =>
      _ListaPrestadoresState(profissaoSelecionada: this.profissao);
}

class _ListaPrestadoresState extends State<ListaPrestadores> {
  String profissaoSelecionada;
  _ListaPrestadoresState({Key key, @required this.profissaoSelecionada});

  int controle = 0;
  File arquivo;
  ListPrestadoresService service = new ListPrestadoresService();
  Map<String, dynamic> usuario;
  List<ListaPrestadorMod> listaPrestMod = <ListaPrestadorMod>[];

  initState() {
    super.initState();
    if (controle == 0) {
      getListaPrestadores();
      controle = 1;
    }
  }

  dispose() {
    super.dispose();
  }

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
      body: ListView.builder(
        itemCount: listaPrestMod.length,
        itemBuilder: (context, index) {
          return _getCaixaDeInfo(listaPrestMod[index].razao,
              listaPrestMod[index].idSeverino, listaPrestMod[index].img);
        },
      ),
    );
  }

  _getCaixaDeInfo(String titulo, String idSeverino, String imagem) {
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
                      child: TextButton(
                        onPressed: () {},
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
              child: Text(
                idSeverino,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              alignment: Alignment.centerLeft,
            ),
            Container(
              color: Colors.black,
              height: 150.0,
              width: 120.0,
              child: Image.memory(base64.decode(imagem)),
            ),
          ],
        ),
      ),
    );
  }

  // _getListaPrestadores() async {
  //   final jSon = await service.getListaPrestadores(profissaoSelecionada);
  //   setState(() {
  //     Iterable list = json.decode(json.encode(jSon)) as List<Iterable>;
  //     listaPrestMod =
  //         list.map((model) => ListaPrestadorMod.fromJson(model)).toList();
  //   });
  // }

  getListaPrestadores() async {
    final dio = Dio();

    try {
      Response response = await dio.get(
          "https://apiseverinos.azurewebsites.net/api/Colaborador/$profissaoSelecionada/lista");

      if (response.statusCode == 200) {
        setState(() {
          Iterable list = json.decode(json.encode(response.data));
          listaPrestMod =
              list.map((model) => ListaPrestadorMod.fromJson(model)).toList();
        });
      } else {
        AlertDialog(
          title: Text(response.statusMessage),
        );
      }
    } on DioError catch (error) {
      AlertDialog(
        title: Text(error.message),
      );
    }
  }

  // _returnRating(int nota) {
  //   return Container(
  //     child: Row(
  //       children: <Widget>[
  //         Container(
  //           color: Colors.white,
  //           child: Icon(
  //             Icons.star,
  //             color: Colors.yellowAccent[700],
  //           ),
  //           alignment: Alignment.centerLeft,
  //         ),
  //         Container(
  //           color: Colors.white,
  //           child: Icon(
  //             nota >= 2 ? Icons.star : Icons.star_border,
  //             color: Colors.yellowAccent[700],
  //           ),
  //           alignment: Alignment.centerLeft,
  //         ),
  //         Container(
  //           color: Colors.white,
  //           child: Icon(
  //             nota >= 3 ? Icons.star : Icons.star_border,
  //             color: Colors.yellowAccent[700],
  //           ),
  //           alignment: Alignment.centerLeft,
  //         ),
  //         Container(
  //           color: Colors.white,
  //           child: Icon(
  //             nota >= 4 ? Icons.star : Icons.star_border,
  //             color: Colors.yellowAccent[700],
  //           ),
  //           alignment: Alignment.centerLeft,
  //         ),
  //         Container(
  //           color: Colors.white,
  //           child: Icon(
  //             nota == 5 ? Icons.star : Icons.star_border,
  //             color: Colors.yellowAccent[700],
  //           ),
  //           alignment: Alignment.centerLeft,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
