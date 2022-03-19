import 'package:flutter/material.dart';
import 'package:nfc_bluetooth_example/colors.dart';
import 'package:nfc_bluetooth_example/custom_appbar.dart';
import 'package:nfc_bluetooth_example/home/widgets/main_image.dart';
import 'package:nfc_bluetooth_example/home/widgets/blue_button.dart';
import 'package:nfc_bluetooth_example/home/widgets/nfc_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar('Flutter Festival Ankara'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MainImage(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NFCButton(),
                BlueButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
