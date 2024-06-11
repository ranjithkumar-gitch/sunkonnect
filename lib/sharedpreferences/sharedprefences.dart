import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static SharedPreferences? prefs;

  static void clearUserFromSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();

    prefs!.setString('roleCode', '');
    prefs!.setString('roleCode', '');
    prefs!.setString('roleCode', '');
    prefs!.setString('roleCode', '');
    prefs!.setString('roleCode', '');
    prefs!.setString('roleCode', '');


  } 
   
  //  static void saveLogoutUserInfo(String userFirstName, String userProfileImage) async {
  //   prefs = await SharedPreferences.getInstance();

  //   await prefs!.setString(_keyfirstname, userFirstName);
  //   await prefs!.setString(_keyprofileimage, userProfileImage);
  // }
  


 
  static const _keyloginId = 'loginId';
  static const _keyuserId = 'userId';
  static const _keyname = 'name';
  static const _keyroleCode = 'roleCode';
  static const _keyroleDescription = 'roleDescription';
  static const _keystatus = 'status';
  static const _keyaccessToken = 'acessToken';
  static const _keyrefreshToken = 'refreshToken';
  static const _keyuserObjId = 'userObjId';
  static const _keyisLoggedIn = 'true';
  static const _keypassword = 'password';
  static const _keypasswordtwo = 'passwordtwo';
  static const _keybool = 'true';

 

  static Future init() async => prefs = await SharedPreferences.getInstance();
 
    static Future setloginId(String loginId) async =>
      await prefs!.setString(_keyloginId, loginId);

       static Future setpassword(String password) async =>
      await prefs!.setString(_keypassword, password);

             static Future setpasswordtwo(String passwordtwo) async =>
      await prefs!.setString(_keypasswordtwo, passwordtwo);

    static Future setuserId(String userId) async =>
      await prefs!.setString(_keyuserId, userId);

      static Future setname(String name) async =>
      await prefs!.setString(_keyname, name);

       static Future setroleCode(String roleCode) async =>
      await prefs!.setString(_keyroleCode, roleCode);

      static Future setroleDescription(String roleDescription) async =>
      await prefs!.setString(_keyroleDescription, roleDescription);

      static Future setstatus(String status) async =>
      await prefs!.setString(_keystatus, status);

       static Future setaccessToken(String accessToken) async =>
      await prefs!.setString(_keyaccessToken, accessToken);

       static Future setrefreshToken(String refreshToken) async =>
      await prefs!.setString(_keyrefreshToken, refreshToken);

       static Future setuserObjId(String userObjId) async =>
      await prefs!.setString(_keyuserObjId, userObjId);

    static Future setisLoggedIn(bool isLoggedIn) async =>
      await prefs!.setBool(_keyisLoggedIn, isLoggedIn);

      static Future setStatus(bool status) async =>
      await prefs!.setBool(_keybool, status);




// getters
static String? getloginId() => prefs!.getString(_keyloginId);
static String? getpassword() => prefs!.getString(_keypassword);
static String? getpasswordtwo() => prefs!.getString(_keypasswordtwo);
static String? getuserId() => prefs!.getString(_keyuserId);
static String? getname() => prefs!.getString(_keyname);
static String? getroleCode() => prefs!.getString(_keyroleCode);
static String? getroleDescription() => prefs!.getString(_keyroleDescription);
static String? getstatus() => prefs!.getString(_keystatus);
static String? getaccessToken() => prefs!.getString(_keyaccessToken);
static String? getrefreshToken() => prefs!.getString(_keyrefreshToken);
static String? getuserObjId() => prefs!.getString(_keyuserObjId);
static bool? getisLoggedIn() => prefs!.getBool(_keyisLoggedIn);


static bool? getStatus() => prefs!.getBool(_keybool);

 

 
}
