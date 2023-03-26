import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/services.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/widgets/widgets.dart';

enum Steps {
  tole,
  bin,
  product,
}

class PutAwayScreenViewModel extends ViewModelBase {
  final RegisterTransport registerTransport = RegisterTransport();
  final _service = PutAwayService();
  final transportRuleControl = TransportRuleControl();
  final queryInfoAtLocation = QueryInfoAtLocation();
  final registerBin = RegisterBin();

  int sessionId = 0;
  String? registeredTransportCode = null;

  // check box
  bool gettingCargo = false;
  String scannedBarcode = "";

  OPS operation = OPS.REG_TRANSPORT;
  int total = 0;
  bool isAwaitingSku = false;
  bool cargoSelected = false;
  NewTransport? newTransport;
  CheckCodeResponse? checkCodeResponse;

  Future<void> resume(PutAwayTask task) async {
    setBusy(true);
    operation = OPS.RESUMING;

    registerTransport.resume(task.sessionId!, task.locationCode!);

    final current = await queryInfoAtLocation.stow(task.locationCode!);

    if (current.isEmpty) {
      total = 0;
      registerBin.clear();
      registerTransport.clear();
      transportRuleControl.clear();

      return;
    }

    final checkList = transportRuleControl.perceive(current);

    total = checkList.fold(0, (sum, it) {
      return sum + it.amount;
    });

    newTransport = NewTransport(
        transportCode: task.locationCode,
        total: total,
        checkList: checkList,
        partner: task.partnerName ?? "",
        weight: task.totalWeight != null
            ? "${(task.totalWeight! / 1000).toStringAsFixed(2)} kg"
            : "");

    setBusy(false);
  }

  processInput(BuildContext context, String scannedBarcode) {
    String barcode = scannedBarcode.trim();
    if (gettingCargo && scannedBarcode.contains("|") && _isSku(barcode)) {
      //show quantity dialog
      return;
    }

    scan(barcode);
  }

  void cargoSelectedChanges(bool value) {
    cargoSelected = value;
    notifyListeners();
  }

  bool _isSku(String barcode) {
    return true;
  }

  Future<void> scan(String barcode) async {
    final parts = barcode.split("|");
    final code = parts[0];

    final quantityString = parts.getOrElse<String>(1, (index) {
      return "1";
    });

    final quantity = int.tryParse(quantityString);

    if (quantity == null) {
      DialogService.showErrorBotToast("Mã serial không hợp lệ");
    }

    setProcessing(true);

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

  String getStepMessage() {
    switch (operation) {
      case OPS.REG_TRANSPORT:
        return "Quét thiết bị chứa hàng";

      case OPS.RESUMING:
      case OPS.REG_BIN:
        return "Quét vị trí lưu kho";

      case OPS.PROCESS:
        return "Scan SERIAL/Barcode/Bin/Tote code";

      default:
        throw Exception("not support $operation");
    }
  }

  Future<void> _registerTransport(String code) async {
    final transport = await registerTransport.execute(code);

    if (transport == null) {
      return;
    }

    final session = transport.key;
    final data = transport.value;
    final checkList = transportRuleControl.perceive(data);

    total = checkList.fold(0, (sum, it) {
      return sum + it.amount;
    });

    newTransport = NewTransport(
        transportCode: code,
        total: total,
        checkList: checkList,
        partner: session.partnerName ?? "",
        weight: session.totalWeight != null
            ? "${(session.totalWeight! / 1000).toStringAsFixed(2)} kg"
            : "");

    operation = OPS.REG_BIN;
  }

  Future<void> _registerBin(String code) async {
    final success = await registerBin.execute(code, isPutaway: true);

    if (!success) {
      DialogService.showErrorBotToast("Vị trí lưu kho không đúng");
      return;
    }

    isAwaitingSku = true;

    operation = OPS.PROCESS;

    checkCodeResponse = registerBin.registeredBin;
  }
}
