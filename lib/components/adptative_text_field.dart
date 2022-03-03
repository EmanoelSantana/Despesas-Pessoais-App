// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdptativeTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String) onSubmitted;

  const AdptativeTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.onSubmitted,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
