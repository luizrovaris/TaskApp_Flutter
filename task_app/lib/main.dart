import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_app/widgets/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(224, 239, 244, 1),
        accentColor: Color.fromRGBO(173, 216, 230, 1),
        cupertinoOverrideTheme: CupertinoThemeData(
          barBackgroundColor: Color.fromRGBO(224, 239, 244, 1),
          textTheme: CupertinoTextThemeData(
            navTitleTextStyle: TextStyle(
              fontFamily: 'Lobster',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          primaryColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'Shadows Into Light')
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) => Color.fromRGBO(224, 239, 244, 1)),
        )),
        buttonTheme: ButtonThemeData(
          buttonColor: Color.fromRGBO(224, 239, 244, 1)
        ),
      ),
      home: Home(),
    );
  }
}
