import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:collection/collection.dart';
import 'package:nfc_bluetooth_example/device/find_device/widgets/gauge.dart';

class FindDeviceGauge extends StatelessWidget {
  FindDeviceGauge({
    Key? key,
    required this.device,
    required this.rssi,
  }) : super(key: key);

  final int rssi;
  final BluetoothDevice device;

  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  int rs = -100;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<List<ScanResult>>(
            stream: flutterBlue.scanResults,
            initialData: const [],
            builder: (c, snapshot) {
              return StreamBuilder(
                stream: flutterBlue.isScanning,
                initialData: false,
                builder: (c, s) {
                  if (s.hasData && s.data == false) {
                    flutterBlue.startScan(timeout: const Duration(milliseconds: 2000));
                  }

                  var item = snapshot.data?.firstWhereOrNull((e) => e.device.id == device.id);

                  if (item != null) {
                    rs = item.rssi;
                  }

                  return Column(
                    children: [
                      const Text(
                        'Ilık',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Soğuk',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          GauageWidget(rssi: rs),
                          const Text(
                            'Sıcak',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            rs.toString(),
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            ' dBm',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            }),
      ],
    );
  }
}
