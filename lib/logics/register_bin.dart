import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/metadata_service.dart';

class RegisterBin {
  final _service = MetadataService();

  CheckCodeResponse? registeredBin;

  Future<bool> execute(String code, {bool isPutaway = false}) async {
    final result = await _service.query(code, isPutaway);

    if (result.hasError) {
      return false;
    }

    final response = result.data!;

    final pass = response.physicalType == 2 && response.locationType == 1;
    if (pass) {
      registeredBin = response;
    }

    return pass && registeredBin != null;
  }

  Future<CheckCodeResponse?> checkBin(String code,
      {bool isPutAway = false}) async {
    final result = await _service.query(code, isPutAway);

    if (result.hasError) {
      return null;
    }
    final response = result.data!;

    final pass = response.physicalType == 2 && response.locationType == 1;
    return pass ? response : null;
  }

  void updateBin(CheckCodeResponse newThing) {
    registeredBin = newThing;
  }

  String? current() {
    return registeredBin?.locationCode;
  }

  bool isPickable() {
    return registeredBin?.isPickable == true;
  }

  clear() {
    registeredBin = null;
  }
}
