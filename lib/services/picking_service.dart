import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/service_base.dart';

import 'result_set.dart';

class PickingService extends ServiceBase {
  Future<ResultSet<List<ORPicking>?>> orList() async {
    final res = await client.pickList();

    if (res.isSuccessful) {
      return ResultSet.success(res.body);
    }

    return ResultSet.error(res.error);
  }
}
