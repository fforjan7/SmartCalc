import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/discount_keyboard.dart';
import '../providers/discount_provider.dart';
import '../enums/enums.dart';

class DiscountScreen extends StatefulWidget {
  static const routeName = '/discount-screen';
  @override
  _DiscountScreenState createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  AppBar appBar;
  double fontSize = 35;
  Color priceColor = Colors.deepOrange;
  Color discountColor = Colors.grey;
  DiscountSelectedVariable selectedVariable = DiscountSelectedVariable.price;
  String result = '0';

  @override
  Widget build(BuildContext context) {
    appBar = AppBar(
        title: Text(
      'Discount',
      style: TextStyle(color: Theme.of(context).textSelectionColor),
    ));

    return Scaffold(
      appBar: appBar,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Text(
                  'Price: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: fontSize,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                width: 150,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      setState(() {
                        selectedVariable = DiscountSelectedVariable.price;
                        priceColor = Theme.of(context).textSelectionColor;
                        discountColor = Colors.grey;
                      });
                    },
                    child: Text(
                      Provider.of<DiscountProvider>(context).price,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: priceColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Discount(%): ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: fontSize,
                  ),
                ),
              ),
              Container(
                width: 150,
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {
                      setState(() {
                        selectedVariable = DiscountSelectedVariable.discount;
                        priceColor = Colors.grey;
                        discountColor = Theme.of(context).textSelectionColor;
                      });
                    },
                    child: Text(
                      Provider.of<DiscountProvider>(context).discount,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: discountColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(
              bottom: 20.0,
            ),
            child: FlatButton(
              onPressed: () {
                result = Provider.of<DiscountProvider>(context, listen: false)
                    .calculateFinalPrice();

                setState(() {});
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                  fontSize: 20,
                ),
              ),
              splashColor: Theme.of(context).textSelectionColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                children: <Widget>[
                  Text(
                    'Your final price is:',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    result,
                    style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.6,
            indent: 20,
            endIndent: 20,
          ),
          DiscountKeyboard(selectedVariable),
        ],
      ),
    );
  }
}
