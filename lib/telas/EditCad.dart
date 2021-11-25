import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:severino/Servicos/CadastroService.dart';

class EditCad extends StatefulWidget {
  @override
  _EditCadState createState() => _EditCadState();
}

class _EditCadState extends State<EditCad> {
  int _currentStep = 0;

  //Step1
  final _formUserData = GlobalKey<FormState>();
  final nome = TextEditingController();
  final cpf = TextEditingController();
  final telefone = TextEditingController();

//Step2
  final _formUserAddress = GlobalKey<FormState>();
  final cep = TextEditingController();
  final logradouro = TextEditingController();
  final numero = TextEditingController();
  final bairro = TextEditingController();
  final cidade = TextEditingController();
  final estado = TextEditingController();
  final complemento = TextEditingController();

  final indseverino = TextEditingController();
  final cadServ = new CadastroService();

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
                  _formUserData.currentState.validate();
                } else {
                  // cadServ.putCadastro(
                  //     context,
                  //     nome.text,
                  //     cpf.text,
                  //     telefone.text,
                  //     indseverino.text == "S" ? true : false,
                  //     logradouro.text,
                  //     complemento.text,
                  //     numero.text,
                  //     bairro.text,
                  //     cep.text,
                  //     estado.text,
                  //     cidade.text);
                  // _formUserAddress.currentState.validate();
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
          ),
        ));
  }

  List<Step> _mySteps() {
    List<Step> _steps = [
      Step(
          title: Text('Seus Dados'),
          isActive: _currentStep >= 0,
          content: Form(
            key: _formUserData,
            child: Column(children: <Widget>[
              TextFormField(
                controller: nome,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Nome";

                  if (value.length < 3) return "Nome inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
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
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha CPF";

                  if (value.length != 14) return "CPF inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
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
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Celular";

                  if (value.length < 11) return "Celular inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          )),
      Step(
          title: Text('Endereço'),
          isActive: _currentStep >= 1,
          content: Form(
            key: _formUserAddress,
            child: Column(children: <Widget>[
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
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha CEP";

                  if (value.length < 10) return "CEP inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: logradouro,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Logradouro",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Logradouro";

                  if (value.length < 3) return "Logradouro inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: numero,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Número",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: bairro,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Bairro",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Bairro";

                  if (value.length < 3) return "Bairro inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: cidade,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Cidade",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Cidade";

                  if (value.length < 3) return "Cidade inválida";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              DropdownButtonFormField(
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: "Estado",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                items: Estados.listaEstados.map((String estado) {
                  return DropdownMenuItem(
                    child: Text(estado),
                    value: estado,
                  );
                }).toList(),
                onChanged: (String novoEstadoSelecionado) {
                  estado.text = novoEstadoSelecionado;
                },
                validator: (value) {
                  if (value == null) return "Selecione um estado";
                  return null;
                },
              ),
              TextFormField(
                controller: complemento,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Complemento",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          )),
    ];
    return _steps;
  }

  Future<void> showMyDialog(sMensagem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Atenção'),
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
