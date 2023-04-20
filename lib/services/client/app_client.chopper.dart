// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_client.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AppClient extends AppClient {
  _$AppClient([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AppClient;

  @override
  Future<Response<List<ReceiveModel>>> checkinSessions(bool unFinished) {
    final Uri $url = Uri.parse('/checkinSessions');
    final Map<String, dynamic> $params = <String, dynamic>{
      'unFinished': unFinished
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<ReceiveModel>, ReceiveModel>($request);
  }

  @override
  Future<Response<List<ConditionType>>> conditionTypes(int irId) {
    final Uri $url = Uri.parse('/InboundRequests/${irId}/condition-types');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ConditionType>, ConditionType>($request);
  }

  @override
  Future<Response<InboundResponse>> inboundRequest(int id) {
    final Uri $url = Uri.parse('/InboundRequests/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<InboundResponse, InboundResponse>($request);
  }

  @override
  Future<Response<IdResponse>> receiveCheckInTransport(
    String codeString,
    Map<String, dynamic> request,
  ) {
    final Uri $url =
        Uri.parse('/CheckinSessions/${codeString}/receive-sessions');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<IdResponse, IdResponse>($request);
  }

  @override
  Future<Response<TaskStatus>> taskStatus() {
    final Uri $url = Uri.parse('/Users/session');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TaskStatus, TaskStatus>($request);
  }

  @override
  Future<Response<CurrentReceiveQuantity>> currentReceiveQuantity(
    int irId,
    int productId,
    int unitId,
  ) {
    final Uri $url = Uri.parse(
        '/InboundRequests/${irId}/received-qty/${productId}/${unitId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<CurrentReceiveQuantity, CurrentReceiveQuantity>($request);
  }

  @override
  Future<Response<dynamic>> receiveCheckOutTransport(
    String code,
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse(
        '/CheckinSessions/${code}/receive-sessions/${sessionId}/finish');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> receiveCheckProduct(
    String code,
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse(
        '/CheckinSessions/${code}/receive-sessions/${sessionId}/process');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<PutAwaySessionResponse>> createPutAwaySession(
      Map<String, dynamic> request) {
    final Uri $url = Uri.parse('/putaway-sessions');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<PutAwaySessionResponse, PutAwaySessionResponse>($request);
  }

  @override
  Future<Response<CheckCodeResponse>> queryCode(
    String code,
    bool include,
    bool isPutAway,
  ) {
    final Uri $url = Uri.parse('/Locations/${code}');
    final Map<String, dynamic> $params = <String, dynamic>{
      'includeRemainingNumOfSKU': include,
      'IsPutaway': isPutAway,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<CheckCodeResponse, CheckCodeResponse>($request);
  }

  @override
  Future<Response<CheckDimensionResponse>> checkFullDimensionInfo(
    int productIdg,
    int unitIdg,
    bool verified,
  ) {
    final Uri $url = Uri.parse('/Products/${productIdg}/dimension');
    final Map<String, dynamic> $params = <String, dynamic>{
      'unitId': unitIdg,
      'isVerify': verified,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<CheckDimensionResponse, CheckDimensionResponse>($request);
  }

  @override
  Future<Response<Inventory>> checkLocationInfo(
    String code,
    bool includeIrCode,
  ) {
    final Uri $url = Uri.parse('/Locations/${code}/inventory');
    final Map<String, dynamic> $params = <String, dynamic>{
      'includeAdvance': includeIrCode
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Inventory, Inventory>($request);
  }

  @override
  Future<Response<dynamic>> putAwayProcess(
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('/putaway-sessions/${sessionId}/process');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> putAwayFinish(
    int sessionId,
    bool finishTransport,
  ) {
    final Uri $url = Uri.parse('/putaway-sessions/${sessionId}/finish');
    final Map<String, dynamic> $params = <String, dynamic>{
      'finishTransport': finishTransport
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<ORPicking>>> pickList() {
    final Uri $url = Uri.parse('/PickLists');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<ORPicking>, ORPicking>($request);
  }

  @override
  Future<Response<dynamic>> finishPicklist(String picklistCode) {
    final Uri $url = Uri.parse('PickLists/${picklistCode}/pick-whole');
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<bool>> isAutoPickList() {
    final Uri $url = Uri.parse('PickLists/auto-picklist');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<bool, bool>($request);
  }

  @override
  Future<Response<dynamic>> submitGetAutoPicklist() {
    final Uri $url = Uri.parse('PickLists/auto-picklist');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ORPicking>> orPick(int pickListId) {
    final Uri $url = Uri.parse('/PickLists/${pickListId}/for-picking');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ORPicking, ORPicking>($request);
  }

  @override
  Future<Response<PickingPath>> registerTransport(
    int pickListId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('/PickLists/${pickListId}/register-transports');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PickingPath, PickingPath>($request);
  }

  @override
  Future<Response<PickingPath>> getPickUpPath(int pickListId) {
    final Uri $url = Uri.parse('/PickLists/${pickListId}/picking-actions');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PickingPath, PickingPath>($request);
  }

  @override
  Future<Response<PickingPath>> skipPick(
    int pickListId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('/PickLists/${pickListId}/skip-item');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PickingPath, PickingPath>($request);
  }

  @override
  Future<Response<PickProcessResponse>> processPicking(
      Map<String, dynamic> request) {
    final Uri $url = Uri.parse('/PickLists/pick-item');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PickProcessResponse, PickProcessResponse>($request);
  }

  @override
  Future<Response<PickProcessResponse>> pickAllInBin(
      Map<String, dynamic> request) {
    final Uri $url = Uri.parse('/PickLists/pick-bin');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PickProcessResponse, PickProcessResponse>($request);
  }

  @override
  Future<Response<PickingPath>> repick(Map<String, dynamic> request) {
    final Uri $url = Uri.parse('/PickLists/repick');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PickingPath, PickingPath>($request);
  }

  @override
  Future<Response<dynamic>> finishPickingUp(
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('/PickingSessions/${sessionId}/finish');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<SuggestLocation>> fetchSuggestLocations(
    int productId,
    int unitId,
    int conditionTypeId,
  ) {
    final Uri $url = Uri.parse('/Products/${productId}/suggested-locations');
    final Map<String, dynamic> $params = <String, dynamic>{
      'unitId': unitId,
      'conditionTypeId': conditionTypeId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<SuggestLocation, SuggestLocation>($request);
  }

  @override
  Future<Response<dynamic>> finishRepickingUp(
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('/PickingSessions/${sessionId}/finish-repick');
    final $body = request;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<int>> checkMaxQuantityQuickPacking(
    String sourceLocationCode,
    String destLocationCode,
    int productBarcodeId,
  ) {
    final Uri $url = Uri.parse('/Transfers/validate-max-quantity');
    final Map<String, dynamic> $params = <String, dynamic>{
      'SrcLocationCode': sourceLocationCode,
      'DestLocationCode': destLocationCode,
      'ProductBarcodeId': productBarcodeId,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<int, int>($request);
  }

  @override
  Future<Response<TransferResponse>> startTransferring(String locationCode) {
    final Uri $url = Uri.parse('/Locations/${locationCode}/transfer');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<TransferResponse, TransferResponse>($request);
  }

  @override
  Future<Response<dynamic>> regDest(
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('/Transfers/${sessionId}/register');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> processTransfer(
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('/Transfers/${sessionId}/process');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> finishTransferring(int sessionId) {
    final Uri $url = Uri.parse('/Transfers/${sessionId}/finish');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<CycleCountSessionResponse>> startSessionCycleCount(
      Map<String, dynamic> request) {
    final Uri $url = Uri.parse('/CycleCounts');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client
        .send<CycleCountSessionResponse, CycleCountSessionResponse>($request);
  }

  @override
  Future<Response<CycleCountSession>> getProductsCycleCount(int sessionId) {
    final Uri $url = Uri.parse('/CountingSessions/${sessionId}/for-counting');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CycleCountSession, CycleCountSession>($request);
  }

  @override
  Future<Response<dynamic>> processCount(
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('CountingSessions/${sessionId}/process-item');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> removeCount(
    int sessionId,
    Map<String, dynamic> request,
  ) {
    final Uri $url = Uri.parse('CountingSessions/${sessionId}/remove-item');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> finishSessionCycleCount(int sessionId) {
    final Uri $url = Uri.parse('CountingSessions/${sessionId}/finish');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
