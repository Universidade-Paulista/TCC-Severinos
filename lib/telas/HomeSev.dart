import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:severino/Servicos/HomeSevService.dart';
import 'package:severino/telas/EditCadSev.dart';
import 'package:severino/telas/Login.dart';

class HomeSev extends StatefulWidget {
  @override
  _HomeSevState createState() => _HomeSevState();
}

class _HomeSevState extends State<HomeSev> {
  bool _isButtonDisabled = true;
  final txtNome = TextEditingController();
  String _sNome = "";
  int controle = 0;
  HomeSevService service = new HomeSevService();

  @override
  Widget build(BuildContext context) {
    getNome(email, senha);
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
      drawer: Drawer(
        child: _getContainerDrawer(),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: ListView(
          padding: EdgeInsets.only(
            top: 60,
            left: 80,
            right: 80,
          ),
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // "Bem-Vindo \n" + _sNome + " !",
                    "Bem-Vindo(a),",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  _sNome,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ]),
            ),

            //       //trazer do model
            //       // Consumer<CadastroMod>(builder: (context, CadastroMod, child) {
            //       //   if (CadastroMod.nome != null) {
            //       //     return Text(
            //       //       ' ${CadastroMod.nome.split(" ")}',
            //       //       style: TextStyle(
            //       //         fontSize: 15,
            //       //         color: Colors.black,
            //       //       ),
            //       //     );
            //       //   }

            //       //   return Text(
            //       //     'Severino',
            //       //     style: TextStyle(
            //       //       fontSize: 15,
            //       //       color: Colors.black,
            //       //     ),
            //       //   );
            //       // }),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 70,
            ),
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
              height: 5,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              child: SizedBox.expand(
                child: ElevatedButton.icon(
                  onPressed: () => chamaImagem(),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: 14,
                  ),
                  label: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text('Insira sua logo'),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      primary: Colors.transparent,
                      onPrimary: Colors.black,
                      textStyle: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.cyan.shade300,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () {
                    _alternaButton();

                    //pop up
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Aguardando Serviços'),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (_isButtonDisabled ? "Iniciar" : "Aguardando"),
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
              height: 20,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: _isButtonDisabled
                      ? null
                      : () {
                          _alternaButton();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Serviço Encerrado'),
                            ),
                          );
                        },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ("Encerrar"),
                        style: TextStyle(
                          fontSize: 20,
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
      ),
    );
  }

  _getContainerDrawer() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("Editar perfil"),
                  onTap: () {
                    Get.to(EditCadSev());
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.history),
                //   title: Text("Histórico de serviços"),
                //   onTap: () {},
                // ),
              ],
            ),
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: <Widget>[
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Sair"),
                    onTap: () {
                      Get.to(Login());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //iniciar e encerrar serviço - botões
  _alternaButton() {
    setState(() => _isButtonDisabled = !_isButtonDisabled);
  }

  //imagem
  File arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() => arquivo = File(file.path));

      File imageFile = new File(file.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      String base64Img = base64.encode(imageBytes);

      if (service.putImagem(base64Img) == 200) {
        final snackBar = SnackBar(
          content: const Text(
            "Logo inserida com sucesso!.",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          backgroundColor: Colors.greenAccent[100],
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  Future getImageFromBD() async {
    if (service.getImagem() != null) {
      Uint8List imageBytes = base64.decode(service.getImagem().toString());

      String dir = (await getApplicationDocumentsDirectory()).path;

      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".jpeg");
      await file.writeAsBytes(imageBytes);

      setState(() => arquivo = File(file.path));
    }
  }

  chamaImagem() {
    if (service.getImagem() != null) {
      getImageFromBD();
    } else {
      getFileFromGallery();
    }
  }

  getNome(String email, String senha) async {
    try {
      final dio = Dio();
      var response = await dio.get(
          "https://apiseverinos.azurewebsites.net/api/Cadastro/" +
              email +
              "/" +
              senha);

      if (response.statusCode == 200) {
        var nome = response.data;
        if (controle == 0) {
          setState(() => _sNome = nome);
          controle = 1;
        }
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

  // getNome(String email, String senha) async {
  //   final dio = Dio();
  //   var response = await dio.get(
  //       "https://apiseverinos.azurewebsites.net/api/Cadastro/" +
  //           email +
  //           "/" +
  //           senha);

  //   if (response.statusCode == 200) {
  //     var lista = response.data as List;
  //     return lista;
  //   } else {
  //     AlertDialog(
  //       title: Text(response.statusMessage),
  //     );
  //   }
  // }

  // Future pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;

  //     final imageTemporary = File(image.path);
  //     setState(() => this.arquivo = imageTemporary);
  //     //final imagePermanent = await saveImagePermanently(image.path);
  //     // setState(() => this.image = imagePermanent);
  //   } on PlatformException catch (e) {
  //     print("Failed to pick image: $e");
  //   }
  // }

  // Future<File> saveImagePermanently(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final image = File('${directory.path}/$name');

  //   return File(imagePath).copy(image.path);
  // }
}
