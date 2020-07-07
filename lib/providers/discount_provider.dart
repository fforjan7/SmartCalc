import 'package:flutter/cupertino.dart';

import '../enums/enums.dart';

class DiscountProvider extends ChangeNotifier {
  String price = '0';
  String discount = '0';
  changeValue(String value, DiscountSelectedVariable selectedVariable) {
    if (selectedVariable == DiscountSelectedVariable.price) {
      this.price = value;
      notifyListeners();
    }
    if (selectedVariable == DiscountSelectedVariable.discount) {
      this.discount = value;
      notifyListeners();
    }
  }

  String getValue(DiscountSelectedVariable selectedVariable) {
    if (selectedVariable == DiscountSelectedVariable.price) {
      return this.price;
    }
    if (selectedVariable == DiscountSelectedVariable.discount) {
      return this.discount;
    } else
      return null;
  }

  String calculateFinalPrice() {
    var finalPrice = double.parse(price) - double.parse(price) * (double.parse(discount)/100);
    return finalPrice.toStringAsFixed(2);
  }
  clearData() {
    discount = '0';
    price = '0';
    notifyListeners();
  }
}
