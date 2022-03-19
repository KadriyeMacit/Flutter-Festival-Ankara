import 'package:flutter/material.dart';
import 'package:nfc_bluetooth_example/colors.dart';
import 'package:nfc_bluetooth_example/custom_appbar.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCReader extends StatefulWidget {
  const NFCReader({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NFCReaderState();
}

class NFCReaderState extends State<NFCReader> {
  final ValueNotifier<dynamic> _result = ValueNotifier(null);
  final NfcManager _nfcManager = NfcManager.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar('NFC Kart'),
      body: FutureBuilder<bool>(
        future: NfcManager.instance.isAvailable(),
        builder: (context, ss) => ss.data != true
            ? Center(child: Text('NfcManager.isAvailable(): ${ss.data}'))
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ValueListenableBuilder<dynamic>(
                            valueListenable: _result,
                            builder: (context, value, _) => Text('${value ?? 'Veri yok'}'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                          child: const Text(
                            'Oku',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _tagRead),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void _tagRead() {
    _nfcManager.startSession(onDiscovered: (NfcTag tag) async {
      _result.value = tag.data;
      _nfcManager.stopSession();
    });
  }
}
