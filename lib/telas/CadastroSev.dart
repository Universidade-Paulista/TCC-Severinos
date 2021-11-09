import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:severino/Servicos/CadastroSevService.dart';

class CadastroSev extends StatefulWidget {
  @override
  _CadastroSevState createState() => _CadastroSevState();
}

class _CadastroSevState extends State<CadastroSev> {
  bool severino = false;
  int _currentStep = 0;

  final nome = TextEditingController();
  final cpf = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  final indseverino = TextEditingController();
  final senha = TextEditingController();
  final logradouro = TextEditingController();
  final complemento = TextEditingController();
  final numero = TextEditingController();
  final bairro = TextEditingController();
  final cep = TextEditingController();
  final estado = TextEditingController();
  final cidade = TextEditingController();
  final razaosocial = TextEditingController();
  final nrocpfcnpj = TextEditingController();
  final linkwhatsapp = TextEditingController();
  final nrotelcomercial = TextEditingController();
  final confirmarsenha = TextEditingController();
  final cadSevServ = new CadastroSevService();

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
        backgroundColor: Colors.grey.shade300,
        body: Theme(
            data: ThemeData(
              colorScheme: ColorScheme.light(
                primary: Colors.cyan.shade400,
              ).copyWith(
                onPrimary: Colors.cyan,
                secondary: Colors.cyan,
              ),
            ),
            child: Stepper(
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  children: <Widget>[
                    SizedBox(height: 50.0),
                    Container(
                      color: Colors.cyan.shade300,
                      child: TextButton(
                        child: Text(
                          "CONTINUAR",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: onStepContinue,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        'CANCELAR',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      onPressed: onStepCancel,
                    ),
                  ],
                );
              },
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
                    cadSevServ.postCadastroSev(
                        context,
                        nome.text,
                        cpf.text,
                        email.text,
                        telefone.text,
                        indseverino.text == "N" ? true : false,
                        senha.text,
                        logradouro.text,
                        complemento.text,
                        numero.text,
                        bairro.text,
                        cep.text,
                        estado.text,
                        cidade.text,
                        razaosocial.text,
                        nrocpfcnpj.text,
                        linkwhatsapp.text,
                        nrotelcomercial.text);
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (this._currentStep > 0) {
                    this._currentStep = this._currentStep - 1;
                  } else {
                    this._currentStep = 0;
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
            controller: email,
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
            controller: senha,
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
            controller: confirmarsenha,
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
            controller: nome,
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
            controller: cpf,
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
            height: 10,
          ),
          TextFormField(
            controller: telefone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter()
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Celular",
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
            controller: cep,
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
            controller: logradouro,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Logradouro",
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
            controller: numero,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Número",
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
            controller: bairro,
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
            controller: cidade,
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
            controller: estado,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Estado",
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
            controller: complemento,
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
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text('Perfil Severino'),
        content: Column(children: <Widget>[
          TextFormField(
            controller: razaosocial,
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
            controller: nrocpfcnpj,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "CPF ou CNPJ",
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
            height: 10,
          ),
          TextFormField(
            controller: nrotelcomercial,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter()
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Número Comercial",
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
            height: 10,
          ),
          TextFormField(
            controller: linkwhatsapp,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter()
            ],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Número do WhatsApp",
              //deixar 55 fixo
              //hintText: "55 DDD 999999999",
              //https://api.whatsapp.com/send?phone=55 + DDDTelefone
              labelStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.all(0.0),
                child: IconButton(
                  icon: Icon(Icons.help_outline),
                  color: Colors.grey.shade400,
                  onPressed: () {
                    _showMyDialog(
                        "Será gerado um link de integração com o WhatsApp a partir do número disponibilizado, para que os clientes possam entrar em contato através do seu perfil.");
                  },
                ),
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
        isActive: _currentStep >= 2,
      )
    ];
    return _steps;
  }

  Future<void> _showMyDialog(sMensagem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(sMensagem),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
