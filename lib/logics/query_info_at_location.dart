import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/metadata_service.dart';

import 'logic_models/inbound_product.dart';

class QueryInfoAtLocation {
  Inventory? data;
  final service = MetadataService();

  Future<Inventory?> raw(String locationCode) async {
    final result = await service.queryInfo(locationCode);
    return result.data;
  }

  Future<List<StoringProduct>> listWithIrLocation(String locationCode) async {
    final result = await service.queryInfo(locationCode, includesIrCode: true);

    if (result.hasError) {
      return [];
    }

    return result.data!.items ?? [];
  }

  Future<List<StoringProduct>> list(String locationCode) async {
    final raw = await this.raw(locationCode);

    return raw?.items ?? [];
  }

  Future<List<StoringProduct>> orSort(String locationCode) async {
    final items = await list(locationCode);

    return items.where((it) {
      return it.productType == ProductType.cargo;
    }).toList();
  }

  Future<List<InboundProduct>> stow(String locationCode) async {
    final List<InboundProduct> result = [];

    final original = await list(locationCode);

    for (final it in original) {
      if (it.serials.isEmpty) {
        result.add(InboundProduct(
            id: it.productBarcodeId,
            sku: it.barcode,
            name: it.productName,
            quantity: it.qty,
            image: it.avatarURL,
            serial: null,
            condition: it.storageTypeString()));
      } else {
        for (var serial in it.serials) {
          result.add(InboundProduct(
              id: it.productBarcodeId,
              sku: it.barcode,
              name: it.productName,
              quantity: 1,
              image: it.avatarURL,
              serial: serial,
              condition: it.storageTypeString()));
        }
      }
    }

    return result;
  }

  StoringProduct? product(int itemIndex) {
    if (data == null || data!.items == null) {
      return null;
    }

    return data!.items![itemIndex];
  }
}
