import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class SearchButton extends StatelessWidget {
  SearchButton({Key? key}) : super(key: key);

  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: flutterBlue.isScanning,
      initialData: false,
      builder: (c, snapshot) {
        if (snapshot.data!) {
          return FloatingActionButton(
            child: const Icon(
              Icons.stop,
              color: Colors.white,
            ),
            onPressed: () => flutterBlue.stopScan(),
            backgroundColor: Colors.red,
          );
        } else {
          return FloatingActionButton(
              child: const Icon(
                Icons.bluetooth,
                color: Colors.white,
              ),
              onPressed: () => flutterBlue.startScan(timeout: const Duration(seconds: 4)));
        }
      },
    );
  }
}
