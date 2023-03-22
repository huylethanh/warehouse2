import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/result_set.dart';

import 'services.dart';

class ConditionTypeService {
  final _client = AppClient.create();
  Map<int, List<ConditionType>> cache = <int, List<ConditionType>>{};

  Future<ResultSet<List<ConditionType>?>> getConditionTypes(int irId) async {
    if (cache.containsKey(irId)) {
      return ResultSet.success(cache[irId]!);
    }

    final res = await _client.conditionTypes(irId);

    if (res.isSuccessful) {
      cache[irId] = res.body ?? [];
      return ResultSet.success(cache[irId]!);
    }

    return ResultSet.error(res.error);
  }
}
