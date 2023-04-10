import 'package:warehouse_app/services/picking_service.dart';
import 'package:warehouse_app/services/result_set.dart';

import '../models/models.dart';
import '../models/pick_process_payload.dart';
import '../models/repick_request.dart';

class RepickingService extends PickingService {
  @override
  Future<ResultSet<bool>> finish(int pickId, int sessionId) async {
    final response = await client.finishRepickingUp(
        sessionId, FinishPickingPayload(pickListId: pickId).toJson());

    if (!response.isSuccessful) {
      return ResultSet.success(true);
    }

    return ResultSet.error(response.error);
  }

  Future<ResultSet<PickingPath>> registerRepicTransport(
      String transport) async {
    final response =
        await client.repick(RepickRequest(locationCode: transport).toJson());

    if (!response.isSuccessful) {
      return ResultSet.success(response.body!);
    }

    return ResultSet.error(response.error);
  }

  @override
  Future<ResultSet<PickProcessResponse>> allInBin(
      PickingLocation location) async {
    final payload = PickProcessPayload(
      pickListId: location.pickListId,
      pickSessionId: location.pickSessionId,
      binLocationId: location.binLocationId,
      pickUpLocationId: location.pickUpLocationId,
      productBarcodeId: 0,
      qty: 0,
      storageCode: null,
      isRepick: true,
    );

    final res = await client.pickAllInBin(payload.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }

  @override
  Future<ResultSet<PickProcessResponse>> process(
      PickingLocation location, PickingProduct product) async {
    final payload = PickProcessPayload(
      pickListId: location.pickListId,
      pickSessionId: location.pickSessionId,
      binLocationId: location.binLocationId,
      pickUpLocationId: location.pickUpLocationId,
      productBarcodeId: product.productId,
      qty: product.quantity,
      storageCode: product.serial,
      isRepick: true,
    );

    final res = await client.processPicking(payload.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }

  @override
  Future<ResultSet<PickingPath?>> skip(int pickId, int sessionId,
      PickingLocation location, PickingProduct product) async {
    final request = SkipItemRequest(
      pickSessionId: sessionId,
      binLocationId: location.binLocationId,
      productBarcodeId: product.productId,
      unitId: product.unitId,
      storageCode: null,
      isRepick: true,
    );

    final res = await client.skipPick(pickId, request.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }
}
