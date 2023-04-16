import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/widgets.dart';

import '../../logics/transfer_logic/transfer_logic.dart';
import '../../models/models.dart';
import 'models/resume.dart';
import 'models/source_bin_registered.dart';

class TransferScreenViewModel extends ViewModelBase {
  final checkQuantityPacking = CheckQuantityPacking();
  final registerSourceLogic = RegisterSourceTransport();
  final registerDestLocation = RegisterDestLocation();
  final checkTransportAvailable = CheckTransportAvailable();
  final queryLocation = QueryInfoAtLocation();
  final transferBINToBIN = TransferBINToBIN();
  final transferAllBINToBIN = TransferAllBINToBIN();
  final openTransferSession = OpenTransferSession();
  final closeTransportSession = CloseTransportSession();
  final fetchSuggestLocation = GetSuggestLocation();

  SuggestLocation? suggestLocation;
  String? destBin;
  List<StoringProduct> storingProducts = [];
  List<DiffBinTransferSourceProduct> listSourceProduct = [];
  List<String> skus = [];
  int totalCount = 0;
  int processedCount = 0;
  StoringProduct? processingItem;
  String? currentCode;

  Map<int, int> mapsBarcodeQty = {};
  Map<int, List<IrCodeView>> mapsIrCode = {};

  Resume? resumeData;
  SourceBinRegistered? sourceBinRegistered;

  Future<void> loadSuggestLocation(
      int productId, int conditionTypeId, int unitId) async {
    setProcessing(true);
    suggestLocation = await fetchSuggestLocation.fetchSuggestLocations(
        productId, unitId, conditionTypeId);

    setProcessing(false);
  }

  int sessionId() {
    return openTransferSession.sessionId;
  }

  @override
  bool isSku(String code) {
    return destBin != null && skus.contains(code);
  }

  Future<void> resume(TransferTask task) async {
    setProcessing(true);
    openTransferSession.resume(task.sessionId!);

    final src = task.srcLocationCode;
    registerSourceLogic.updateSource(CheckCodeResponse(
        locationId: 0,
        locationCode: src,
        locationType: 0,
        physicalType: 0,
        status: 0,
        maxNumberSKU: 0,
        currentNumberSKU: 0,
        isPickable: false));

    destBin = task.dstLocationCode;

    final list = await queryLocation.listWithIrLocation(task.srcLocationCode!);

    for (final it in list!) {
      // collecting list of non-serial SKUs
      if (it.serials.isEmpty) {
        skus.add(it.barcode!);
      }

      totalCount += it.qty ?? 0;
      listSourceProduct.add(it.toViewBinTransferProduct());

      mapsBarcodeQty[it.productBarcodeId!] = it.qty!;

      if (it.advances != null && it.advances!.isNotEmpty) {
        final List<IrCodeView> listIrTemp = [];

        final advancesSort = it.advances!
            .map((irs) => irs.toView())
            .orderBy((view) => view.qty)
            .toList();

        for (final ir in advancesSort) {
          if (ir.irCode != null && ir.irCode != "n/a" && ir.irCode != "N/A") {
            listIrTemp.add(ir);
          }
        }

        mapsIrCode[it.productBarcodeId!] = listIrTemp;
      }
    }

    storingProducts.addAll(list);

    resumeData = Resume(
      src!,
      totalCount,
      destBin,
      list.isEmpty,
      listSourceProduct,
    );

    setProcessing(false);
  }

  Future<void> close() async {
    setProcessing(true);

    await closeTransportSession.execute(sessionId());
    openTransferSession.close();

    // TODO: debug to see
    //_process.postfinalue(Resource.Success(StartOver))

    setProcessing(false);
  }

  Future<void> moveAll() async {
    setProcessing(true);
    final destLocation = destBin ?? "n/a";
    transferAllBINToBIN.execute(
        sessionId(), registerSourceLogic.current() ?? "n/a", destLocation);

    final skuCount = storingProducts.length;
    final total = storingProducts.fold(0, (current, each) {
      return current + each.qty!;
    });

    cleanData();

    setProcessing(false);

    // TODO: debug to see
    //  _process.postfinalue(Resource.Success(AllOut(skuCount, total, destLocation)))
  }

