import 'package:flutter/material.dart';
import 'package:warehouse_app/models/cycle_count_constain.dart';
import 'package:warehouse_app/screens/cycle_counts/models/cycle_count_view_model_base.dart';

class DailyCycleCountScreenViewModel extends CycleCountViewModelBase {
  @override
  Future<void> scan(BuildContext context, String barcode) async {
    await super.scan(context, barcode);

    if (lvSessionId == 0) {
      scanLocationCode(
          barcode: codeScan,
          cycleCountType: DAILY,
          cycleCountId: partnerView.cycleCountId!);
    } else {
      scanSkuCode(codeScan, qty);
    }
  }

  // fun confirmFinish() {
  //     processState.postValue(Resource.Success(CycleCountState.ConfirmFinish))
  // }

  Future<void> getLocations() async {
    //  currentStateUI = CycleCount.LOAD_PARTNER_DETAIL_SATE

    final partner = await partnerUseCase.getPartners(DAILY, CYCLE_COUNT);
    if (partner == null || partner.isEmpty) {
      //   _partnerDetail.postValue(Resource.Success(partnerView.initEmptyPartner()))
      return;
    }

    final partnerDetail =
        await partnerUseCase.getPartnerDetail(partner.first.cycleCountId!);
    partnerView = partnerDetail!.toView();

    //    _partnerDetail.postValue(Resource.Success(partnerDetail))

    //return _partnerDetail;
  }
}
