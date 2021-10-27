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
    Response response =
        await dio.post("http://192.168.15.9:5000/api/Cadastro/", data: {
      'nome': nome,
      'cpf': cpf,
      'email': email,
      'telefone': telefone,
      'indseverino': indseverino,
      'senha': senha,
      'logradouro': logradouro,
      'complemento': complemento,
      'numero': numero,
      'bairro': bairro,
      'cep': cep,
      'estado': estado,
      'cidade': cidade
      // 'razaosocial': razaosocial,
      // 'nrocpfcnpj': nrocpfcnpj,
      // 'linkwhatsapp': linkwhatsapp,
      // 'nrotelcomercial': nrotelcomercial
    });

    bool teste;
    if (response.statusCode == 200) {
      teste = true;
      return teste;
    } else {
      teste = false;
      return teste;
    }
  }
}
