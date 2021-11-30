import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:severino/Servicos/CadastroService.dart';
import 'package:severino/Servicos/CadastroSevService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditCadSev extends StatefulWidget {
  @override
  _EditCadSevState createState() => _EditCadSevState();
}

class _EditCadSevState extends State<EditCadSev> {
  int _currentStep = 0;

  //Step 1
  final _formUserData = GlobalKey<FormState>();
  final nome = TextEditingController();
  final cpf = TextEditingController();
  final telefone = TextEditingController();

  //Step 2
  final _formUserAddress = GlobalKey<FormState>();
  final cep = TextEditingController();
  final logradouro = TextEditingController();
  final numero = TextEditingController();
  final bairro = TextEditingController();
  final cidade = TextEditingController();
  final estado = TextEditingController();
  final complemento = TextEditingController();

  //Step 4
  final _formUserSev = GlobalKey<FormState>();
  final razaosocial = TextEditingController();
  final nrocpfcnpj = TextEditingController();
  final nrotelcomercial = TextEditingController();
  final linkwhatsapp = TextEditingController();
  final tipoprof = TextEditingController();

  final indseverino = TextEditingController();
  final cadSevServ = new CadastroSevService();
  final cadSev = new CadastroService();

  String est = "São Paulo";
  String prof = "Arrumadeira";
  int controle = 0;
  int controle2 = 0;

  List<String> profissoes = [];

  Widget build(BuildContext context) {
    if (controle2 == 0) {
      getEdit();
    } else {
      getListProfissoes();
    }

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
                    //  _formUserData.currentState.validate();
                  } else {
                    alterarCad();

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
            )));
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
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
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
                  if (value.length < 3) return "Logradouro inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: numero,
                keyboardType: TextInputType.text,
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
                    fontSize: 18,
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
                value: est,
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
      Step(
          title: Text('Perfil Severino'),
          isActive: _currentStep >= 3,
          content: Form(
            key: _formUserSev,
            child: Column(children: <Widget>[
              TextFormField(
                controller: razaosocial,
                decoration: InputDecoration(
                  labelText: "Razão Social",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                // validator: (value) {
                //   if (value.length == 0) return "Preencha Razão Social";

                //   if (value.length < 3) return "Cidade inválida";

                //   return null;
                // },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: nrocpfcnpj,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfOuCnpjFormatter()
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "CPF ou CNPJ",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length != 14) return "CPF/CNPJ inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
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
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                // validator: (value) {
                //   if (value.length == 0) return "Preencha Número Comercial ";

                //   if (value.length < 11) return "Celular inválido";

                //   return null;
                // },
                style: TextStyle(
                  fontSize: 20,
                ),
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
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length < 11) return "Celular inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              _getDropDown(),
              SizedBox(
                height: 20,
              ),
            ]),
          ))
    ];
    return _steps;
  }

  _getDropDown() {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
        labelText: "Serviço prestado",
        labelStyle: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
      items: profissoes.map((String profissao) {
        // prof = profissao;
        return DropdownMenuItem(
          child: Text(profissao),
          value: profissao,
        );
      }).toList(),
      onChanged: (String novaProfissaoSelecionada) {
        tipoprof.text = novaProfissaoSelecionada;
      },
      value: prof,
      // validator: (value) {
      //   if (value == null) return "Selecione um serviço";
      //   return null;
      // },
    );
  }

  getListProfissoes() async {
    try {
      final dio = Dio();
      var response = await dio.get("http://192.168.15.9:5000/api/profissao/");

      if (response.statusCode == 200) {
        var lista = List<String>.from(response.data);

        if (controle2 == 1) {
          setState(() => profissoes = lista);
          controle2 = 2;
        }
      } else {
        AlertDialog(
          title: Text(response.statusMessage),
        );
      }
    } on DioError catch (error) {
      AlertDialog(
        title: Text(error.message),
      );
    }
  }

  getEdit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String idpessoa = prefs.getString('Idpessoa');

    Map<String, dynamic> perfil =
        jsonDecode(await cadSev.getCadastro(idpessoa));

    nome.text = perfil['Nome'];
    cpf.text = perfil['NroCPF'];
    telefone.text = perfil['Telefone'];
    cep.text = perfil['Cep'];
    logradouro.text = perfil['Logradouro'];
    numero.text = perfil['Numero'].toString();
    bairro.text = perfil['Bairro'];
    cidade.text = perfil['Cidade'];

    if (controle == 0) {
      if (perfil["Estado"] != "") {
        setState(() => est = perfil["Estado"]);
      }

      if (perfil["NomeProfissao"] != "") {
        setState(() => prof = perfil["NomeProfissao"]);
      }

      controle = 1;
    }

    complemento.text = perfil['Complemento'];
    razaosocial.text = perfil['RazaoSocial'];
    nrocpfcnpj.text = perfil['NroCpfCnpj'];
    nrotelcomercial.text = perfil['NroTelComercial'];
    linkwhatsapp.text = perfil['LinkWhatsapp'];

    controle2 = 1;
  }

  alterarCad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String idpessoa = prefs.getString('Idpessoa');

    cadSevServ.putCadastro(
        context,
        nome.text,
        cpf.text,
        telefone.text,
        indseverino.text == "S" ? true : false,
        logradouro.text,
        complemento.text,
        numero.text,
        bairro.text,
        cep.text,
        estado.text == "" ? est : estado.text,
        cidade.text,
        razaosocial.text,
        nrocpfcnpj.text,
        linkwhatsapp.text,
        nrotelcomercial.text,
        tipoprof.text,
        idpessoa);
  }
}
