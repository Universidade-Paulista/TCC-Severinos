import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeSev extends StatefulWidget {
  @override
  _HomeSevState createState() => _HomeSevState();
}

class _HomeSevState extends State<HomeSev> {
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
      drawer: Drawer(
        child: _getContainerDrawer(),
      ),
      body: Container(
        color: Colors.grey.shade300,
        child: ListView(
          padding: EdgeInsets.only(
            top: 60,
            left: 50,
            right: 50,
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
                    "*Nome do Prestador logado*",
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
                  onPressed: () => getFileFromGallery(),
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
              height: 65,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.cyan.shade300,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () async {
                    //Get.to(Cadastro());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Iniciar",
                        style: TextStyle(
                          fontSize: 35,
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
    final file = await picker.getImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() => arquivo = File(file.path));

      File imageFile = new File(file.path);
      List<int> imageBytes = imageFile.readAsBytesSync();
      String base64Img = base64.encode(imageBytes);
      var test = base64Img;
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
}

// Future<File> saveImagePermanently(String imagePath) async {
//   final directory = await getApplicationDocumentsDirectory();
//   final name = basename(imagePath);
//   final image = File('${directory.path}/$name');

//   return File(imagePath).copy(image.path);
// }
