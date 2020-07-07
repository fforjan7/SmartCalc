import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums/enums.dart';
import '../providers/percentage_provider.dart';


class PercentageKeyboard extends StatelessWidget {
  final PercentageSelectedVariable percentageSelectedVariable ;

  PercentageKeyboard(this.percentageSelectedVariable);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Table(children: [
            TableRow(
              children: [
                buildNumericButton(context, '7'),
                buildNumericButton(context, '8'),
                buildNumericButton(context, '9'),
              ],
            ),
            TableRow(
              children: [
                buildNumericButton(context, '4'),
                buildNumericButton(context, '5'),
                buildNumericButton(context, '6'),
              ],
            ),
            TableRow(
              children: [
                buildNumericButton(context, '1'),
                buildNumericButton(context, '2'),
                buildNumericButton(context, '3'),
              ],
            ),
            TableRow(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.125,
                  color: Theme.of(context).primaryColor,
                ),
                buildNumericButton(context, '0'),
                buildNumericButton(context, '.'),
              ],
            ),
          ]),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Table(
            children: [
              TableRow(
                children: [
                  buildOperationButton(context, 'AC'),
                ],
              ),
              TableRow(
                children: [
                  buildOperationButton(context, '⌫'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container buildNumericButton(BuildContext context, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Theme.of(context).primaryColor,
      child: FlatButton(
        shape: CircleBorder(),
        padding: EdgeInsets.all(14.0),
        onPressed: () => {
          buttonPressed(text,context,percentageSelectedVariable),
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 35,
          ),
        ),
        splashColor: Theme.of(context).textSelectionColor,
      ),
    );
  }

  SizedBox buildOperationButton(BuildContext context, String text) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 14.0,
          vertical: 0.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 2.0,
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70.0),
            side: BorderSide(
              color: Theme.of(context).textSelectionColor,
            ),
          ),
          padding: EdgeInsets.all(5.0),
          onPressed: () {
            buttonPressed(text,context,percentageSelectedVariable);
          },
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontSize: 25,
            ),
          ),
          splashColor: Theme.of(context).textSelectionColor,
        ),
      ),
    );
  }

  buttonPressed(String buttonText, BuildContext context, PercentageSelectedVariable selectedVariable) {
    String displayedText = Provider.of<PercentageProvider>(context,listen: false).getValue(percentageSelectedVariable);
    if (buttonText == 'AC') {
      displayedText = '0';
    } else if (buttonText == '⌫') {
      displayedText = displayedText.substring(0, displayedText.length - 1);
      if (displayedText == '') {
        displayedText = '0';
      }
    } else {
      if (displayedText == '0') {
        displayedText = buttonText;
      } else
        displayedText = displayedText + buttonText;
    }
    Provider.of<PercentageProvider>(context,listen: false).changeValue(displayedText, percentageSelectedVariable);
   }
}
