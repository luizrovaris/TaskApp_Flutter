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
      navigationBar: CupertinoNavigationBar(
        middle: Text('Task App'),
        trailing: TextButton(
          child: Text('Add'),
          onPressed: null,
          ),
        ),
      child: Text('Home Page'),
    )
    : Scaffold(
      appBar: AppBar(
        title: Text('Task App'),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        ),
      body: Text('Home Page'),
    );
  }

}