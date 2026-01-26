import 'package:flutter/material.dart';

class ChartLabel extends StatelessWidget {
  const ChartLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> _labels = {
      "paid": Color.fromARGB(255, 23, 233, 27),
      "unpaid": Color.fromARGB(255, 233, 23, 23),
      "partialy paid": Color.fromARGB(255, 233, 111, 23),
    };
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        3,
        (index) => LabelsChart(
          _labels.keys.elementAt(index),
          _labels.values.elementAt(index),
        ),
      ),
    );
  }

  LabelsChart(String label, Color color) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(width: 10),
        Text(label, style: TextStyle(fontSize: 20)),
      ],
    );
  }
}
