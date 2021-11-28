import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:severino/telas/SolicitarServico.dart';

class PerfilSeverino extends StatefulWidget {
  @override
  _PerfilSeverinoState createState() => _PerfilSeverinoState();
}

class _PerfilSeverinoState extends State<PerfilSeverino> {
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
              arquivo != null
                  ? Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Center(
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: ClipOval(
                              child: Image.file(arquivo, fit: BoxFit.cover)),
                        ),
                      ),
                    )
                  : Container(
                      height: 150,
                      alignment: Alignment.center,
                      child: SizedBox.expand(
                          child: ElevatedButton(
                        onPressed: () {},
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
                      )),
                    ),
              SizedBox(
                height: 150,
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
                    onPressed: () {},
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

  File arquivo;
  // final picker = ImagePicker();

  // Future getFileFromGallery() async {
  //   final file = await picker.pickImage(source: ImageSource.gallery);

  //   if (file != null) {
  //     setState(() => arquivo = File(file.path));

  //     File imageFile = new File(file.path);
  //     List<int> imageBytes = imageFile.readAsBytesSync();
  //     String base64Img = base64.encode(imageBytes);
  //     var test = base64Img;
  //   }
  // }
}
