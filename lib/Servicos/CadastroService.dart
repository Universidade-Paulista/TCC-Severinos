import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:severino/telas/Cadastro.dart';
import 'package:severino/telas/Login.dart';

class CadastroService {
  Dio dio = new Dio();
  final cad = new Cadastro();

  postCadastro(
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
      String cidade) async {
    // String razaosocial,
    // String nrocpfcnpj,
    // String linkwhatsapp,
    // String nrotelcomercial) async {

    //final dio = Dio();

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
        "	  \"razaosocial\": \"Robert Teste LTDA\",              " +
        "	  \"nrocpfcnpj\": \"12.345.678/9101-11\",              " +
        "	  \"linkwhatsapp\": null,                              " +
        "	  \"nrotelcomercial\": \"(16) 3615-9861\"              " +
        "}                                                       ";

    var headers = {'Content-Type': 'application/json'};

    var request = http.Request('POST',
        Uri.parse('https://apiseverinos.azurewebsites.net/api/Cadastro/'));
    // request.body = jsonEncode(
    //     '''"{    \r\n    \\"nome\\": \\"$nome\\",\r\n    \\"cpf\\": \\$cpf\\",\r\n    \\"email\\": \\"$email\\",\r\n\t\\"telefone\\": \\"$telefone\\",\r\n    \\"indseverino\\": \\"$indseverino\\",\r\n\t\\"senha\\": \\"$senha\\",\r\n\t\\"logradouro\\": \\"$logradouro\\",\r\n\t\\"complemento\\": \\"$complemento\\",\r\n\t\\"numero\\": \\"$numero\\",\r\n\t\\"bairro\\": \\"$bairro\\",\r\n\t\\"cep\\": \\"$cep\\",\r\n\t\\"estado\\": \\"$estado\\",\r\n    \\"cidade\\": \\"$cidade\\",\r\n\t\\"razaosocial\\": \\"Robert Teste LTDA\\",\r\n\t\\"nrocpfcnpj\\": \\"12.345.678/9101-11\\",\r\n\t\\"linkwhatsapp\\": null,\r\n\t\\"nrotelcomercial\\": \\"(16) 3615-9861\\"\r\n}"''');
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
