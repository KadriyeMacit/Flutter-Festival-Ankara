import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:nfc_bluetooth_example/colors.dart';
import 'package:nfc_bluetooth_example/custom_appbar.dart';
import 'package:nfc_bluetooth_example/device/device_list/widgets/search_button.dart';
import 'package:nfc_bluetooth_example/device/device_list/widgets/device_item.dart';
import 'package:nfc_bluetooth_example/device/find_device/find_device_screen.dart';

import '../find_device/find_device_screen.dart';

class DeviceListScreen extends StatelessWidget {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  DeviceListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar('Cihaz Listele'),
      floatingActionButton: SearchButton(),
      body: RefreshIndicator(
        onRefresh: () => flutterBlue.startScan(timeout: const Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<ScanResult>>(
                stream: flutterBlue.scanResults,
                initialData: const [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map(
                        (r) => ScanResultTile(
                          result: r,
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            r.device.connect();
                            return FindDeviceScreen(
                              device: r.device,
                              rssi: r.rssi,
                            );
                          })),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
