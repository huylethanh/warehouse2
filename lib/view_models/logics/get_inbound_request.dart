import 'package:warehouse_app/mixins/error_investagator_mixin.dart';
import 'package:warehouse_app/models/index.dart';
import 'package:warehouse_app/services/index.dart';
import 'package:darq/darq.dart';

class GetInboundRequest with ErrorInvestigator {
  final _service = ReceiveService();

  final unitMap = <String, int>{};
  final List<ProductAttributes> serials = [];

  late InboundResponse originalResponse;

  Future<InboundResponse?> execute(int irId) async {
    final loaded = await _service.fetchInboundRequest(irId);

    if (loaded.hasError) {
      investigateError(loaded.errorMessage, () => {});
      return null;
    }

    originalResponse = loaded.data!;

    unitMap.clear();
    serials.clear();

    final details = originalResponse.detail!;
    for (var i = 0; i < details.length; i++) {
      final product = details[i];

      for (var sku in product.mBarcodes) {
        if (unitMap.containsKey(sku)) {
          continue;
        }

        unitMap[sku] = product.unitId!;
      }

      for (var item in product.attributes!) {
        item = item.copyWith(pIndex: i);
      }

      serials.addAll(product.attributes!);
    }

    return originalResponse;
  }

  int? unitId(String sku) {
    return unitMap[sku];
  }

  List<ProductUnit> units(String sku) {
    final list = originalResponse.detail!
        .where((element) => element.isSku(sku))
        .map((e) => ProductUnit(id: e.unitId, name: e.unitName))
        .toList();

    return list;
  }

  ReceiveProduct? productByIndex(int index) {
    final found = originalResponse.detail?.elementAtOrDefault(index,
        defaultValue: ReceiveProduct(productId: null));
    if (found == null || found.productId == null) {
      return null;
    }

    return found;
  }

  int haveStorageCode(String code) {
    return serials.indexWhere((element) => element.storageCode == code);
  }

  ProductAttributes? productAttribute(int index) {
    if (index < 0) {
      return null;
    }

    final found = serials.elementAtOrDefault(index,
        defaultValue: ProductAttributes(id: null));
    if (found.id == null) {
      return null;
    }

    return found;
  }

  ReceiveProduct? product(int id) {
    return originalResponse.detail!
        .firstWhereOrDefault((value) => value.productId == id);
  }

  removeStorageCode(int index) {
    //        serials.removeAt(index)
  }
}
