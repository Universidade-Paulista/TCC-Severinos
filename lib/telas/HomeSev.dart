import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:severino/Servicos/LoginService.dart';
import 'package:severino/telas/Login.dart';

class HomeSev extends StatefulWidget {
  @override
  _HomeSevState createState() => _HomeSevState();
}

class _HomeSevState extends State<HomeSev> {
  bool _isButtonDisabled = true;
  final txtNome = TextEditingController();

  final login = new Login();

  @override
  Widget build(BuildContext context) {
    String nome = getNome(email, senha, severino).toString();
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
                    "Bem-Vindo !",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nome,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
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
                        primary: Colors.grey.shade400, // <-- Button color
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
                  onPressed: () => getImageFromBD(),
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
              height: 150,
            ),
            Container(
              height: 60,
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
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: const Text('Gustavo precisa de  você!'),
                    //     action: SnackBarAction(
                    //       label: 'Aceitar',
                    //       onPressed: () {
                    //         // Code to execute.
                    //       },
                    //     ),
                    //   ),
                    // );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (_isButtonDisabled ? "Iniciar" : "-"),
                        style: TextStyle(
                          fontSize: 30,
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
                    navigator.pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text("Histórico de serviços"),
                  onTap: () {},
                ),
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
                    leading: Icon(Icons.help),
                    title: Text("Central de ajuda"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  File arquivo;
  final picker = ImagePicker();

  Future getFileFromGallery() async {
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() => arquivo = File(file.path));

      File imageFile = new File(file.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      String base64Img = base64.encode(imageBytes);
      var test = base64Img;
    }
  }

  String testimg =
      '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';

  Future getImageFromBD() async {
    if ("RetornoBanco" != null) {
      Uint8List imageBytes = base64.decode(testimg);

      String dir = (await getApplicationDocumentsDirectory()).path;

      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".jpeg");
      await file.writeAsBytes(imageBytes);

      setState(() => arquivo = File(file.path));
    }
  }

  _alternaButton() {
    setState(() => _isButtonDisabled = !_isButtonDisabled);
  }

  getNome(String email, String senha, String severino) async {
    //return 'teste';
    final dio = Dio();
    var response = await dio.get("http://192.168.15.9:5000/api/Login/" +
        email +
        "/" +
        senha +
        "/" +
        severino);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
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
