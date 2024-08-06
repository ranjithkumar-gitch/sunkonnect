

// import 'package:json_annotation/json_annotation.dart';

// @JsonSerializable()
// class EmailFlagupdateRequestModel {
//   bool  flag;
//   String  userId;

//   EmailFlagupdateRequestModel({
//     required this.flag,
//     required this.userId
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'f_sendEmails': flag,
//       'userId':userId,
//     };
//   }
// }

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EmailFlagupdateRequestModel {
  String userId;
  String f_sendEmails;
 

  EmailFlagupdateRequestModel({
    this.userId = "",
    this.f_sendEmails = '',
    
  });
  factory EmailFlagupdateRequestModel.fromJson(
          Map<String, dynamic> json) =>
      _$EmailFlagupdateRequestModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$EmailFlagupdateRequestModelToJson(this);
}

EmailFlagupdateRequestModel
    _$EmailFlagupdateRequestModelFromJson(Map<String, dynamic> json) {
  return EmailFlagupdateRequestModel(
    userId: (json['data'] as String),
    f_sendEmails: (json['data'] as String),
   
  );
}

Map<String, dynamic> _$EmailFlagupdateRequestModelToJson(
        EmailFlagupdateRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'f_sendEmails': instance.f_sendEmails,
      
    };


