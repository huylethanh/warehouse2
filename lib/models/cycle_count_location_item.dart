class CycleCountLocationItem {
  int? dataIndex;
  int? cycleCountId;
  int? cycleCountLocationId;
  String? locationCode;
  int totalQty;
  int totalCountingQty;
  int totalDifferentQty;

  CycleCountLocationItem(
    this.dataIndex,
    this.cycleCountId,
    this.cycleCountLocationId,
    this.locationCode,
    this.totalQty,
    this.totalCountingQty,
    this.totalDifferentQty,
  );

  bool areItemsTheSame(
      CycleCountLocationItem oldItem, CycleCountLocationItem newItem) {
    return oldItem.dataIndex == newItem.dataIndex;
  }

  bool areContentsTheSame(
      CycleCountLocationItem oldItem, CycleCountLocationItem newItem) {
    return oldItem == newItem;
  }
}
