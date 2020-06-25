import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalResult {
  CalResult({@required this.weight,@required this.height});
  final int height;
  final int weight;
  double _bmi;

  String cal() {
    _bmi = (weight / (pow(height / 100, 2)));
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    print(_bmi);
    if (_bmi >= 25.0) {
      return "OverWeight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String message() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight .Try to execrise more";
    } else if (_bmi > 18.5) {
      return "You are Normal and good ";
    } else {
      return "You have a lower than normal body weight .Try to eat more";
    }
  }
}
