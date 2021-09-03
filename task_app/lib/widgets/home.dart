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
        //title: Text('Task App'),
        bottom: PreferredSize(
          child: Column(
            children: [
              Row(
                children: [Text('Task App')],
              ),
              Row(
                children: [Text('Data')],
              ),
          ],
          ),
          preferredSize: Size.fromHeight(100),
          ),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.add))
        ],
        flexibleSpace: Image(
          image: AssetImage('assets/images/task.jpg'),
          fit: BoxFit.cover,
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        ),
      body: Text('Home Page'),
    );
  }

}