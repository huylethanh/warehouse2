import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/client/app_client.dart';
import 'package:warehouse_app/services/models/check_transport_result.dart';
import 'package:warehouse_app/services/result_set.dart';

class MetadataService {
  final _client = AppClient.create();

  Future<ResultSet<CheckTransportResult?>> checkTransportAvailable(
      String code) async {
    final res = await _client.queryCode(code, true, false);

    if (res.isSuccessful) {
      final checkedCode = res.body!;
      return ResultSet.success(CheckTransportResult(
          checkedPhysicalType: checkedCode.physicalType == 1,
          checkedStatus: checkedCode.status == 1));
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool?>> simpleCheck(String code) async {
    final check = await checkTransportAvailable(code);

    if (check.hasError) {
      return ResultSet.error(check.errorMessage);
    }

    return ResultSet.success(
        (check.data!.checkedPhysicalType && check.data!.checkedStatus));
  }

  Future<ResultSet<bool?>> tranferable(String code) async {
    final res = await _client.queryCode(code, true, false);

    if (!res.isSuccessful) {
      return ResultSet.error(res.error);
    }

    final check = res.body!;
    return ResultSet.success((check.physicalType == 1 && check.status == 1) ||
        (check.physicalType == 2 && check.locationType == 1));
  }

  Future<ResultSet<CheckDimensionResponse?>> productDimension(
      int productId, int unitId) async {
    final res = await _client.checkFullDimensionInfo(productId, unitId, true);

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<CheckCodeResponse?>> query(
      String code, bool isPutAway) async {
    final res = await _client.queryCode(code, true, isPutAway);

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }
}
