import 'models.dart';

class PartnerCycleCountView {
  int? cycleCountId;
  String? partnerName;
  String? partnerCode;
  String? createdDate;
  int? cycleCountType;
  int? totalProduct;
  String? cycleCountCode;
  List<CycleCountLocation>? locationCodes;

  PartnerCycleCountView(
      this.cycleCountId,
      this.partnerName,
      this.partnerCode,
      this.createdDate,
      this.cycleCountType,
      this.totalProduct,
      this.cycleCountCode,
      this.locationCodes);

  bool areItemsTheSame(
      PartnerCycleCountView oldItem, PartnerCycleCountView newItem) {
    return oldItem.cycleCountId == newItem.cycleCountId;
  }

  bool areContentsTheSame(
      PartnerCycleCountView oldItem, PartnerCycleCountView newItem) {
    return oldItem == newItem;
  }

  PartnerCycleCount initEmptyPartner() {
    return PartnerCycleCount(
        cycleCountId: 0,
        cycleCountCode: "",
        cycleCountType: 0,
        partnerCode: "",
        partnerName: "",
        totalProduct: 0,
        createdDate: null,
        cycleCountLocations: []);
  }
}
