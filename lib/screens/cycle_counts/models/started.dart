import 'package:warehouse_app/models/models.dart';

class Started {
  late String? location;
  late List<CycleCountItem> waiting;
  late List<CycleCountItem> counting;

  Started(this.location, this.waiting, this.counting);
}
