import '../../models/models.dart';
import '../../services/metadata_service.dart';

class RegisterSourceTransport {
  final service = MetadataService();

  CheckCodeResponse? registeredSource;
  bool isTransport = false;
  bool isBIN = false;

  Future<bool> execute(String code) async {
    final result = await service.query(code, false);
    final response = result.data;

    isTransport = response?.physicalType == 1 && response?.status == 9;
    isBIN = response?.physicalType == 2 && response?.locationType == 1;
    final isQuickPacking =
        response?.locationType == 7 && response?.physicalType == 1;

    final pass = isTransport || isBIN || isQuickPacking;
    if (pass) registeredSource = response;

    return isTransport || isBIN || isQuickPacking;
  }

  bool isQuickPacking() {
    if (registeredSource?.locationType == 7 &&
        registeredSource?.physicalType == 1) {
      return true;
    }
    return false;
  }

  void updateSource(CheckCodeResponse newCode) {
    registeredSource = newCode;
  }

  String? current() {
    return registeredSource?.locationCode;
  }

  bool isPickable() {
    return registeredSource?.isPickable ?? false;
  }

  clear() {
    registeredSource = null;
  }
}
