import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:get/get_navigation/src/extension_navigation.dart';
//import 'package:location/location.dart';
//import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _txtEndereco = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _txtEndereco.text = _getCurrentPosition();

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
            style: TextStyle(fontSize: 20),
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
                  leading: Icon(Icons.home),
                  title: Text("Editar perfil"),
                  onTap: () {
                    navigator.pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.qr_code_scanner_outlined),
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
                    leading: Icon(Icons.settings),
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
    return await _getGeolocationAddress(_currentPosition);
  }

  // Method to get Address from position:

  Future<String> _getGeolocationAddress(Position position) async {
    // geocoding
    var places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (places != null && places.isNotEmpty) {
      final Placemark place = places.first;
      return "${place.thoroughfare}, ${place.locality}";
    }

    return "No address available";
  }
}
