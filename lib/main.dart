import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/bmi_provider.dart';
import 'providers/discount_provider.dart';
import 'providers/percentage_provider.dart';
import 'screens/age_screen.dart';
import 'screens/bmi_screen.dart';
import 'screens/discount_screen.dart';
import 'screens/percentage_screen.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BmiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DiscountProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PercentageProvider(),
        )
      ],
      child: MaterialApp(
        title: 'SmartCalc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          textSelectionColor: Colors.deepOrange,
          primarySwatch: Colors.deepOrange,
        ),
        routes: {
          '/': (ctx) => TabsScreen(),
          BmiScreen.routeName: (ctx) => BmiScreen(),
          AgeScreen.routeName: (ctx) => AgeScreen(),
          DiscountScreen.routeName: (ctx) => DiscountScreen(),
          PercentageScreen.routeName: (ctx) => PercentageScreen(),
        },
      ),
    );
  }
}
