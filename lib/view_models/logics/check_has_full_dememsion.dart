import 'package:warehouse_app/mixins/index.dart';
import 'package:warehouse_app/services/metadata_service.dart';

class CheckHasFullDimension with ErrorInvestigator {
  final _medataService = MetadataService();

  final Set _qualifiedProducts = {};

  Future<bool> hasFullDimension(int productId, int unitId) async {
    if (_qualifiedProducts.contains(productId)) {
      return true;
    }

    final result = await _medataService.productDimension(productId, unitId);

    if (result.hasError) {
      investigateError(result.errorMessage, null);
      return false;
    }

    if (result.data!.hasPhysicalData == true) {
      _qualifiedProducts.add(productId);
      return true;
    }

    return false;
  }
}
