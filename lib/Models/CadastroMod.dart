import 'package:flutter/material.dart';

class CadastroMod extends ChangeNotifier {
  String _seqPessoa;
  String _nome;
  String _cpf;
  String _email;
  String _celular;
  bool _indseverino;
  String _senha;
  String _logradouro;
  String _complemento;
  String _numero;
  String _bairro;
  String _cep;
  String _estado;
  String _cidade;
  String _razaosocial;
  String _nrocpfcnpj;
  String _linkwhatsapp;
  String _nrotelcomercial;

  String get seqPessoa => _seqPessoa;
  String get nome => _nome;
  String get cpf => _cpf;
  String get email => _email;
  String get celular => _celular;
  bool get indseverino => _indseverino;
  String get senha => _senha;
  String get logradouro => _logradouro;
  String get complemento => _complemento;
  String get numero => _numero;
  String get bairro => _bairro;
  String get cep => _cep;
  String get estado => _estado;
  String get cidade => _cidade;
  String get razaosocial => _razaosocial;
  String get nrocpfcnpj => _nrocpfcnpj;
  String get linkwhatsapp => _linkwhatsapp;
  String get nrotelcomercial => _nrotelcomercial;

  set seqPessoa(String value) {
    _seqPessoa = value;
  }

  set nome(String value) {
    _nome = value;

    //notifyListeners();
  }

  set cpf(String value) {
    _cpf = value;
  }

  set email(String value) {
    _email = value;
  }

  set celular(String value) {
    _celular = value;
  }

  set indseverino(bool value) {
    _indseverino = value;
  }

  set senha(String value) {
    _senha = value;
  }

  set logradouro(String value) {
    _logradouro = value;
  }

  set complemento(String value) {
    _complemento = value;
  }

  set numero(String value) {
    _numero = value;
  }

  set bairro(String value) {
    _bairro = value;
  }

  set cep(String value) {
    _cep = value;
  }

  set estado(String value) {
    _estado = value;
  }

  set cidade(String value) {
    _cidade = value;
  }

  set razaosocial(String value) {
    _razaosocial = value;
  }

  set nrocpfcnpj(String value) {
    _nrocpfcnpj = value;
  }

  set linkwhatsapp(String value) {
    _linkwhatsapp = value;
  }

  set nrotelcomercial(String value) {
    _nrotelcomercial = value;
  }
}
