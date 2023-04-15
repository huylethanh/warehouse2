import 'package:warehouse_app/services/metadata_service.dart';

import '../../models/models.dart';
import '../logic_models/logic_models.dart';

class QueryInfoAtLocation {
  final metaService = MetadataService();

  Inventory? data;

  Future<Inventory?> raw(String locationCode) async {
    final result = await metaService.queryInfo(locationCode);
    return result.data;
  }

  Future<List<StoringProduct>?> listWithIrLocation(String locationCode) async {
    final result =
        await metaService.queryInfo(locationCode, includesIrCode: true);

    return result.data?.items;
  }

  Future<List<StoringProduct>?> list(String locationCode) async {
    return (await raw(locationCode))?.items;
  }

  Future<List<InboundProduct>> stow(String locationCode) async {
    final List<InboundProduct> result = [];

    final original = await list(locationCode);

    for (final it in original!) {
      if (it.serials.isEmpty) {
        result.add(InboundProduct(
            id: it.productBarcodeId,
            productSize: it.productSize ?? "",
            productId: it.productId,
            sku: it.barcode,
            name: it.productName,
            quantity: it.qty,
            image: it.avatarURL,
            serial: null,
            condition: it.storageTypeString(),
            unitId: it.unitId!,
            partnerSku: it.partnerSKU,
            conditionTypeId: int.tryParse(it.conditionTypeId ?? ""),
            partnerName: it.partnerName,
            productBrandId: it.productBrandId,
            productBrandName: it.productBrandName));
      } else {
        for (final serial in it.serials) {
          result.add(InboundProduct(
              id: it.productBarcodeId,
              productSize: it.productSize ?? "",
              productId: it.productId,
              sku: it.barcode,
              name: it.productName,
              quantity: 1,
              image: it.avatarURL,
              serial: serial,
              condition: it.storageTypeString(),
              unitId: it.unitId ?? 0,
              partnerSku: it.partnerSKU,
              conditionTypeId: int.tryParse(it.conditionTypeId ?? ""),
              partnerName: it.partnerName,
              productBrandId: it.productBrandId,
              productBrandName: it.productBrandName));
        }
      }
    }

    return result;
  }

  Future<List<StoringProduct>?> orSort(String locationCode) async {
    final data = await raw(locationCode);
    if (data?.items == null) {
      return null;
    }

    return data!.items!
        .where((it) => it.productType == ProductType.cargo)
        .toList();
  }

  StoringProduct? product(int itemIndex) {
    if (data?.items == null) {
      return null;
    }

    return data!.items![itemIndex];
  }
}
