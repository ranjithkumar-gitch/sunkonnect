import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';

class Passwordupdaterequestmodel {
  String userId;
  String password;
  

  Passwordupdaterequestmodel(
      {required this.userId, required this.password, });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId.trim(),
      'password': password.trim(),
      
    };
    return map;
  }
}