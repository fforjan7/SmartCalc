import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bmi_provider.dart';
import '../providers/discount_provider.dart';
import '../providers/percentage_provider.dart';
import 'age_screen.dart';
import 'bmi_screen.dart';
import 'discount_screen.dart';
import 'percentage_screen.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlatButton buildFlatButton(String route, IconData icon, String title) {
      return FlatButton(
        onPressed: () {
          Provider.of<BmiProvider>(context, listen: false).clearData();
          Provider.of<DiscountProvider>(context, listen: false).clearData();
          Provider.of<PercentageProvider>(context, listen: false).clearData();
          Navigator.pushNamed(context, route);
        },
        shape: CircleBorder(),
        color: Colors.transparent,
        splashColor: Colors.deepOrange,
        child: GridTile(
          footer: Center(
              child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textSelectionColor,
              fontSize: 20,
            ),
          )),
          header: Icon(
            icon,
            size: 80,
            color: Colors.grey,
          ),
          child: Container(),
        ),
        padding: EdgeInsets.all(8.0),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'SmartCalc',
          style: TextStyle(
            color: Theme.of(context).textSelectionColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 10,
          left: 10,
        ),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25,
          ),
          mainAxisSpacing: 105.0,
          crossAxisSpacing: 55.0,
          children: <Widget>[
            buildFlatButton(
              BmiScreen.routeName,
              Icons.restaurant_menu,
              'BMI',
            ),
            buildFlatButton(
              AgeScreen.routeName,
              Icons.cake,
              'Age',
            ),
            buildFlatButton(
              DiscountScreen.routeName,
              Icons.money_off,
              'Discount',
            ),
            buildFlatButton(
              PercentageScreen.routeName,
              Icons.pie_chart_outlined,
              'Percentage',
            ),
          ],
        ),
      ),
    );
  }
}
