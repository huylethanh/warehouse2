import 'package:flutter/material.dart';
import 'package:warehouse_app/models/cycle_count_constain.dart';
import 'package:warehouse_app/models/models.dart';
import '../models/cycle_count_view_model_base.dart';

class DailyVerifyCycleCountScreenViewModel extends CycleCountViewModelBase {
  PartnerCycleCount? partnerDetail;

  DailyVerifyCycleCountScreenViewModel() : super(isVerify: true);

  void loadData() async {
    setBusy(true);
    await getLocations();
    setBusy(false);
  }

  void reloadData() async {
    setProcessing(true);
    await getLocations();
    setProcessing(false);
  }

  String getScanMessage() {
    if (started != null) {
      return "Quét mã sản phẩm/Serial/Barcode";
    }

    if (partnerDetail != null) {}

    return "Quét mã vị trí";
  }

  Future<void> getLocations() async {
    final partner = await partnerUseCase.getPartners(DAILY, VERIFY_CYCLE_COUNT);
    if (partner == null || partner.isEmpty) {
      //   _partnerDetail.postValue(Resource.Success(partnerView.initEmptyPartner()))
      return;
    }

    partnerDetail = await partnerUseCase.getPartnerDetail(
        partner.first.cycleCountId!,
        roundNumber: VERIFY_CYCLE_COUNT);
    partnerView = partnerDetail!.toView();
  }

  @override
  Future<void> scan(BuildContext context, String barcode) async {
    super.scan(context, barcode);

    if (lvSessionId == 0) {
      await scanLocationCode(
          cycleCountId: partnerView.cycleCountId ?? 0,
          barcode: codeScan,
          roundNumber: VERIFY_CYCLE_COUNT,
          cycleCountType: DAILY);
    } else {
      await scanSkuCode(context, codeScan, qty);
    }
    setProcessing(false);
  }

  int getQuantityDeviated(int systemQty, int countQty, bool isDeviated) {
    if (isDeviated) {
      return systemQty;
    }

    return (countQty - systemQty).abs();
  }

  bool isDeviatedFirst(CycleCountItem item) {
    return (item.isLotNumber &&
            item.systemLotNumber1 != item.actualLotNumber1 ||
        item.isExpiryDate &&
            (item.systemExpiredDate1 != item.actualExpiredDate1 ||
                item.systemManufactureDate1 != item.actualManufactureDate1));
  }

  bool isDeviatedSecond(CycleCountItem item) {
    return (item.isLotNumber &&
            item.systemLotNumber2 != item.actualLotNumber2 ||
        item.isExpiryDate &&
            (item.systemExpiredDate2 != item.actualExpiredDate2 ||
                item.systemManufactureDate2 != item.actualManufactureDate2));
  }
}
