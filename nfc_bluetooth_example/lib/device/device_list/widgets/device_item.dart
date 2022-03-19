import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:nfc_bluetooth_example/device/device_list/widgets/device_item_title.dart';

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({Key? key, required this.result, required this.onTap}) : super(key: key);

  final ScanResult result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DeviceItemTitle(
                result: result,
              ),
              ElevatedButton(
                child: const Text('Cihaz bul',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(primary: Colors.purple.shade400),
                onPressed: (result.advertisementData.connectable) ? onTap : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
