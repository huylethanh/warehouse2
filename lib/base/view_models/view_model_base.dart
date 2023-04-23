// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:warehouse_app/utils/utils.dart';

import '../../screens/views/views.dart';
import '../../widgets/widgets.dart';

abstract class ViewModelBase extends BaseViewModel {
  bool isProcessing = false;

  bool gettingCargo = false;

  void setProcessing(bool value) {
    isProcessing = value;
    notifyListeners();
  }

  void cargoSelectedChanges(bool value) {
    gettingCargo = value;
    notifyListeners();
  }

  Future<void> processInput(BuildContext context, String barcode) async {
    barcode = barcode.trim();

    if (gettingCargo && !barcode.contains("|") && isSku(barcode)) {
      _inputQuantityDialog(context, barcode.trim());
    } else {
      await scan(context, barcode);
    }

    return;
  }

  Future<void> _inputQuantityDialog(
      BuildContext context, String barCode) async {
    final result = await DialogService.showBottomSheet<int>(context,
        chid: const QuantityInput(), title: "Nhận số lượng cho SKU");

    if (result == null) {
      return;
    }

    scan(context, "$barCode|$result");
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
