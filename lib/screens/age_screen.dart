import 'package:flutter/material.dart';

class AgeScreen extends StatefulWidget {
  static const routeName = '/age-screen';

  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  AppBar appBar;
  int age = 0;
  DateTime pickedDate;

  @override
  Widget build(BuildContext context) {
    appBar = AppBar(
        title: Text(
      'Age',
      style: TextStyle(color: Theme.of(context).textSelectionColor),
    ));

    return Scaffold(
      appBar: appBar,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Text(
              'Your Age is:',
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            height: 250,
            child: Text(
              age.toString(),
              style: TextStyle(
                color: Theme.of(context).textSelectionColor,
                fontSize: 120,
              ),
            ),
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            onPressed: () async {
              pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1901),
                lastDate: DateTime.now(),
              );
              var yearsOld = DateTime.now().difference(pickedDate).inDays / 365;
              age = yearsOld.floor();
              setState(() {});
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70.0),
              side: BorderSide(
                color: Theme.of(context).textSelectionColor,
              ),
            ),
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Pick your date of birth!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
