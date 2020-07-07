import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/percentage_keyboard.dart';
import '../providers/percentage_provider.dart';
import '../enums/enums.dart';

class PercentageScreen extends StatefulWidget {
  static const routeName = '/percentage-screen';
  @override
  _PercentageScreenState createState() => _PercentageScreenState();
}

class _PercentageScreenState extends State<PercentageScreen> {
  AppBar appBar;
  double fontSize = 35;
  Color percentageColor = Colors.deepOrange;
  Color valueColor = Colors.grey;
  PercentageSelectedVariable selectedVariable =
      PercentageSelectedVariable.percentage;
  String result = '0';

  @override
  Widget build(BuildContext context) {
    appBar = AppBar(
        title: Text(
      'Percentage',
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
                  'Percentage(%): ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: fontSize,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                width: 130,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      setState(() {
                        selectedVariable =
                            PercentageSelectedVariable.percentage;
                        percentageColor = Theme.of(context).textSelectionColor;
                        valueColor = Colors.grey;
                      });
                    },
                    child: Text(
                      Provider.of<PercentageProvider>(context).percentage,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: percentageColor,
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
                  'of: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: fontSize,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                width: 130,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {
                      setState(() {
                        selectedVariable = PercentageSelectedVariable.value;
                        percentageColor = Colors.grey;
                        valueColor = Theme.of(context).textSelectionColor;
                      });
                    },
                    child: Text(
                      Provider.of<PercentageProvider>(context).value,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: valueColor,
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
                result = Provider.of<PercentageProvider>(context, listen: false)
                    .calculatePercentage();

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
                    'Your result is:',
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
          PercentageKeyboard(selectedVariable),
        ],
      ),
    );
  }
}
