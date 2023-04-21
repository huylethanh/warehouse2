import 'package:chopper/chopper.dart';
import 'package:warehouse_app/models/models.dart';

import 'chopper_clients.dart';

part 'app_client.chopper.dart';

@ChopperApi(baseUrl: "")
abstract class AppClient extends ChopperService {
  static AppClient create() {
    final client = ChopperClients();
    return _$AppClient(client.client);
  }

  @Get(path: "/checkinSessions")
  Future<Response<List<ReceiveModel>>> checkinSessions(
      @Query("unFinished") bool unFinished);

  @Get(path: "/InboundRequests/{id}/condition-types")
  Future<Response<List<ConditionType>>> conditionTypes(@Path("id") int irId);

  @Get(path: "/InboundRequests/{id}")
  Future<Response<InboundResponse>> inboundRequest(@Path("id") int id);

  @Post(path: "/CheckinSessions/{code}/receive-sessions")
  Future<Response<IdResponse>> receiveCheckInTransport(
      @Path("code") String codeString, @Body() Map<String, dynamic> request);

  @Get(path: "/Users/session")
  Future<Response<TaskStatus>> taskStatus();

  @Get(path: "/InboundRequests/{id}/received-qty/{prodId}/{unitId}")
  Future<Response<CurrentReceiveQuantity>> currentReceiveQuantity(
    @Path("id") int irId,
    @Path("prodId") int productId,
    @Path("unitId") int unitId,
  );

  @Post(path: "/CheckinSessions/{code}/receive-sessions/{id}/finish")
  Future<Response> receiveCheckOutTransport(@Path("code") String code,
      @Path("id") int sessionId, @Body() Map<String, dynamic> request);

  @Post(path: "/CheckinSessions/{code}/receive-sessions/{id}/process")
  Future<Response> receiveCheckProduct(@Path("code") String code,
      @Path("id") int sessionId, @Body() Map<String, dynamic> request);

  @Post(path: "/putaway-sessions")
  Future<Response<PutAwaySessionResponse>> createPutAwaySession(
      @Body() Map<String, dynamic> request);

  @Get(path: "/Locations/{code}")
  Future<Response<CheckCodeResponse?>> queryCode(
      @Path("code") String code,
      @Query("includeRemainingNumOfSKU") bool include,
      @Query("IsPutaway") bool isPutAway);

  @Get(path: "/Products/{id}/dimension")
  Future<Response<CheckDimensionResponse?>> checkFullDimensionInfo(
      @Path("id") int productIdg,
      @Query("unitId") int unitIdg,
      @Query("isVerify") bool verified);

  @Get(path: "/Locations/{code}/inventory")
  Future<Response<Inventory>> checkLocationInfo(
    @Path("code") String code,
    @Query("includeAdvance") bool includeIrCode,
  );

  @Post(path: "/putaway-sessions/{id}/process")
  Future<Response> putAwayProcess(
      @Path("id") int sessionId, @Body() Map<String, dynamic> request);

  @Post(path: "/putaway-sessions/{id}/finish")
  Future<Response> putAwayFinish(@Path("id") int sessionId,
      @Query("finishTransport") bool finishTransport);

  // PICKING
  @Get(path: "/PickLists")
  Future<Response<List<ORPicking>>> pickList();

  @Put(path: "PickLists/{code}/pick-whole")
  Future<Response> finishPicklist(@Path("code") String picklistCode);

  @Get(path: "PickLists/auto-picklist")
  Future<Response<bool>> isAutoPickList();

  @Post(path: "PickLists/auto-picklist")
  Future<Response> submitGetAutoPicklist();

  @Get(path: "/PickLists/{id}/for-picking")
  Future<Response<ORPicking>> orPick(@Path("id") int pickListId);

  @Put(path: "/PickLists/{id}/register-transports")
  Future<Response<PickingPath>> registerTransport(
      @Path("id") int pickListId, @Body() Map<String, dynamic> request);

  @Get(path: "/PickLists/{id}/picking-actions")
  Future<Response<PickingPath>> getPickUpPath(@Path("id") int pickListId);

  @Put(path: "/PickLists/{id}/skip-item")
  Future<Response<PickingPath>> skipPick(
      @Path("id") int pickListId, @Body() Map<String, dynamic> request);

  @Post(path: "/PickLists/pick-item")
  Future<Response<PickProcessResponse>> processPicking(
      @Body() Map<String, dynamic> request);

  @Post(path: "/PickLists/pick-bin")
  Future<Response<PickProcessResponse>> pickAllInBin(
      @Body() Map<String, dynamic> request);

  @Post(path: "/PickLists/repick")
  Future<Response<PickingPath>> repick(@Body() Map<String, dynamic> request);

  @Put(path: "/PickingSessions/{id}/finish")
  Future<Response> finishPickingUp(
      @Path("id") int sessionId, @Body() Map<String, dynamic> request);

  @Get(path: "/Products/{id}/suggested-locations")
  Future<Response<SuggestLocation>> fetchSuggestLocations(
    @Path("id") int productId,
    @Query("unitId") int unitId,
    @Query("conditionTypeId") int conditionTypeId,
  );

  //=============================

  @Put(path: "/PickingSessions/{id}/finish-repick")
  Future<Response> finishRepickingUp(
      @Path("id") int sessionId, @Body() Map<String, dynamic> request);

  //============ TRANSFER =======================================
  @Get(path: "/Transfers/validate-max-quantity")
  Future<Response<int>> checkMaxQuantityQuickPacking(
      @Query("SrcLocationCode") String sourceLocationCode,
      @Query("DestLocationCode") String destLocationCode,
      @Query("ProductBarcodeId") int productBarcodeId);

  @Post(path: "/Locations/{code}/transfer")
  Future<Response<TransferResponse>> startTransferring(
      @Path("code") String locationCode);

  @Post(path: "/Transfers/{id}/register")
  Future<Response> regDest(
      @Path("id") int sessionId, @Body() Map<String, dynamic> request);

  @Post(path: "/Transfers/{id}/process")
  Future<Response> processTransfer(
      @Path("id") int sessionId, @Body() Map<String, dynamic> request);

  @Post(path: "/Transfers/{id}/finish")
  Future<Response> finishTransferring(@Path("id") int sessionId);

  //============ Cycle count =======================================

  @Post(path: "/CycleCounts") //CycleCountSessionRequest
  Future<Response<CycleCountSessionResponse>> startSessionCycleCount(
      @Body() Map<String, dynamic> request);

  @Get(path: "/CountingSessions/{sessionId}/for-counting")
  Future<Response<CycleCountSession>> getProductsCycleCount(
      @Path("sessionId") int sessionId);

  @Post(path: "CountingSessions/{sessionId}/process-item")
  Future<Response> processCount(
      @Path("sessionId") int sessionId, @Body() Map<String, dynamic> request);

  @Post(path: "CountingSessions/{sessionId}/remove-item")
  Future<Response> removeCount(
      @Path("sessionId") int sessionId, @Body() Map<String, dynamic> request);

  @Post(path: "CountingSessions/{sessionId}/finish")
  Future<Response> finishSessionCycleCount(@Path("sessionId") int sessionId);

  @Get(path: "/CycleCounts/partner")
  Future<Response<List<PartnerCycleCount>>> getPartnersCycleCount(
      @Query("cycleCountType") int cycleCountType,
      @Query("roundNumber") int roundNumber);

  @Get(path: "/CycleCounts/partner/{id}/detail")
  Future<Response<PartnerCycleCount>> getPartnerDetailCycleCount(
      @Path("id") int cycleCountId, @Query("roundNumber") int roundNumber);
}
