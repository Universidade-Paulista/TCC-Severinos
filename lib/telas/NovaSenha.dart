import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:severino/Servicos/LoginService.dart';

class NovaSenha extends StatefulWidget {
  @override
  _NovaSenhaState createState() => _NovaSenhaState();
}

class _NovaSenhaState extends State<NovaSenha> {
  final _formKey = GlobalKey<FormState>();
  final cpf = TextEditingController();
  final senha = TextEditingController();
  final confirmasenha = TextEditingController();

  final log = new LoginService();

  @override
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
      body: Container(
        child: _formulario(context),
      ),
    );
  }

  Widget _formulario(context) {
    return Form(
      key: _formKey,
      child: ListView(
          padding: EdgeInsets.only(
            top: 110,
            left: 32,
          ),
          children: <Widget>[
            _destaqueFundo(
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter()
                ],
                controller: cpf,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Informe seu CPF:",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha CPF";

                  if (value.length != 14) return "CPF inválido";

                  return null;
                },
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.cyan.shade300,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () async {
                      if (!_formKey.currentState.validate()) {
                        String validacpf = await log.getCPF(cpf.text);
                        if (validacpf == 'S') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('CPF encontrado.'),
                            ),
                          );
                        } else {
                          _showMyDialog("CPF não cadastrado.");
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OK",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              TextFormField(
                controller: senha,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nova Senha:",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Senha";

                  // if (value.length < 7) return "Senha muito curta";

                  return null;
                },
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              TextFormField(
                controller: confirmasenha,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Confirmar Senha:",
                  labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value.length == 0) return "Preencha Senha igual anterior";

                  // if (value.length != senha) return "Senhas diferentes";

                  return null;
                },
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Container(
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.cyan.shade300,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        String altsenha =
                            await log.putSenha(context, cpf.text, senha.text);
                        if (altsenha == 'true') {
                          // _showMyDialog("Senha alterada com sucesso");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text('Senha alterada com sucesso.'),
                            ),
                          );
                        } else {
                          _showMyDialog("Verifique seu CPF.");
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Alterar",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ]),
    );
  }

  Future<void> _showMyDialog(sMensagem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
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

  _destaqueFundo(TextFormField cpf, Container confirma, TextFormField senha,
      TextFormField senha2, Container alterar) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _destaqueFrente(500, 330, cpf, confirma, senha, senha2, alterar),
          ],
        )
      ],
    );
  }

  _destaqueFrente(
      double altura,
      double largura,
      TextFormField cpf,
      Container confirma,
      TextFormField senha,
      TextFormField senha2,
      Container alterar) {
    return Align(
      child: Container(
        width: largura,
        height: altura,
        child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: 30,
            right: 25,
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
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: SizedBox.expand(
            child: TextButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  cpf,
                  SizedBox(
                    height: 10,
                  ),
                  confirma,
                  SizedBox(
                    height: 50,
                  ),
                  senha,
                  SizedBox(
                    height: 10,
                  ),
                  senha2,
                  SizedBox(
                    height: 10,
                  ),
                  alterar
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
