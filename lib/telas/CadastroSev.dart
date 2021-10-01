import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

class CadastroSev extends StatefulWidget {
  @override
  _CadastroSevState createState() => _CadastroSevState();
}

class _CadastroSevState extends State<CadastroSev> {
  bool severino = false;
  int _currentStep = 0;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/Logos/Logo-original.png',
            height: 40,
          ),
        ),
        backgroundColor: Colors.grey.shade300,
        body: Theme(
            data: ThemeData(
                accentColor: Colors.cyan,
                primarySwatch: Colors.cyan,
                colorScheme: ColorScheme.light(primary: Colors.cyan.shade400)),
            child: Stepper(
              steps: _mySteps(),
              currentStep: this._currentStep,
              onStepTapped: (step) {
                setState(() {
                  this._currentStep = step;
                });
              },
              onStepContinue: () {
                setState(() {
                  if (this._currentStep < this._mySteps().length - 1) {
                    this._currentStep = this._currentStep + 1;
                  } else {
                    print('Completo');
                  }
                });
              },
            )));
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
        title: Text('Login'),
        content: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Usuário",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "E-mail",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Confirmar senha",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Dados Cadastrais'),
        content: Column(children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter()
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "CPF",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Endereço",
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter()
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "CEP",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Rua",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Bairro",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Cidade",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Complemento",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text('Perfil Severino'),
        content: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: "Razão Social",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CnpjInputFormatter()
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "CNPJ",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Link WhatsApp",
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 5,
          ),
        ]),
        isActive: _currentStep >= 0,
      )
    ];
    return _steps;
  }
}
