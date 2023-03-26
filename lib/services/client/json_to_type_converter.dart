import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:warehouse_app/models/error/error_response.dart';
import 'package:warehouse_app/models/models.dart';
import 'package:warehouse_app/utils/login_reference.dart';
import 'package:warehouse_app/utils/routing.dart';
import 'package:warehouse_app/widgets/responsive_service.dart';

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap = {
    ErrorResponse: (json) => ErrorResponse.fromJson(json),
    AuthResponse: (json) => AuthResponse.fromJson(json),
    ReceiveModel: (json) => ReceiveModel.fromJson(json),
    ConditionType: (json) => ConditionType.fromJson(json),
    InboundResponse: (json) => InboundResponse.fromJson(json),
    ReceiveProduct: (json) => ReceiveProduct.fromJson(json),
    BarcodeObject: (json) => BarcodeObject.fromJson(json),
    ProductAttributes: (json) => ProductAttributes.fromJson(json),
    Attrs: (json) => Attrs.fromJson(json),
    IdResponse: (json) => IdResponse.fromJson(json),
    TaskStatus: (json) => TaskStatus.fromJson(json),
    CurrentReceiveQuantity: (json) => CurrentReceiveQuantity.fromJson(json),
    PutAwaySessionResponse: (json) => PutAwaySessionResponse.fromJson(json),
    CheckCodeResponse: (json) => CheckCodeResponse.fromJson(json),
    CheckDimensionResponse: (json) => CheckDimensionResponse.fromJson(json),
    Inventory: (json) => Inventory.fromJson(json),
  };

  JsonToTypeConverter();

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final res = response.copyWith(
      body: fromJsonData<BodyType, InnerType>(
          response.body, typeToJsonFactoryMap[InnerType]),
    );
    return res;
  }

  @override
  Response convertError<ResultType, ItemType>(Response response) {
    final error = _parseToError(response);
    if (error.code == 'account_being_used') {
      DialogService.showErrorBotToast('account_being_used');
      LoginReference().clearAll().then((value) {
        return AppNavigation.pushReplacementNamed(Routing.login,
            arguments: "account_being_used");
      });
    }

    DialogService.showErrorBotToast(error.errorMessage ?? "Unknown error");
    return response;
  }

  ErrorResponse _parseToError(Response response) {
    final errorJson = response.body;

    final data = errorJson?.toString() ?? "";
    if (data.isEmpty) {
      return ErrorResponse(code: "unknonw", errorMessage: "unknown message");
    }

    final error = json.decode(data);
    return ErrorResponse.fromJson(error);
  }

  @override
  Request convertRequest(Request request) =>
      request.copyWith(body: toJsonData(request.body));

  String toJsonData(Map<String, dynamic> body) {
    final jsonBody = json.encode(body);
    return jsonBody;
  }

  T fromJsonData<T, InnerType>(String jsonData, Function? jsonParser) {
    dynamic jsonMap;

    try {
      jsonMap = json.decode(jsonData);
    } catch (error) {
      jsonMap = {'_id': jsonData};
    }

    if (jsonMap is List) {
      return jsonMap
          .map((item) => (item is! Map<String, dynamic>
              ? item
              : jsonParser == null
                  ? item
                  : jsonParser(item)) as InnerType)
          .toList() as T;
    }

    return jsonMap is! Map<String, dynamic>
        ? jsonMap
        : jsonParser == null
            ? jsonMap
            : jsonParser(jsonMap);
  }
}
