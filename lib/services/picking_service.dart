import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/services/service_base.dart';

import '../models/pick_process_payload.dart';
import '../models/req_transport_request.dart';
import 'result_set.dart';

class PickingService extends ServiceBase {
  Future<ResultSet<List<ORPicking>?>> orList() async {
    final res = await client.pickList();

    if (res.isSuccessful) {
      return ResultSet.success(res.body);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<bool>> abort(int pickId) async {
    return ResultSet.success(false);
  }

  Future<ResultSet<bool>> finish(int pickId, int sessionId) async {
    final response = await client.finishPickingUp(
        sessionId, FinishPickingPayload(pickListId: pickId).toJson());

    if (!response.isSuccessful) {
      return ResultSet.success(true);
    }

    return ResultSet.error(response.error);
  }

  Future<ResultSet<PickingPath?>> getPath(int pickId) async {
    final res = await client.getPickUpPath(pickId);

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<PickingPath?>> registerTransport(
      int pickId, List<String> transports) async {
    final request = RegTransportRequest(locationCodes: transports);

    final res = await client.registerTransport(pickId, request.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<ORPicking?>> singleOr(int pickId) async {
    final res = await client.orPick(pickId);

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }

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
    );

    final res = await client.pickAllInBin(payload.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<PickingPath?>> skip(int pickId, int sessionId,
      PickingLocation location, PickingProduct product) async {
    final request = SkipItemRequest(
        pickSessionId: sessionId,
        binLocationId: location.binLocationId,
        productBarcodeId: product.productId,
        unitId: product.unitId,
        storageCode: null,
        isRepick: false);

    final res = await client.skipPick(pickId, request.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }

  Future<ResultSet<PickProcessResponse>> process(
      PickingLocation location, PickingProduct product) async {
    final payload = PickProcessPayload(
        pickListId: location.pickListId,
        pickSessionId: location.pickSessionId,
        binLocationId: location.binLocationId,
        pickUpLocationId: location.pickUpLocationId,
        productBarcodeId: product.productId,
        qty: product.quantity,
        storageCode: product.serial);

    final res = await client.processPicking(payload.toJson());

    if (res.isSuccessful) {
      return ResultSet.success(res.body!);
    }

    return ResultSet.error(res.error);
  }
}
