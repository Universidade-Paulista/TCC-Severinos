import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:severino/Servicos/ListPrestadoresService.dart';

class ListaPrestadores extends StatefulWidget {
  ListaPrestadores(
      {this.profissao}); /* Esse é o creator que vai receber os dados */
  final String profissao;

  @override
  _ListaPrestadoresState createState() => _ListaPrestadoresState();
}

class _ListaPrestadoresState extends State<ListaPrestadores> {
  List<Map<String, dynamic>> _prestadores = [];
  File arquivo;
  ListPrestadoresService service = new ListPrestadoresService();
  Map<String, dynamic> usuario;

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
      body: ListView(
        children: _prestadores
            .map(
              (element) => Card(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    _preencheListaPrestadores(ListaPrestadores().profissao),
                  ],
                ),
                color: Colors.grey.shade300,
              ),
            )
            .toList(),
      ),
    );
  }

  _preencheListaPrestadores(String profissao) {
    usuario = jsonDecode(service.getListaPrestadores(profissao));

    for (var i = 0; i < usuario.length; i++)
      return _getCaixaDeInfo(usuario[i].razaoSocial, usuario[i].seqColaborador,
          usuario[i].imgLogo);
  }

  _getCaixaDeInfo(String titulo, String idSeverino, String imagem) {
    getImageFromBD(imagem);
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
              child: Image.file(arquivo, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  Future getImageFromBD(String imgBase64) async {
    if (imgBase64 != null) {
      Uint8List imageBytes = base64.decode(imgBase64);

      String dir = (await getApplicationDocumentsDirectory()).path;

      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".jpeg");
      await file.writeAsBytes(imageBytes);

      setState(() => arquivo = File(file.path));
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
