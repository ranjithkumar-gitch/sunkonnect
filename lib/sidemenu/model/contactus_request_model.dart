import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ContactUSRequestModel {

  String userId;
  String emailId;
  String firstName;
  String message;
  String getInTouch;
  String userObjId;
  String roleCode;
  String createdBy;
  String createdByEmail;
  
  ContactUSRequestModel({
    this.userId = "",
    this.emailId = "",
    this.firstName = "",
    this.message = "",
    this.getInTouch = "",
    this.userObjId = "",
    this.roleCode = "",
    this.createdBy = "",
    this.createdByEmail = "",
   
  });
  factory ContactUSRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ContactUSRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUSRequestModelToJson(this);
}

ContactUSRequestModel _$ContactUSRequestModelFromJson(Map<String, dynamic> json) {
  return ContactUSRequestModel(
    userId: (json['data'] as String),
    emailId: (json['data'] as String),
    firstName: (json['data'] as String),
    message: (json['data'] as String),
    getInTouch: (json['data'] as String),
    userObjId: (json['data'] as String),
    roleCode: (json['data'] as String),
    createdBy: (json['data'] as String),
    createdByEmail: (json['data'] as String),
  );
} 

Map<String, dynamic> _$ContactUSRequestModelToJson(ContactUSRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'emailId': instance.emailId,
      'firstName': instance.firstName,
      'message': instance.message,
      'getInTouch': instance.getInTouch,
      'userObjId': instance.userObjId,
      'roleCode': instance.roleCode,
      'createdBy': instance.createdBy,
      'createdByEmail': instance.createdByEmail,
    };


  