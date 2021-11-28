import 'package:dio/dio.dart';
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

  //Step 3
  final _formUserAuth = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  final confirmarsenha = TextEditingController();

  //Step 4
  final _formUserSev = GlobalKey<FormState>();
  final razaosocial = TextEditingController();
  final nrocpfcnpj = TextEditingController();
  final nrotelcomercial = TextEditingController();
  final linkwhatsapp = TextEditingController();
  final tipoprof = TextEditingController();

  final indseverino = TextEditingController();
  final cadSevServ = new CadastroSevService();

  List<String> profissoes = [];

  // prencherLista() async {
  //   profissoes = await cadSevServ.getProfissao();
  // }

  Widget build(BuildContext context) {
    getListProfissoes();
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
                        nrotelcomercial.text,
                        tipoprof.text);
                    _formUserAddress.currentState.validate();
                    _formUserAuth.currentState.validate();
                    _formUserSev.currentState.validate();
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
      Step(
          title: Text('Login'),
          isActive: _currentStep >= 2,
          content: Form(
            key: _formUserAuth,
            child: Column(children: <Widget>[
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha E-mail";

                  if (!value.contains("@") || !value.contains("."))
                    return "Email inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: senha,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Senha";

                  // if (value.length < 7) return "Senha muito curta";

                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                controller: confirmarsenha,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirmar senha",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Senha igual anterior";

                  // if (value.length != senha) return "Senhas diferentes";

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
                  if (value.length == 0) return "Preencha este campo";

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
                // validator: (value) {
                //   if (value.length == 0) return "Preencha Celular";

                //   if (value.length < 11) return "Celular inválido";

                //   return null;
                // },
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
      items: profissoes.map((dynamic profissao) {
        return DropdownMenuItem(
          child: Text(profissao),
          value: profissao,
        );
      }).toList(),
      onChanged: (dynamic novaProfissaoSelecionada) {
        tipoprof.text = novaProfissaoSelecionada;
      },
      validator: (value) {
        if (value == null) return "Selecione um serviço";
        return null;
      },
    );
  }

  getListProfissoes() async {
    try {
      final dio = Dio();
      var response = await dio.get("http://192.168.15.7:5000/api/profissao/");

      if (response.statusCode == 200) {
        var lista = List<String>.from(response.data);
        setState(() => profissoes = lista);
      } else {
        AlertDialog(
          title: Text(response.statusMessage),
        );
      }
    } on DioError catch (error) {}
  }
}
