import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ForgotPasswordRequestModel {
  String userId;
  String secret;

  ForgotPasswordRequestModel({
    required this.userId,
    required this.secret,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId.toString().trim(),
      'secret': secret.toString().trim(),
    };
    return map;
  }
}
