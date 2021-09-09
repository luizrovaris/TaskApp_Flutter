import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../adaptative/adaptative_button.dart';
import '../widgets/list_task.dart';
import '../models/task.dart';
import './new_task_dialog.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final List<Task> _listTask = [
    Task('Curso Flutter', 'Curso de Flutter com Dart.', false),
    Task(
        'Curso C#',
        'Curso de C# .Net Core para criação de aplicações Web e BackEnd com deploy em ambiente Azure.',
        false),
    Task('Cloud', 'Rever pacotes no AWS e Azure.', false),
  ];

  void _handleSwitchChange(int index, bool value) {
    setState(() {
      _listTask[index].finished = value;
    });
  }

  void _saveTask(Task task) {
    setState(() {
      _listTask.add(task);
    });
  }

  void _removeTask(int index) {
    setState(() {
      _listTask.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_PT', null);
    final _mediaQuery = MediaQuery.of(context);
    final _isPortrait = _mediaQuery.orientation == Orientation.portrait;
    final _appBarHeight = _isPortrait
        ? _mediaQuery.size.height * 0.2
        : _mediaQuery.size.height * 0.15;

    _handleAddPress() {
      showDialog(
          context: context,
          builder: (_) {
            return NewTaskDialog(_saveTask);
          });
    }

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Task App'),
              //One option: FlatButton or TextButton:
              // trailing: FlatButton or TextButton(
              //   child: Text('Add'),
              //   onPressed: _handleAddPress,
              //   ),
              //One option: CupertinoButton:
              // trailing: CupertinoButton(
              //   child: Text('Add'),
              //   onPressed: _handleAddPress,
              //   padding: EdgeInsets.all(0),
              // ),
              trailing: AdaptativeButton(
                text: 'Add',
                callback: _handleAddPress,
              ),
            ),
            child: ListTask(
                _listTask, _handleSwitchChange, _isPortrait, _removeTask),
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
                        children: [
                          Text(
                            'Task App',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'Lobster',
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            DateFormat.yMMMMEEEEd('pt_PT')
                                .format(DateTime.now()),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Lobster',
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(_appBarHeight),
              ),
              actions: [
                IconButton(onPressed: _handleAddPress, icon: Icon(Icons.add))
              ],
              flexibleSpace: Image(
                image: AssetImage('assets/images/task.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _handleAddPress,
              child: Icon(Icons.add),
            ),
            body: ListTask(
                _listTask, _handleSwitchChange, _isPortrait, _removeTask),
          );
  }
}
