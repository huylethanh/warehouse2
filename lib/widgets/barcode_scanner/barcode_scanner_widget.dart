import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';

import '../widgets.dart';

class BarcodeScanner extends StatelessWidget {
  final void Function(String barcode) finishScanned;
  final String labelText;
  final String? value;
  final String? Function(String barcode) onBarcodeValueChanges;
  final void Function(bool)? cargoSelectedChanges;
  final bool? cargoSelected;

  const BarcodeScanner(
      {super.key,
      required this.finishScanned,
      required this.labelText,
      required this.onBarcodeValueChanges,
      this.cargoSelectedChanges,
      this.cargoSelected,
      this.value});

  @override
  Widget build(BuildContext context) {
    String scannedValue = value ?? "";

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SplashButtonWidget(
              borderRadius: const Radius.circular(5),
              innerPadding: const EdgeInsets.all(6),
              margin: const EdgeInsets.only(right: 8),
              color: AppColor.colorF79A31,
              child: const Icon(FontAwesomeIcons.barcode),
              onPressed: () {
                scanBarcodeByCamera(context);
              },
            ),
            Expanded(
              child: TextFormField(
                key: Key(scannedValue),
                //   controller: viewModel.controller,
                initialValue: scannedValue,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: labelText,
                  labelStyle: const TextStyle(fontSize: 15),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
                onChanged: (value) {
                  onBarcodeValueChanges(value);
                  scannedValue = value;
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  finishScanned(scannedValue);
                },
                child: const Icon(FontAwesomeIcons.arrowRight))
          ],
        ),
        if (cargoSelectedChanges != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Hàng kiện"),
              CupertinoSwitch(
                onChanged: (bool value) {
                  cargoSelectedChanges!(value);
                },
                value: cargoSelected ?? false,
              ),
            ],
          ),
      ],
    );
  }

  Future<void> scanBarcodeByCamera(BuildContext context) async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      // ignore: use_build_context_synchronously
      finishScanned(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }
}
