import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PayStatusChart extends StatelessWidget {
  const PayStatusChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200,
        child: SfRadialGauge(
          axes: [
            RadialAxis(
              labelOffset: 0,
              pointers: [
                RangePointer(
                  value: 20,
                  cornerStyle: CornerStyle.bothFlat,
                  color: Color.fromARGB(255, 233, 111, 23),
                  width: 30,
                ),
              ],
              axisLineStyle: AxisLineStyle(thickness: 30),
              startAngle: 0,
              endAngle: 0,
              showLabels: false,
              showTicks: false,
              annotations: [
                GaugeAnnotation(
                  widget: Text(
                    "20%",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                ),
              ],
            ),
            RadialAxis(
              pointers: [
                RangePointer(
                  value: 20,
                  cornerStyle: CornerStyle.bothFlat,
                  color: Color.fromARGB(255, 233, 23, 23),
                  width: 30,
                ),
              ],
              startAngle: 120,
              endAngle: 120,
              showLabels: false,
              showTicks: false,
            ),
            RadialAxis(
              pointers: [
                RangePointer(
                  value: 20,
                  cornerStyle: CornerStyle.bothFlat,
                  color: Color.fromARGB(255, 23, 233, 27),
                  width: 30,
                ),
              ],
              startAngle: 240,
              endAngle: 240,
              showLabels: false,
              showTicks: false,
            ),
          ],
        ),
      ),
    );
  }
}
