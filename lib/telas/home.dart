import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xfff3f9a7), Color(0xffcac531)]),
        ),
        child: Padding(
            padding: EdgeInsets.all(60),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset('Logos/Logoredonda.png'),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    height: 60.0,
                    buttonColor: Colors.yellow,
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        "Preciso de um Severino",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Divider(),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    height: 60.0,
                    minWidth: 60.0,
                    buttonColor: Colors.yellow,
                    child: ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        "Sou um Severino",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ])));
  }
}
