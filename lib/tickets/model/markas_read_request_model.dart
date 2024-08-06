import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MarkasReadRequestModel {
  String userId;
  String generatedId;
  String startDate;
  String endDate;

  MarkasReadRequestModel({
    this.userId = "",
    this.generatedId = "",
    this.startDate = "",
    this.endDate = "",
  });
  factory MarkasReadRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$MarkasReadRequestModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$MarkasReadRequestModelToJson(this);
}

MarkasReadRequestModel
    _$MarkasReadRequestModelFromJson(Map<String, dynamic> json) {
  return MarkasReadRequestModel(
    userId: (json['data'] as String),
    generatedId: (json['data'] as String),
    startDate: (json['data'] as String),
    endDate: (json['data'] as String),
  );
}

Map<String, dynamic> _$MarkasReadRequestModelToJson(
        MarkasReadRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'generatedId': instance.generatedId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
