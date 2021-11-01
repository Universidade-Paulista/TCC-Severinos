import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:severino/telas/Cadastro.dart';
import 'package:severino/telas/Login.dart';

class CadastroSevService {
  Dio dio = new Dio();
  final cad = new Cadastro();

  postCadastroSev(
      final context,
      String nome,
      String cpf,
      String email,
      String telefone,
      bool indseverino,
      String senha,
      String logradouro,
      String complemento,
      String numero,
      String bairro,
      String cep,
      String estado,
      String cidade,
      String razaosocial,
      String nrocpfcnpj,
      String linkwhatsapp,
      String nrotelcomercial) async {
    final bool indseverino = true;
    String sbody = "{" +
        "\"nome\": \"" +
        nome +
        "\",                          " +
        "   \"cpf\": \"" +
        cpf +
        "\",                            " +
        "   \"email\": \"" +
        email +
        "\",                        " +
        "	  \"telefone\": \"" +
        telefone +
        "\",                  " +
        "   \"indseverino\": \"" +
        indseverino.toString() +
        "\", " +
        "	  \"senha\": \"" +
        senha +
        "\",                        " +
        "	  \"logradouro\": \"" +
        logradouro +
        "\",              " +
        "	  \"complemento\": \"" +
        complemento +
        "\",                " +
        "	  \"numero\": \"" +
        numero +
        "\",                      " +
        "	  \"bairro\": \"" +
        bairro +
        "\",                      " +
        "	  \"cep\": \"" +
        cep +
        "\",                            " +
        "	  \"estado\": \"" +
        estado +
        "\",                      " +
        "   \"cidade\": \"" +
        cidade +
        "\",                      " +
        "	  \"razaosocial\": \"" +
        razaosocial +
        "\",                      " +
        "   \"nrocpfcnpj\": \"" +
        nrocpfcnpj +
        "\",                      " +
        "	  \"linkwhatsapp\": \"" +
        linkwhatsapp +
        "\",                      " +
        "	  \"nrotelcomercial\": \"" +
        nrotelcomercial +
        "\", " +
        "}                                                       ";

    var headers = {'Content-Type': 'application/json'};

    var request = http.Request('POST',
        Uri.parse('https://apiseverinos.azurewebsites.net/api/Cadastro/'));

    request.body = jsonEncode(sbody);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ),
      );
    } else {
      AlertDialog(
        title: Text(response.reasonPhrase),
      );
    }
  }
}
