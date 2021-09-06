import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTaskDialog extends StatelessWidget {
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
        )
      : TextField(
          decoration: InputDecoration(labelText: 'Description'),
          controller: _descriptionController,
        );

  @override
  Widget build(BuildContext context) {
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
                onPressed: null,
              ),
            ],
          )
        : AlertDialog(
            title: Text('Add Task'),
            content: Column(
              children: [
                _title,
                _description,
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: null,
                child: Text('Save'),
              )
            ],
          );
  }
}
