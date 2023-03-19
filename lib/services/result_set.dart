import 'dart:convert';

import 'package:warehouse_app/models/error/index.dart';

class ResultSet<T> {
  //account_being_used
  final ErrorResponse? errorMessage;
  final T? data;

  ResultSet({this.data, this.errorMessage});

  bool get hasError {
    return errorMessage != null;
  }

  static ResultSet<TSuccess> success<TSuccess>(TSuccess data) {
    return ResultSet<TSuccess>(data: data);
  }

  static ResultSet<TError> error<TError>(Object? errorJson) {
    final data = errorJson?.toString() ?? "";
    if (data.isEmpty) {
      return ResultSet<TError>(
          errorMessage:
              ErrorResponse(code: "unknonw", errorMessage: "unknown message"));
    }

    final error = json.decode(data);
    return ResultSet<TError>(errorMessage: ErrorResponse.fromJson(error));
  }
}
