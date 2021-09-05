import 'package:flutter/material.dart';
import '../models/task.dart';

class ListTask extends StatelessWidget{
  final List<Task> _listTask;

  ListTask(this._listTask);

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(_listTask[index].title),
            subtitle: Text(_listTask[index].description),
            leading: Switch(
              value: _listTask[index].finished,
              onChanged: null,
            ),
          );
        },
        separatorBuilder: (_, __) => Divider(),
        itemCount: _listTask.length,
        ),
    );
  }

}