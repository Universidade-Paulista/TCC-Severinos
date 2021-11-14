import 'package:flutter/material.dart';

class ValidaCad extends ChangeNotifier {
  int _stepAtual = 0;

  int get stepAtual => _stepAtual;

  set stepAtual(int value) {
    _stepAtual = value;

    notifyListeners();
  }
}
