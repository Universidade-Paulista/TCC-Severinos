import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  bool severino = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/Logos/LogoEscrita2.png',
          height: 40,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        color: Colors.grey.shade300,
        child: ListView(
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: Colors.black87,
              ),
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
            Text(
              "Informações pessoais",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
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
            CheckboxListTile(
                title: Text("Deseja se tornar um severino?"),
                subtitle: Text(
                  "Ao selecionar está opção você se tornara um prestador de serviços do aplicativo Severino's",
                ),
                checkColor: Colors.black,
                activeColor: Colors.cyan.shade300,
                value: severino,
                onChanged: (bool valCheck) {
                  setState(() {
                    severino = valCheck;
                  });
                }),
            SizedBox(
              height: 40,
            ),
            Text(
              "Informações do prestador de serviço",
              style: TextStyle(
                color: Colors.black87,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              readOnly: severino == true ? false : true,
              decoration: InputDecoration(
                labelText: "Razão social",
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
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Link Whatsapp Business",
                labelStyle: TextStyle(
                  color: Colors.greenAccent.shade700,
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
          ],
        ),
      ),
    );
  }
}
