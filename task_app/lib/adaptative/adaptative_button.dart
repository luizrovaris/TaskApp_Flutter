import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String text;
  final Function callback;
  final double padding;

  AdaptativeButton({this.text = '', required this.callback, this.padding = 0});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(this.text),
            padding: EdgeInsets.all(this.padding),
            onPressed: () => this.callback,
          )
        : ElevatedButton(
            child: Text(this.text),
            onPressed: () => this.callback,
          );
  }
}
