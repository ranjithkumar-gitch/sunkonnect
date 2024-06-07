import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Loginrequestauth {
  String role;
  String emailId;
  String password;
 

  Loginrequestauth(
      {required this.role,
      required this.emailId,
      required this.password,
     });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "Role": role.toString().trim(),
      'EmailId': emailId.toString().trim(),
      'Password': password.toString().trim(),
      
    };
    return map;
  }
}



