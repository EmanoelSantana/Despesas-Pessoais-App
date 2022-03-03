// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, prefer_const_constructors_in_immutables
import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransacitons;

  Chart(this.recentTransacitons);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;
      for (var i = 0; i < recentTransacitons.length; i++) {
        bool sameDay = recentTransacitons[i].date.day == weekDay.day;
        bool sameMonth = recentTransacitons[i].date.month == weekDay.month;
        bool sameYear = recentTransacitons[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransacitons[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + tr.cast()['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr.cast()['day'],
                value: tr.cast()['value'],
                percentage: _weekTotalValue == 0
                    ? 0
                    : tr.cast()['value'] / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
