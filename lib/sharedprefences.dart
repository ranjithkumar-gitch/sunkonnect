import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static SharedPreferences? prefs;

  static void clearUserFromSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();

    prefs!.setString('roleCode', '');


  } 
   
  //  static void saveLogoutUserInfo(String userFirstName, String userProfileImage) async {
  //   prefs = await SharedPreferences.getInstance();

  //   await prefs!.setString(_keyfirstname, userFirstName);
  //   await prefs!.setString(_keyprofileimage, userProfileImage);
  // }
  


  static const _keyroleCode = 'roleCode';
   static const _keybool = 'true';
 

  static Future init() async => prefs = await SharedPreferences.getInstance();
 
  static Future setroleCode(String roleCode) async =>
      await prefs!.setString(_keyroleCode, roleCode);

      static Future setStatus(bool status) async =>
      await prefs!.setBool(_keybool, status);



   




// getters

  static String? getroleCode() => prefs!.getString(_keyroleCode);
  static bool? getStatus() => prefs!.getBool(_keybool);

 

 
}
