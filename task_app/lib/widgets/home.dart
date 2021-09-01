import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS 
    ? CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Task App'),),
      child: Text('Home Page'),
    )
    : Scaffold(
      appBar: AppBar(
        title: Text('Task App'),
      ),
      body: Text('Home Page'),
    );
  }

}