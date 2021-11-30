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
import 'package:shared_preferences/shared_preferences.dart';

class HomeSev extends StatefulWidget {
  @override
  _HomeSevState createState() => _HomeSevState();
}

class _HomeSevState extends State<HomeSev> {
  // bool _isButtonDisabled = true;
  final txtNome = TextEditingController();
  final txtSeqPessoa = TextEditingController();
  final txtStatus = TextEditingController();

  HomeSevService service = new HomeSevService();
  int controle = 0;
  int controle2 = 0;
  int controle3 = 0;
  int controle4 = 0;

  String _sNome = "";
  String idpessoa = "";
  String _status = "";

  @override
  Widget build(BuildContext context) {
    getIdPessoa();
    if (controle3 == 0) {
      getStatus(idpessoa);
    }

    if (controle2 == 0) {
      getNome(email, senha);
    }
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
            controle4 == 0
                ? _status == "I"
                    ? validaStatus("I")
                    : validaStatus("A")
                : validaStatus("E"),
            // buttonIniciar(),
            SizedBox(
              height: 20,
            ),
            // buttonEncerrar(),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  buttonIniciar() {
    return Container(
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
            controle4 = 0;
            statusSev("A");

            validaStatus("A");

            if (controle4 == 0) {
              setState(() {
                controle4 = 1;
              });
            }

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
                ("Iniciar"),
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
    );
  }

  buttonEncerrar() {
    return Container(
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
          onPressed: () {
            controle4 = 0;
            statusSev("I");
            validaStatus("I");
            if (controle4 == 0) {
              setState(() {
                controle4 = 1;
              });
            }
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
  // _alternaButton() {
  //   setState(() => _isButtonDisabled = !_isButtonDisabled);
  // }

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
    } finally {
      controle2 = 1;
    }
  }

  validaStatus(String status) {
    if (status == "I") {
      return buttonIniciar();
    } else if (status == "A") {
      return buttonEncerrar();
    }
  }

  statusSev(String status) {
    service.postStatus(context, status, idpessoa);
  }

  getIdPessoa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    idpessoa = prefs.getString('Idpessoa');
  }

  getStatus(String id) async {
    try {
      final dio = Dio();
      var response = await dio
          .get("https://apiseverinos.azurewebsites.net/api/Status/$id/");

      if (response.statusCode == 200) {
        var status = response.data;

        if (controle3 == 0) {
          setState(() => _status = status);
          controle3 = 1;
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
