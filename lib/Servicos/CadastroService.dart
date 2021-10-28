import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CadastroService {
  Dio dio = new Dio();

  postCadastro(
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

    final dio = Dio();

    String sbody = "{                                                       " +
        "   \"nome\": \"" +
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
        "	  \"complemento\": " +
        complemento +
        ",                " +
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

    Response response = await dio.post(
      "http://192.168.15.9:5000/api/Cadastro/",
      data: {sbody},
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      AlertDialog(
        title: Text(response.statusMessage),
      );
    }
  }
}
