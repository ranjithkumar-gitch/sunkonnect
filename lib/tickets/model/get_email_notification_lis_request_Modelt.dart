import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GetEmailNotificationListRequestModel {
  String userId;
  String generatedId;
  String startDate;
  String endDate;

  GetEmailNotificationListRequestModel({
    this.userId = "",
    this.generatedId = "",
    this.startDate = "",
    this.endDate = "",
  });
  factory GetEmailNotificationListRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetEmailNotificationListRequestModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$GetEmailNotificationListRequestModelToJson(this);
}

GetEmailNotificationListRequestModel
    _$GetEmailNotificationListRequestModelFromJson(Map<String, dynamic> json) {
  return GetEmailNotificationListRequestModel(
    userId: (json['data'] as String),
    generatedId: (json['data'] as String),
    startDate: (json['data'] as String),
    endDate: (json['data'] as String),
  );
}

Map<String, dynamic> _$GetEmailNotificationListRequestModelToJson(
        GetEmailNotificationListRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'generatedId': instance.generatedId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