  @override
  Future<void> scan(BuildContext context, String barcode) async {
    final normalize = barcode.trim();

    final parts = normalize.split("|");
    // get code
    final code = parts[0];
    // get quantity, default to 1

    final quantityString = parts.getOrElse<String>(1, (index) {
      return "1";
    });

    final quantity = int.tryParse(quantityString);

    if (quantity == null) {
      DialogService.showErrorBotToast("Dữ liệu không hợp lệ");
      return;
    }

    if (openTransferSession.sessionId == 0) {
      await registerSource(code);
      return;
    }

    if (destBin == null) {
      if (code == registerSourceLogic.current()) {
        DialogService.showErrorBotToast("Mã vị trí không hợp lệ");
        //  _process.finalue = Resource.Error(getString(R.string.err_infinalid_location))
        return;
      }
      registerDestination(code);
      return;
    }

    final isAwaitingSerial = processingItem != null;

    if (!isAwaitingSerial && code == registerSourceLogic.current()) {
      //TODO: run here
      // _process.finalue = Resource.Success(
      //     MoveAll(
      //         registerSource.current() ?: "n/a", destBin ?: "n/a",
      //         emptyList()
      //     )
      // )
      return;
    }

    if (isAwaitingSerial) {
      lookForSerial(code);
    } else {
      process1(code, quantity);
    }
  }

  Future<void> process1(String code, int quantity) async {
    StoringProduct? found = storingProducts.firstWhereOrDefault(
        (it) => it.barcode == code || it.serials.contains(code));

    if (found == null) {
      final check = await checkTransportAvailable.tranferable(code);
      if (code != destBin && check) {
        // _process.postValue(Resource.Success(NewDestLocation(code)))
        // return@launch
      } else {
        //throw Exception(getString(R.string.err_product_not_found))
        DialogService.showErrorBotToast("Không tìm thấy sản phẩm");
        return;
      }
    }

    if (found!.barcode == code) {
      if (found.serials.isEmpty) {
        if (quantity > found.qty!) {
          //  throw Exception(getString(R.string.txt_transfer_err_3))
          DialogService.showErrorBotToast(
              "Số lượng sản phẩm cần luân chuyển lớn hơn số lượng có trong vị trí nguồn");
          return;
        } else {
          process(found, quantity, null);
        }
      } else {
        processingItem = found;
        // _process.postValue(Resource.Success(AskForSerial(found)))
        return;
      }
    } else {
      await process(found, 1, code);
    }
  }

  Future<void> lookForSerial(String code) async {
    if (processingItem == null) {
      return;
    }

    final index =
        processingItem!.serials.indexWhere((serial) => serial == code);
    if (index > -1) {
      process(processingItem!, 1, code);
    } else {
      DialogService.showErrorBotToast(
          "Serial không tồn tại trong vị trí nguồn");
    }
  }

  Future<void> process(
      StoringProduct product, int quantity, String? serial) async {
    if (registerSourceLogic.current() == null) {
      return;
    }

    if (this.destBin == null) {
      return;
    }
    final srcBin = registerSourceLogic.current();
    final destBin = this.destBin;

    if (registerSourceLogic.isQuickPacking()) {
      final quantityPacking = await checkQuantityPacking.execute(
          srcBin!, destBin!, product.productBarcodeId!);

      if (quantityPacking == 0) {
        DialogService.showErrorBotToast("Không thể luân chuyển");
        return;
      }
    }

    final p = TransferProduct(
        productId: product.productBarcodeId,
        sku: product.barcode,
        serial: serial);
    await transferBINToBIN.execute(sessionId(), srcBin!, destBin!, p, quantity);

    processingItem = null;
    int qty = product.qty!;
    if (serial == null) {
      qty -= quantity;
      product = product.copyWith(qty: qty);

      if (product.qty == 0) {
        storingProducts.remove(product);
        skus.remove(product.barcode);
      }
    } else {
      qty -= 1;
      product = product.copyWith(qty: qty);
      product.serials.remove(serial);

      if (product.serials.isEmpty) {
        storingProducts.remove(product);
      }
    }

    processedCount += quantity;
    final remain = totalCount - processedCount;

    if (storingProducts.isEmpty) {
      //TODOrun here
      // _process.postfinalue(
      //     Resource.Success(
      //         AllOutLast(
      //             product,
      //             quantity,
      //             destBin,
      //             serial,
      //             emptyList()
      //         )
      //     )
      // )
    } else {
      newTransferUpdateList(product, quantity);

//TODOrun here
      // _process.postfinalue(
      //     Resource.Success(
      //         OK(
      //             product,
      //             quantity,
      //             destBin,
      //             serial,
      //             "$remain/ $totalCount",
      //             listSourceProduct
      //         )
      //     )
      // )
    }
  }

