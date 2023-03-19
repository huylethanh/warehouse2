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
}
