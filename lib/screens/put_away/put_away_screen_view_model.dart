import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/services.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/widgets/widgets.dart';

class PutAwayScreenViewModel extends ViewModelBase {
  final RegisterTransport registerTransport = RegisterTransport();
  final _service = PutAwayService();
  final transportRuleControl = TransportRuleControl();
  final registerBin = RegisterBin();

  int sessionId = 0;
  String? registeredTransportCode = null;

  // check box
  bool gettingCargo = false;
  String scannedBarcode = "";

  OPS operation = OPS.REG_TRANSPORT;
  int total = 0;
  bool isAwaitingSku = false;

  List<NewTransport> newTransports = [];

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

    if (registerBin.current() == null) {
      await _registerBin(code);
      setProcessing(false);
      return;
    }

    setProcessing(false);

    return Future.value();
  }

  Future<void> _registerTransport(String code) async {
    operation = OPS.REG_TRANSPORT;

    final result = await _service.registerTransport(code);

    if (result.hasError) {
      setProcessing(false);
      return;
    }

    final session = result.data;

    sessionId = session!.sessionId!;
    registeredTransportCode = code;

    final data = _transformToListInboundProduct(session.items ?? []);

    final checkList = transportRuleControl.perceive(data);

    total = checkList.fold(0, (sum, it) {
      return sum + it.amount;
    });

    final newTransport = NewTransport(
        transportCode: code,
        total: total,
        checkList: checkList,
        partner: session.partnerName ?? "",
        weight: session.totalWeight != null
            ? "${(session.totalWeight! / 1000).toStringAsFixed(2)} kg"
            : "");

    newTransports.add(newTransport);
  }

  Future<void> _registerBin(String code) async {
    operation = OPS.REG_BIN;

    final success = await registerBin.execute(code, isPutaway: true);

    if (!success) {
      DialogService.showErrorBotToast("Vị trí lưu kho không đúng");
      return;
    }

    isAwaitingSku = true;

    // lam tep cho nay
  }

  List<InboundProduct> _transformToListInboundProduct(
      List<PutAwaySession> original) {
    final List<InboundProduct> result = [];
    for (final pa in original) {
      if (pa.details == null || pa.details!.isEmpty) {
        result.add(_transformInboundProduct(pa, null));
      } else {
        for (var it in pa.details!) {
          result.add(_transformInboundProduct(pa, it.storageCode));
        }
      }
    }
    return result;
  }

  InboundProduct _transformInboundProduct(
      PutAwaySession session, String? serial) {
    return InboundProduct(
        id: session.productBarcodeId,
        sku: session.barcode,
        name: session.productName,
        quantity: serial == null ? session.qty : 1,
        image: session.avatarURL,
        serial: serial,
        condition: session.storageTypeString());
  }
}
