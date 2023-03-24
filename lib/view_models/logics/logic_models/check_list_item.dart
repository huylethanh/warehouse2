class CheckListItem {
  final String name;
  final String sku;
  final String? imgUrl;
  final int amount;

  final String condition;
  final String searchable;
  final int dataIndex;

  CheckListItem({
    this.name = "",
    this.sku = "",
    this.imgUrl,
    this.amount = 0,
    this.condition = "",
    this.searchable = "",
    this.dataIndex = -1,
  });

  String get amountStrin {
    return amount.toString();
  }

  bool equals(dynamic other) {
    if (other is CheckListItem) {
      return name == other.name &&
          imgUrl == other.imgUrl &&
          amount == other.amount;
    }
    return false;
  }

  bool areItemsTheSame(CheckListItem oldItem, CheckListItem newItem) {
    return oldItem.sku == newItem.sku;
  }

  bool areContentsTheSame(CheckListItem oldItem, CheckListItem newItem) {
    return oldItem == newItem;
  }
}
