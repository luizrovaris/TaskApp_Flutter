import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:task_app/widgets/list_task.dart';
import '../models/task.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home>{
  final List<Task> _listTask = [
    Task('Curso Flutter', 'Curso de Flutter com Dart.', false),
    Task('Curso C#', 'Curso de C# .Net Core.', false),
  ];

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
      child: ListTask(_listTask),
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
      body: ListTask(_listTask),
    );
  }

}