  newTransferUpdateList(StoringProduct product, int quantity) {
    final srcProduct = product.toViewBinTransferProduct();
    final qty = mapsBarcodeQty[srcProduct.productBarcodeId]! - quantity;

    if (listSourceProduct.contains(srcProduct)) {
      if (qty == 0) {
        listSourceProduct.removeAt(listSourceProduct.indexOf(srcProduct));
      } else {
        final index = listSourceProduct.indexOf(srcProduct);
        final listIrTemp =
            mapsIrCode[listSourceProduct[index].productBarcodeId];

        if (listIrTemp != null &&
            listIrTemp.isNotEmpty &&
            listIrTemp[0].irCode != null) {
          final irCode = listIrTemp[0].irCode;
          final qtyIr = listIrTemp[0].qty ?? 0;
          listIrTemp.removeAt(0);

          if (qtyIr - quantity > 0) {
            listIrTemp.insert(
                0, IrCodeView(irCode: irCode, qty: qtyIr - quantity));
          }

          listSourceProduct[index] =
              srcProduct.copyWith(qty: qty, advances: listIrTemp);
        } else {
          listSourceProduct[index] = srcProduct.copyWith(qty: qty);
        }
        mapsBarcodeQty[srcProduct.productBarcodeId!] = qty;
      }
    }
  }

  Future<void> registerSource(String code) async {
    cleanData();
    final registered = await registerSourceLogic.execute(code);
    if (registered) {
      final listProduct = await queryLocation.listWithIrLocation(code);

      if (listProduct == null || listProduct.isEmpty) {
        //throw Exception(getString(R.string.txt_transfer_err, code))

        DialogService.showErrorBotToast(
            "Không có sản phẩm trong vị trí nguồn $code");
        return;
      }

      int pendingOut = 0;

      for (final it in listProduct) {
        // count pendingOut
        pendingOut += it.pendingOutQty ?? 0;
        // collecting list of non-serial SKUs
        if (it.serials.isEmpty) {
          skus.add(it.barcode!);
        }
        totalCount += it.qty ?? 0;

        listSourceProduct.add(it.toViewBinTransferProduct());

        mapsBarcodeQty[it.productBarcodeId!] = it.qty!;

        if (it.advances != null && it.advances!.isNotEmpty) {
          final List<IrCodeView> listIrTemp = [];
          final advancesSort = it.advances!
              .map((irs) => irs.toView())
              .orderBy((view) => view.qty)
              .toList();

          for (final ir in advancesSort) {
            if (ir.irCode != null && ir.irCode != "n/a" && ir.irCode != "N/A") {
              listIrTemp.add(ir);
            }
          }
          mapsIrCode[it.productBarcodeId!] = listIrTemp;
        }
      }

//                if (registerSource.isPickable()) {
//
//                    if (pendingOut > 0) {
//                        cleanData()
//                        throw Exception(getString(R.string.txt_transfer_err_2))
//                    }
//                }

      await openTransferSession.execute(code);

      storingProducts.addAll(listProduct);
      SourceBinRegistered(code, totalCount, listSourceProduct);

//TODO run here
      // _process.postfinalue(
      //     Resource.Success(
      //         SourceBinRegistered(
      //             code,
      //             totalCount,
      //             listSourceProduct
      //         )
      //     )
      // )
    } else {
      //throw Exception(getString(R.string.err_infinalid_location))
      DialogService.showErrorBotToast("Mã vị trí không hợp lệ");
    }
  }

  Future<void> confirmNewDestination(String code) async {
    await registerDestination(code);
  }

  Future<void> registerDestination(String bin) async {
    setProcessing(true);

    await registerDestLocation.execute(openTransferSession.sessionId, bin);
    destBin = bin;

    setProcessing(false);
    // TODO: debug to see
    //    _process.postfinalue(Resource.Success(DestBinRegistered(bin)))
  }

  String getPartnerSku(String barcode) {
    final item = listSourceProduct.firstWhereOrDefault(
        (it) => it.barcode!.toUpperCase() == barcode.toUpperCase());
    return item?.partnerSku ?? "N/A";
  }

  void cleanData() {
    processedCount = 0;
    totalCount = 0;
    destBin = null;
    registerSourceLogic.clear();
    skus.clear();
    storingProducts.clear();
    listSourceProduct.clear();
    mapsBarcodeQty.clear();
    mapsIrCode.clear();
  }

  String getIrCode(DiffBinTransferSourceProduct item) {
    String irCode = "";
    if (item.advances != null) {
      for (final it in item.advances!) {
        String qty = (it.qty ?? 0).toRadixString(2);
        if (it.irCode != null && it.irCode != "N/A" && it.irCode != "n/a") {
          irCode += "${it.irCode} - Số lượng : ${qty}";
        } else {
          irCode = "";
        }
      }
    }

    return irCode;
  }
}
