// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:warehouse_app/models/cycle_count_constain.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/screens/cycle_counts/models/cycle_count_view_model_base.dart';

class DailyCycleCountScreenViewModel extends CycleCountViewModelBase {
  PartnerCycleCount? partnerDetail;

  @override
  Future<void> scan(BuildContext context, String barcode) async {
    await super.scan(context, barcode);

    if (lvSessionId == 0) {
      scanLocationCode(
          barcode: codeScan,
          cycleCountType: DAILY,
          cycleCountId: partnerView.cycleCountId!);
    } else {
      scanSkuCode(context, codeScan, qty);
    }
  }

  void loadData() {
    getLocations();
  }

  // fun confirmFinish() {
  //     processState.postValue(Resource.Success(CycleCountState.ConfirmFinish))
  // }

  String getScanMessage() {
    if (started != null) {
      return "Quét mã sản phẩm/Serial/Barcode";
    }

    if (partnerDetail != null) {}

    return "Quét mã vị trí";
  }

  Future<void> getLocations() async {
    setBusy(true);
    final partner = await partnerUseCase.getPartners(DAILY, CYCLE_COUNT);
    if (partner == null || partner.isEmpty) {
      //   _partnerDetail.postValue(Resource.Success(partnerView.initEmptyPartner()))
      return;
    }

    partnerDetail =
        await partnerUseCase.getPartnerDetail(partner.first.cycleCountId!);
    partnerView = partnerDetail!.toView();

    setBusy(false);
  }
}
