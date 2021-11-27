import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:severino/telas/Cadastro.dart';
import 'package:severino/telas/Login.dart';

class CadastroService {
  Dio dio = new Dio();

  postCadastro(
      final context,
      String nome,
      String cpf,
      String email,
      String celular,
      bool indseverino,
      String senha,
      String logradouro,
      String complemento,
      String numero,
      String bairro,
      String cep,
      String estado,
      String cidade) async {
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
        celular +
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

  putCadastro(
      final context,
      String nome,
      String cpf,
      String celular,
      bool indseverino,
      String logradouro,
      String complemento,
      String numero,
      String bairro,
      String cep,
      String estado,
      String cidade) async {
    final response = await http.put(Uri.parse(
        'https://apiseverinos.azurewebsites.net/api/Cadastro/' +
            nome +
            "/" +
            cpf +
            "/" +
            celular +
            "/" +
            indseverino.toString() +
            "/" +
            logradouro +
            "/" +
            complemento +
            "/" +
            numero +
            "/" +
            bairro +
            "/" +
            cep +
            "/" +
            estado +
            "/" +
            cidade));

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Cadastro();
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
