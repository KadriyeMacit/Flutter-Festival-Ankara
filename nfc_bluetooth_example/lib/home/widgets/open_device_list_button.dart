import 'package:flutter/material.dart';
import 'package:nfc_bluetooth_example/device/device_list/device_list_screen.dart';

class DeviceListScreenButton extends StatelessWidget {
  const DeviceListScreenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToDeviceListScreen(context),
      child: Container(
        decoration: const BoxDecoration(color: Colors.cyan, shape: BoxShape.circle),
        child: const Padding(
          padding: EdgeInsets.all(50),
          child: Text(
            'Bluetooth',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _goToDeviceListScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeviceListScreen(),
      ),
    );
  }
}
