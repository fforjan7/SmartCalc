import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bmi_keyboard.dart';
import '../providers/bmi_provider.dart';
import '../enums/enums.dart';

class BmiScreen extends StatefulWidget {
  static const routeName = '/bmi-screen';

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  AppBar appBar;
  double fontSize = 35;
  Color weightColor = Colors.deepOrange;
  Color heightColor = Colors.grey;
  BmiSelectedVariable selectedVariable = BmiSelectedVariable.weight;
  String bmi = '0';

  @override
  Widget build(BuildContext context) {
    appBar = AppBar(
        title: Text(
      'BMI',
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
                padding: EdgeInsets.all(10),
                child: Text(
                  'Weight(kg): ',
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
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      setState(() {
                        selectedVariable = BmiSelectedVariable.weight;
                        weightColor = Theme.of(context).textSelectionColor;
                        heightColor = Colors.grey;
                      });
                    },
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        Provider.of<BmiProvider>(context).weight,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: weightColor,
                        ),
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
                padding: EdgeInsets.all(10),
                child: Text(
                  'Height(cm): ',
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
                        selectedVariable = BmiSelectedVariable.height;
                        weightColor = Colors.grey;
                        heightColor = Theme.of(context).textSelectionColor;
                      });
                    },
                    child: Text(
                      Provider.of<BmiProvider>(context).height,
                      style: TextStyle(
                        fontSize: fontSize,
                        color: heightColor,
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
                bmi = Provider.of<BmiProvider>(context, listen: false)
                    .calculateBmi();

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
                    bmi,
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
          BmiKeyboard(selectedVariable),
        ],
      ),
    );
  }
}
