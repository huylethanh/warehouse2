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
}
