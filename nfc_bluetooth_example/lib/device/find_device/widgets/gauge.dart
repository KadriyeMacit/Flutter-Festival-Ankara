import 'package:flutter/material.dart';
import 'package:nfc_bluetooth_example/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GauageWidget extends StatelessWidget {
  const GauageWidget({Key? key, required this.rssi}) : super(key: key);

  final int rssi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
              minimum: -100,
              maximum: -25,
              axisLineStyle: const AxisLineStyle(thickness: 30),
              showTicks: false,
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: rssi.toDouble(),
                  enableAnimation: true,
                  needleStartWidth: 0,
                  needleEndWidth: 5,
                  needleColor: backgroundColor,
                  knobStyle:
                      KnobStyle(color: Colors.white, borderColor: backgroundColor, knobRadius: 0.06, borderWidth: 0.04),
                  tailStyle: TailStyle(color: backgroundColor, width: 5, length: 0.15),
                ),
                RangePointer(value: rssi.toDouble(), width: 30, enableAnimation: true, color: Colors.amber)
              ])
        ],
      ),
    );
  }
}
