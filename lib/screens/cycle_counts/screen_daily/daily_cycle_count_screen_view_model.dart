import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/cycle_count_logic/finish_count_logic.dart';
import 'package:warehouse_app/logics/logics.dart';

class DailyCycleCountScreenViewModel extends ViewModelBase {



   override fun scan(barcode: String) {
        viewModelScope.launch(defaultHandler + CoroutineDispatchers.Computing) {
            super.scan(barcode)
            if (lvSessionId == 0L) {
                scanLocationCode(
                    barcode = codeScan,
                    cycleCountType = DAILY,
                    cycleCountId = partnerView.cycleCountId
                )
            } else {
                scanSkuCode(codeScan, qty)
            }
        }
    }

    // fun confirmFinish() {
    //     processState.postValue(Resource.Success(CycleCountState.ConfirmFinish))
    // }

   Future<void>  getLocations() {
        currentStateUI = CycleCount.LOAD_PARTNER_DETAIL_SATE
        _partnerDetail.value = Resource.Loading()
        viewModelScope.launch(defaultHandler + CoroutineDispatchers.Computing) {
            val partner = partnerUseCase.getPartners(DAILY, CYCLE_COUNT)
            if (partner.isEmpty()) {
                _partnerDetail.postValue(Resource.Success(partnerView.initEmptyPartner()))
                return@launch
            }

            val partnerDetail = partnerUseCase.getPartnerDetail(partner.first().cycleCountId)
            partnerView = partnerDetail.toView()
            _partnerDetail.postValue(Resource.Success(partnerDetail))
        }
        return _partnerDetail
    }

}
