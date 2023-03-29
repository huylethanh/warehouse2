import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/logics.dart';

class PickingListScreenViewModel extends ViewModelBase {
  final _getORList = GetORList();
  final List<ORViewItem> sessionList = [];

  init() {
    this.fetchData();
  }

  void fetchData() async {
    setBusy(true);

    sessionList.clear();
    final list = await _getORList.execute();
    sessionList.addAll(list);

    setBusy(false);
  }
}
