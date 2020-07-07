import 'package:flutter/cupertino.dart';

import '../enums/enums.dart';

class BmiProvider extends ChangeNotifier {
  String weight = '0';
  String height = '0';
  changeValue(String value, BmiSelectedVariable selectedVariable) {
    if (selectedVariable == BmiSelectedVariable.weight) {
      this.weight = value;
      notifyListeners();
    }
    if (selectedVariable == BmiSelectedVariable.height) {
      this.height = value;
      notifyListeners();
    }
  }

  String getValue(BmiSelectedVariable selectedVariable) {
    if (selectedVariable == BmiSelectedVariable.weight) {
      return this.weight;
    }
    if (selectedVariable == BmiSelectedVariable.height) {
      return this.height;
    } else
      return null;
  }

  String calculateBmi() {
    if (weight == '0' || height == '0')
      return '0';
    else {
      var bmi = double.parse(weight) /
          ((double.parse(height) / 100) * (double.parse(height) / 100));
      return bmi.toStringAsFixed(2);
    }
  }

  clearData() {
    weight = '0';
    height = '0';
    notifyListeners();
  }
}
