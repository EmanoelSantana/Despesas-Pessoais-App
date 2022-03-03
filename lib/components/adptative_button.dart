// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdpatativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const AdpatativeButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed(),
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : ElevatedButton(
            child: Text(label),
            onPressed: onPressed(),
          );
  }
}
