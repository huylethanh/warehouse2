import 'package:darq/darq.dart';
import 'package:warehouse_app/services/services.dart';

import '../models/models.dart';
import '../screens/picking/models/A_pick.dart';

class GetRepickPath {
  final _service = RepickingService();

  final Map<int, PickProduct> productMap = {};
  final List<PickingBin> path = [];

  PickingPath? data;
  int outCount = 0;

  Future<ORPicking?> execute(int pickId) async {
    path.clear();
    productMap.clear();

    final result = await _service.getPath(pickId);
    if (result.hasError) {
      return null;
    }

    final it = result.data!;
    data = it;
    int count = 0;

    for (final p in it.products!) {
      productMap[p.productBarcodeId!] = p;
    }

    for (final bin in it.bins!) {
      for (final item in bin.pickList!) {
        count += item.quantity!;
      }
    }

    path.addAll(it.bins!);

    outCount = it.numOfItem! - count;

    return ORPicking(
        id: it.pickListId,
        code: it.pickListCode,
        orderCount: it.numOfOR,
        productCount: it.numOfItem,
        sizeName: it.sizeName,
        createdDate: it.createdDate,
        numOfTransport: 0,
        priority: it.priority);
  }

  Future<ORPicking> execute2(PickingPath pp) {
    path.clear();
    productMap.clear();

    data = pp;
    int count = 0;

    for (final p in pp.products!) {
      productMap[p.productBarcodeId!] = p;
    }

    for (final bin in pp.bins!) {
      for (final item in bin.pickList!) {
        count += item.quantity!;
      }
    }

    path.addAll(pp.bins!);

    outCount = pp.numOfItem! - count;

    final or = ORPicking(
      id: pp.pickListId,
      code: pp.pickListCode,
      orderCount: pp.numOfOR,
      productCount: pp.numOfItem,
      numOfTransport: 0,
      sizeName: pp.sizeName,
      createdDate: pp.createdDate,
      priority: pp.priority,
    );

    return Future.value(or);
  }

  bool hasNext() {
    return path.isNotEmpty;
  }

  List<APick> next() {
    final bin = path.removeAt(0);

    final List<APick> result = [];

    final picks =
        bin.pickList!.orderBy((element) => element.locationIndex!).toList();

    for (final pick in picks) {
      result.add(APick(
          binId: bin.id!,
          bin: bin.bin!,
          canPickAll: bin.canPickAll ?? false,
          transport: PickingTransport(
              id: pick.locationId,
              index: pick.locationIndex,
              code: pick.locationCode),
          product: (productMap[pick.productId] ?? PickProduct.dummy()).copyWith(
              quantity: pick.quantity,
              storageCodes: pick.storageCodes,
              unitId: pick.unitId)));
    }

    return result;
  }

  int sessionId() {
    return data?.pickSessionId ?? 0;
  }
}
