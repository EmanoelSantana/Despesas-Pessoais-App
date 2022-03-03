// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, non_constant_identifier_names
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, Constraints) {
        return Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              height: Constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('${value.toStringAsFixed(2)}'),
              ),
            ),
            SizedBox(height: Constraints.maxHeight * 0.05),
            Container(
              height: Constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Constraints.maxHeight * 0.05),
            Container(
              height: Constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}
