import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Loginrequestauth {
  String userId;
  String password;

  Loginrequestauth({
    required this.userId,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId.toString().trim(),
      'password': password.toString().trim(),
    };
    return map;
  }
}
