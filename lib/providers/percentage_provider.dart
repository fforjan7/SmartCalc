import 'package:flutter/cupertino.dart';

import '../enums/enums.dart';

class PercentageProvider extends ChangeNotifier {
  String percentage = '0';
  String value = '0';
  changeValue(String value, PercentageSelectedVariable selectedVariable) {
    if (selectedVariable == PercentageSelectedVariable.percentage) {
      this.percentage = value;
      notifyListeners();
    }
    if (selectedVariable == PercentageSelectedVariable.value) {
      this.value = value;
      notifyListeners();
    }
  }

  String getValue(PercentageSelectedVariable selectedVariable) {
    if (selectedVariable == PercentageSelectedVariable.percentage) {
      return this.percentage;
    }
    if (selectedVariable == PercentageSelectedVariable.value) {
      return this.value;
    } else
      return null;
  }

  String calculatePercentage() {
    var result = (double.parse(percentage) / 100) * double.parse(value);
    return result.toStringAsFixed(2);
  }

  clearData() {
    percentage = '0';
    value = '0';
    notifyListeners();
  }
}
