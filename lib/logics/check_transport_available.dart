import '../services/metadata_service.dart';

class CheckTransportAvailable {
  final _service = MetadataService();

  Future<MapEntry<bool, bool>> execute(String code) async {
    final result = await _service.query(code, false);
    if (result.hasError) {
      return const MapEntry(false, false);
    }

    final response = result.data;

    return MapEntry(response?.physicalType == 1, response?.status == 1);
  }

  Future<bool> simpleCheck(String code) async {
    final check = await execute(code);
    return check.key && check.value;
  }

  Future<bool> tranferable(String code) async {
    final result = await _service.query(code, false);
    if (result.hasError) {
      return false;
    }

    final response = result.data;

    return (response?.physicalType == 1 && response!.status == 1) ||
        (response?.physicalType == 2 && response!.locationType == 1);
  }
}
