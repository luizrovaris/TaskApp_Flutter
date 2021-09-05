import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_PT', null);
    final _mediaQuery = MediaQuery.of(context);
    final _isPortrait = _mediaQuery.orientation == Orientation.portrait;
    final _appBarHeight = _isPortrait ? _mediaQuery.size.height * 0.2 : _mediaQuery.size.height * 0.15;

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
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [Text(
                    'Task App',
                    style: TextStyle( 
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                    ),
                  )],
                ),
                Row(
                  children: [Text(
                    DateFormat.yMMMMEEEEd('pt_PT').format(DateTime.now()),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Lobster',
                      fontWeight: FontWeight.bold,
                    ),
                  )],
                ),
            ],
            ),
          ),
          preferredSize: Size.fromHeight(_appBarHeight),
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