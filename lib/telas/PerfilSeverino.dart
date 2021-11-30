import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:severino/Servicos/PerfilService.dart';
import 'package:url_launcher/url_launcher.dart';

class PerfilSeverino extends StatefulWidget {
  final String idSeverinos;
  String imagem = "";
  String nome = "";

  PerfilSeverino({Key key, @required this.idSeverinos, this.nome, this.imagem})
      : super(key: key); /* Esse é o creator que vai receber os dados */
  @override
  _PerfilSeverinoState createState() => _PerfilSeverinoState(
      idSeverinos: idSeverinos, nome: nome, imagem: imagem);
}

class _PerfilSeverinoState extends State<PerfilSeverino> {
  String idSeverinos = "";
  String imagem = "";
  String nome = "";
  String numWhats;
  _PerfilSeverinoState(
      {Key key, @required this.idSeverinos, this.nome, this.imagem});

  final service = new PerfilService();

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
          color: Colors.grey.shade300,
          child: ListView(
            padding: EdgeInsets.only(
              top: 60,
              left: 40,
              right: 40,
            ),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Center(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: Image.memory(
                        base64.decode(imagem),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: new Container(
                        padding: new EdgeInsets.only(right: 10.0),
                        child: new Text(
                          nome,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 90,
              ),
              // Container(
              //   height: 40,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //     color: Colors.greenAccent[700],
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(10),
              //     ),
              //   ),
              //   child: SizedBox.expand(
              //     child: TextButton(
              //       onPressed: () {},
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             ("WhatsApp"),
              //             style: TextStyle(
              //               fontSize: 15,
              //               color: Colors.white,
              //             ),
              //             textAlign: TextAlign.center,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 200,
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.greenAccent[700],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () {
                      linkWhats();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ("Solicitar Serviço"),
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
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
            ],
          ),
        ));
  }

  linkWhats() async {
    numWhats = await service.getWhats(idSeverinos);
    String url = 'https://api.whatsapp.com/send?phone=55$numWhats';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getIcon() {
    return Container(
      height: 150,
      alignment: Alignment.center,
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: () {
            linkWhats();
          },
          child: Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 30,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
