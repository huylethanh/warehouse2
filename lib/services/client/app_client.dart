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
  Future<Response<PickingPath>> registerTransport(@Path("id") int pickListId,
      @Body() Map<String, dynamic> request); // body: RegTransportRequest

  @Get(path: "/PickLists/{id}/picking-actions")
  Future<Response<PickingPath>> getPickUpPath(@Path("id") int pickListId);

  @Put(path: "/PickLists/{id}/skip-item")
  Future<Response<PickingPath>> skipPick(@Path("id") int pickListId,
      @Body() Map<String, dynamic> request); // @Body body: SkipItemRequest

  @Post(path: "/PickLists/pick-item")
  Future<Response<PickProcessResponse>> processPicking(
      @Body() Map<String, dynamic> request); //@Body body: PickProcessPayload);

  @Post(path: "/PickLists/pick-bin")
  Future<Response<PickProcessResponse>> pickAllInBin(
      @Body() Map<String, dynamic> request); //@Body body: PickProcessPayload);

  @Post(path: "/PickLists/repick")
  Future<Response<PickingPath>> repick(
      @Body() Map<String, dynamic> request); //@Body body: RepickRequest);

  @Put(path: "/PickingSessions/{id}/finish")
  Future<Response> finishPickingUp(
      @Path("id")
          int sessionId,
      @Body()
          Map<String, dynamic> request); // @Body body: FinishPickingPayload);
}
