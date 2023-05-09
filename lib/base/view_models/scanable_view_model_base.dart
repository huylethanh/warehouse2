import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:warehouse_app/utils/utils.dart';

import '../../screens/views/views.dart';
import '../../widgets/widgets.dart';
import 'view_model_base.dart';

abstract class ScanableViewModelBase extends ViewModelBase {
  String scannedBarcode = "";
  bool gettingCargo = false;
  BroadcastReceiver receiver = BroadcastReceiver(
    names: [
      "com.scanner.broadcast",
    ],
  );

  @mustCallSuper
  ScanableViewModelBase() {
    receiver.start();
  }

  @override
  void dispose() {
    receiver.stop();
    super.dispose();
  }

  void cargoSelectedChanges(bool value) {
    gettingCargo = value;
    notifyListeners();
  }

  Future<void> processInput(BuildContext context, String barcode) async {
    barcode = barcode.trim();

    if (gettingCargo && !barcode.contains("|") && isSku(barcode)) {
      await _inputQuantityDialog(context, barcode.trim());
    } else {
      await scan(context, barcode);
    }

    return;
  }

  Widget? buildInputQuantityDetail() {
    return null;
  }

  Future<void> _inputQuantityDialog(
      BuildContext context, String barCode) async {
    final result = await DialogService.showBottomSheet<int>(context,
        chid: QuantityInput(
          child: buildInputQuantityDetail(),
        ),
        title: "Nhận số lượng cho SKU");

    if (result == null) {
      return;
    }

    await scan(context, "$barCode|$result");
  }

  Future<void> scan(BuildContext context, String barcode) {
    return Future.value();
  }

  bool isSku(String code) {
    return false;
  }

  int? getQuantity(List<String> parts) {
    final quantityString = parts.getOrElse<String>(1, (index) {
      return "1";
    });

    final quantity = int.tryParse(quantityString);
    return quantity;
  }
}
