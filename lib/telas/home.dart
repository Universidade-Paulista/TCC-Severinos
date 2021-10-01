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
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie",
    "Salary"
  ];

  @override
  Widget build(BuildContext context) {
    _getCurrentPosition();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SEVERINO'S",
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Abadi',
          ),
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
          )
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
