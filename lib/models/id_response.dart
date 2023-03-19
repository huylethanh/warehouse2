import 'package:json_annotation/json_annotation.dart';

part 'id_response.g.dart';

@JsonSerializable()
class IdResponse {
  final int? id;
  final String? name;

  IdResponse({this.id, this.name});

  factory IdResponse.fromJson(Map<String, dynamic> json) =>
      _$IdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IdResponseToJson(this);
}
