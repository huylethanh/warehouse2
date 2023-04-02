// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/logics.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/views/views.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import 'helpers/bin_pick_controller.dart';

enum TASK { REG_SINGLE_TRANSPORT, REG_TRANSPORTS, GET_PATH, PROCESS }

class PickingSessionScreenViewModel extends ViewModelBase {
  late ORPicking orPicking;

  final pickController = BinPickController();
  final abortPickingSession = AbortPickingSession();
  final finishPickingUp = FinishPickingUp();
  final getPath = GetPath();
  final checkTransportAvailable = CheckTransportAvailable();
  final registerPickingTransport = RegisterPickingTransport();

  bool gettingCargo = false;

  bool _enoughTransport = false;

  TASK task = TASK.REG_SINGLE_TRANSPORT;

  PickingSessionScreenViewModel(this.orPicking);

  Future<void> processInput(BuildContext context, String barcode) async {
    barcode = barcode.trim();

    if (gettingCargo && !barcode.contains("|") && isSku(barcode)) {
      _inputQuantityDialog(context, barcode.trim());
    } else {
      await scan(context, barcode);
    }
  }

  void cargoSelectedChanges(bool value) {
    gettingCargo = true;
    notifyListeners();
  }

  bool isSku(String code) {
    if (pickController.processing == null) {
      return false;
    }

    final p = pickController.processing;
    return p!.checkSku(code) && !p.isSerial();
  }

  Future<void> scan(BuildContext context, String code) async {
    setBusy(true);

    setBusy(false);
  }

  void set(ORPicking or) {
    orPicking = or;
  }

  resume(PickUpTask task) {
    orPicking = ORPicking(
        id: task.id,
        code: "",
        orderCount: 0,
        productCount: 0,
        sizeName: null,
        createdDate: null,
        numOfTransport: 0,
        priority: 0);

    _enoughTransport = true;
  }

  bool canPickAllInBin() {
    return pickController.processing?.canPickAll == true;
  }

  String currentSku() {
    return pickController.processing?.product.barcode ?? "n/a";
  }

  Future<void> cancel() async {
    task = TASK.REG_SINGLE_TRANSPORT;
    setProcessing(true);

    await abortPickingSession.execute(orPicking.id!);

// might need to go back the list view
    setProcessing(false);
  }

  Future<void> finish() async {
    setProcessing(true);
    task = TASK.PROCESS;

    await finishPickingUp.execute(orPicking.id!, getPath.sessionId());
    // might need to go back the list view

    setProcessing(false);
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

  Future<void> registerTransport(String barcode) async {
    String code = barcode.trim().toUpperCase();

    task = TASK.REG_SINGLE_TRANSPORT;

    final checkTransport = await checkTransportAvailable.simpleCheck(code);
    final regTrasport = registerPickingTransport.register(code);

    if (checkTransport && regTrasport) {
      //  _registerTransport.postValue(Resource.Success(SingleAdded(code)))

      if (registerPickingTransport.count() == orPicking.numOfTransport) {
        setProcessing(true);

        task = TASK.REG_TRANSPORTS;
        await registerPickingTransport.execute(orPicking.id!);

        setProcessing(false);
      }
    } else {
      DialogService.showErrorBotToast(
          "Thiết bị chứa hàng $code không khả dụng");
    }
  }
}
