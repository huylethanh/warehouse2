import 'package:warehouse_app/models/cycle_count_constain.dart';
import 'package:warehouse_app/models/models.dart';

import '../models/cycle_count_view_model_base.dart';

class DailyVerifyCycleCountScreenViewModel extends CycleCountViewModelBase {
  PartnerCycleCount? partnerDetail;

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
}
