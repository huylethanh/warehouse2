import 'package:warehouse_app/models/models.dart';

class NewCount {
  final List<CycleCountItem> waiting;
  final List<CycleCountItem> counting;

  NewCount(this.waiting, this.counting);
}
