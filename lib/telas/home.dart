import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:dropdownfield/dropdownfield.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _txtEndereco = TextEditingController();
  String _servicoId = '';
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
    _getCurrentPosition();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/Logos/Logo-original.png',
          height: 40,
        ),
      ),
      drawer: Drawer(
        child: _getContainerDrawer(),
      ),
      body: _getParametrosTela(),
    );
  }

  _getParametrosTela() {
    return Container(
      padding: EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
      ),
      color: Colors.grey.shade300,
      child: ListView(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _txtEndereco,
            decoration: InputDecoration(
              labelText: "Endereço",
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: _getDropDownField(),
          ),
          SizedBox(
            height: 30,
          ),
          _getContainerBotaoLadoLado(
            "Eletricista",
            Icon(
              Icons.electrical_services,
              size: 100,
              color: Colors.black38,
            ),
            "Encanador",
            Icon(
              Icons.plumbing,
              size: 100,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _getContainerBotaoLadoLado(
            "Marceneiro",
            Icon(
              Icons.carpenter,
              size: 100,
              color: Colors.black38,
            ),
            "Mecânico",
            Icon(
              Icons.car_repair,
              size: 100,
              color: Colors.black38,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _getContainerBotaoLadoLado(
            "Pintor",
            Icon(
              Icons.format_paint,
              size: 100,
              color: Colors.black38,
            ),
            "Empreiteiro",
            Icon(
              Icons.engineering,
              size: 100,
              color: Colors.black38,
            ),
          ),
        ],
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

  _getCaixaTexto(Alignment alinhamento, Color cor, double altura,
      double largura, String titulo, Icon icone) {
    return Align(
      alignment: alinhamento,
      child: Container(
        width: largura,
        height: altura,
        color: cor,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.3, 1],
              colors: [
                Color(0xFF80DEEA),
                Colors.lightGreenAccent,
              ],
            ),
          ),
          child: SizedBox.expand(
            child: TextButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  icone,
                  // Icon(
                  //   Icons.electrical_services,
                  //   size: 100,
                  //   color: Colors.black38,
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _getContainerBotaoLadoLado(
      String tituloEsq, Icon iconeEsq, String tituloDir, Icon iconeDir) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getCaixaTexto(Alignment.topLeft, Colors.lightGreenAccent, 155, 170,
                tituloEsq, iconeEsq),
            _getCaixaTexto(Alignment.topRight, Colors.green, 155, 170,
                tituloDir, iconeDir),
          ],
        )
      ],
    );
  }

  _getDropDownField() {
    return DropDownField(
      onValueChanged: (dynamic value) {
        _servicoId = value;
      },
      value: _servicoId,
      required: false,
      hintText: 'Pesquisar um serviço',
      hintStyle: TextStyle(fontSize: 16, color: Colors.black),
      items: _profissoes,
    );
  }

  Future<void> _getCurrentPosition() async {
    // verify permissions
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
    }
    // get current position
    var _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // get address
    await _getGeolocationAddress(_currentPosition);
  }

  // Method to get Address from position:

  Future<void> _getGeolocationAddress(Position position) async {
    // geocoding
    var places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (places != null && places.isNotEmpty) {
      final Placemark place = places.first;
      _txtEndereco.text = "${place.street} ${place.name}, ${place.subLocality}";
    } else {
      return "No address available";
    }
  }
}
