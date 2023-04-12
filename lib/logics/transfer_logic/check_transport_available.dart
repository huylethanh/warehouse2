import 'package:warehouse_app/logics/transfer_logic/transfer_logic_base.dart';
import 'package:warehouse_app/services/metadata_service.dart';

class CheckTransportAvailable extends TransferLogicBase {
  final metaService = MetadataService();

  Future<MapEntry<bool, bool>> execute(String code) async {
    final result = await metaService.query(code, false);
    final response = result.data;

    return MapEntry<bool, bool>(
        response?.physicalType == 1, response?.status == 1);
  }

  Future<bool> simpleCheck(String code) async {
    final check = await execute(code);
    return check.key && check.value;
  }

  Future<bool> tranferable(String code) async {
    final result = await metaService.query(code, false);

    final response = result.data;

    return (response?.physicalType == 1 && response?.status == 1) ||
        (response?.physicalType == 2 && response?.locationType == 1);
  }
}
