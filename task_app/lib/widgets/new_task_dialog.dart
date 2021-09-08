import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class NewTaskDialog extends StatelessWidget {
  final Function _saveTask;

  NewTaskDialog(this._saveTask);

  static final _titleController = TextEditingController();
  final Widget _title = Platform.isIOS
      ? CupertinoTextField(
          placeholder: 'Title',
          controller: _titleController,
        )
      : TextField(
          decoration: InputDecoration(labelText: 'Title'),
          controller: _titleController,
        );

  static final _descriptionController = TextEditingController();
  final Widget _description = Platform.isIOS
      ? CupertinoTextField(
          placeholder: 'Description',
          controller: _descriptionController,
          minLines: 5,
          maxLines: 10,
        )
      : TextField(
          decoration: InputDecoration(labelText: 'Description'),
          controller: _descriptionController,
          minLines: 5,
          maxLines: 10,
        );

  @override
  Widget build(BuildContext context) {
    _handleSave() {
      _saveTask(
          Task(_titleController.text, _descriptionController.text, false));
      _titleController.clear();
      _descriptionController.clear();
      Navigator.of(context).pop();
    }

    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text('Add Task'),
            content: Column(
              children: [
                _title,
                _description,
              ],
            ),
            actions: [
              CupertinoDialogAction(
                child: Text('Save'),
                onPressed: _handleSave,
              ),
            ],
          )
        : AlertDialog(
            title: Text('Add Task'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _title,
                _description,
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: _handleSave,
                child: Text('Save'),
              )
            ],
          );
  }
}
