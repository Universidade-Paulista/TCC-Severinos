import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Severino's"),
        actions: <wi>,        
      ),
      body: Container(
        
      ),
    );
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff36648B),
      appBar: AppBar(
        title: Text("SEVERINO"),
        centerTitle: true,
        backgroundColor: Color(0xff36648B),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/Logos/Logoredonda.png'),
              Divider(),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Severino",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 40)),
              ),
              ButtonTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                height: 60.0,
                buttonColor: Colors.yellow,
                child: RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    "Preciso de um Severino",
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Color(0xffFFD700),
                ),
              ),
              Divider(),
              ButtonTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                height: 60.0,
                buttonColor: Colors.yellow,
                child: RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    "Sou um Severino",
                    style: TextStyle(color: Colors.black),
                  ),
                  color: Color(0xffFFD700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
