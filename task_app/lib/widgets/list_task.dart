import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class ListTask extends StatelessWidget {
  final List<Task> _listTask;
  final Function _handleSwitchChange;
  final bool _isPortrait;
  final Function _removeTask;

  ListTask(this._listTask, this._handleSwitchChange, this._isPortrait,
      this._removeTask);

  @override
  Widget build(BuildContext context) {
    final int _maxLength = _isPortrait ? 65 : 150;

    _handleLongPress(String title, String description) {
      showDialog(
          context: context,
          builder: (_) {
            return Platform.isIOS
                ? CupertinoAlertDialog(
                    title: Text(title),
                    content: Text(description),
                  )
                : SimpleDialog(
                    title: Text(title),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(description),
                      )
                    ],
                  );
          });
    }

    return Material(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              _listTask[index].title,
              style: _listTask[index].finished
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
            subtitle: _listTask[index].finished
                ? null
                : Text(_listTask[index].description.length > _maxLength
                    ? '${_listTask[index].description.substring(0, _maxLength)}...'
                    : _listTask[index].description),
            leading: Switch(
                value: _listTask[index].finished,
                onChanged: (value) => this._handleSwitchChange(index, value)),
            onLongPress: () => _handleLongPress(
                _listTask[index].title, _listTask[index].description),
            trailing: IconButton(
              onPressed: () => _removeTask(index),
              icon: Icon(Icons.delete),
            ),
          );
        },
        separatorBuilder: (_, __) => Divider(),
        itemCount: _listTask.length,
      ),
    );
  }
}
