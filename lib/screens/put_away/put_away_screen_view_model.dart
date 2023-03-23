import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/services/services.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import '../../view_models/logics/register_transport.dart';

class PutAwayScreenViewModel extends ViewModelBase {
  final RegisterTransport registerTransport = RegisterTransport();
  final _service = PutAwayService();

  int sessionId = 0;
  String? registeredTransportCode = null;

  // check box
  bool gettingCargo = false;

  String scannedBarcode = "";
  processInput(BuildContext context, String scannedBarcode) {
    String barcode = scannedBarcode.trim();
    if (gettingCargo && scannedBarcode.contains("|") && _isSku(barcode)) {
      //show quantity dialog
      return;
    }

    scan(barcode);
  }

  bool _isSku(String barcode) {
    return true;
  }

  Future<void> scan(String barcode) async {
    setProcessing(true);

    final parts = barcode.split("|");
    final code = parts[0];

    final quantityString = parts.getOrElse<String>(1, (index) {
      return "1";
    });

    final quantity = int.tryParse(quantityString);

    if (quantity == null) {
      DialogService.showErrorBotToast("Mã serial không hợp lệ");
      setProcessing(false);
    }

    if (registerTransport.current() == null) {
      await _registerTransport(code);
      setProcessing(false);
      return;
    }

    setProcessing(false);

    return Future.value();
  }

  Future<void> _registerTransport(String code) async {
    const operation = OPS.REG_TRANSPORT;

    final result = await _service.registerTransport(code);

    if (result.hasError) {
      investigateError(result.errorMessage, () {
        setProcessing(false);
      });
      return;
    }

    final response = result.data;

    sessionId = response!.sessionId!;
    registeredTransportCode = code;

    final data = response.items;

    /// continue hire
    return Future.value();
  }
}
