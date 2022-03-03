// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, unnecessary_null_comparison, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AdpativeDatePicker extends StatelessWidget {
  final DateTime seletecDate;
  final Function(DateTime) onDateChanged;

  AdpativeDatePicker({
    required this.seletecDate,
    required this.onDateChanged,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2022),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    seletecDate == null
                        ? 'Nenhuma data selecionada!'
                        : DateFormat('dd/MM/y').format(seletecDate),
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => _showDatePicker(context),
                ),
              ],
            ),
          );
  }
}
