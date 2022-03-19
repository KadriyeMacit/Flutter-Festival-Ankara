import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:nfc_bluetooth_example/colors.dart';
import 'package:nfc_bluetooth_example/custom_appbar.dart';
import 'package:nfc_bluetooth_example/device/find_device/find_device_gauge.dart';

class FindDeviceScreen extends StatelessWidget {
  const FindDeviceScreen({
    Key? key,
    required this.device,
    required this.rssi,
  }) : super(key: key);

  final int rssi;
  final BluetoothDevice device;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(device.name.isEmpty ? device.id.toString() : device.name.toString()),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Güncel sinyal durumu:',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FindDeviceGauge(
                    device: device,
                    rssi: rssi,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
