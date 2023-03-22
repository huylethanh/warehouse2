import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:warehouse_app/models/error/error_response.dart';
import 'package:warehouse_app/models/models.dart';

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
    return response;
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
