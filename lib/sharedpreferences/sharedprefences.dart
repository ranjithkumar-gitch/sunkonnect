import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static SharedPreferences? prefs;

  // static void clearUserFromSharedPrefs() async {
  //   prefs = await SharedPreferences.getInstance();

  //   prefs!.setString('loginId', '');
  //   prefs!.setString('userId', '');
  //   prefs!.setString('name', '');
  //   prefs!.setString('roleCode', '');
  //   prefs!.setString('roleDescription', '');
  //   prefs!.setString('status', '');
  //   prefs!.setString('acessToken', '');

  //   prefs!.setString('refreshToken', '');

  //   prefs!.setString('userObjId', '');

  //   prefs!.setBool('true', '' as bool);

  //   prefs!.setString('password', '');
  //   prefs!.setString('passwordtwo', '');
  //   prefs!.setBool('emailflag',false);

  //    prefs!.setBool('readStatus',false);
    
  // }
   
   static Future<void> clearUserFromSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();

    await prefs!.setString(_keyloginId, '');
    await prefs!.setString(_keyuserId, '');
    await prefs!.setString(_keyname, '');
    await prefs!.setString(_keyroleCode, '');
    await prefs!.setString(_keyroleDescription, '');
    await prefs!.setString(_keystatus, '');
    await prefs!.setString(_keyaccessToken, '');
    await prefs!.setString(_keyrefreshToken, '');
    await prefs!.setString(_keyuserObjId, '');
    await prefs!.setString(_keypassword, '');
    await prefs!.setString(_keypasswordtwo, '');
    await prefs!.setBool(_keyemailflag, false);
    await prefs!.setBool(_keyreadStatus, false);
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
  static const _keyTicketId = 'ticketId';
  static const _keyTicketobjId = 'ticketobjId';
  static const _keyBranchobjId = 'branchtobjId';
  static const _keytitle = 'title';
  static const _keycompanyId = 'companyId';
  static const _keyassignedtoObjectId = 'assignedtoObjectId';
  static const _keycreatedBy = 'createdBy';
 static const _keyaccountCode = 'AccountCode';
 static const _keyprojectCode = 'projectCode';
  static const _keyraisebyObjectID = 'raisebyObjectID';
 static const _keyraisebyObjectName  = 'raisebyObjectName';
  
 static const _keyemailflag = 'emailflag';

 static const _keyreadStatus = 'readStatus';
  
  static const _keyDatumTicketId = 'datumticketid';

  // static const _keybool = 'true';

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

  static Future setTicketId(String setTicketId) async =>
      await prefs!.setString(_keyTicketId, setTicketId);

  static Future setTicketobjId(String setTicketobjId) async =>
      await prefs!.setString(_keyTicketobjId, setTicketobjId);

  static Future setBranchobjId(String setBranchobjId) async =>
      await prefs!.setString(_keyBranchobjId, setBranchobjId);

  static Future setDatumTicketId(String setDatumTicketId) async =>
      await prefs!.setString(_keyDatumTicketId, setDatumTicketId);

 static Future settitle(String settitle) async =>
      await prefs!.setString(_keytitle, settitle);

  static Future setcompanyId(String setcompanyId) async =>
      await prefs!.setString(_keycompanyId, setcompanyId);

static Future setassignedtoObjectId(String setassignedtoObjectId) async =>
      await prefs!.setString(_keyassignedtoObjectId, setassignedtoObjectId);

static Future setcreatedBy(String setcreatedBy) async =>
      await prefs!.setString(_keycreatedBy, setcreatedBy);

static Future setaccountCode(String setaccountCode) async =>
      await prefs!.setString(_keyaccountCode, setaccountCode);

static Future setprojectCode(String setprojectCode) async =>
      await prefs!.setString(_keyprojectCode, setprojectCode);

static Future setraisebyObjectID(String setraisebyObjectID) async =>
      await prefs!.setString(_keyraisebyObjectID, setraisebyObjectID);
  
  static Future setraisebyObjectName(String setraisebyObjectName) async =>
      await prefs!.setString(_keyraisebyObjectName, setraisebyObjectName);


  static Future setisLoggedIn(bool isLoggedIn) async =>
      await prefs!.setBool(_keyisLoggedIn, isLoggedIn);

      static Future setemailFlag(bool emailFlag) async =>
      await prefs!.setBool(_keyemailflag, emailFlag);
      
      static Future setreadStatus(bool readStatus) async =>
      await prefs!.setBool(_keyreadStatus, readStatus);

  // static Future setStatus(bool status) async =>
  //     await prefs!.setBool(_keybool, status);

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
  static String? getTicketId() => prefs!.getString(_keyTicketId);
  static String? getTicketobjId() => prefs!.getString(_keyTicketobjId);
  static String? getDatumTicketId() => prefs!.getString(_keyDatumTicketId);
  static String? getBranchobjId() => prefs!.getString(_keyBranchobjId);
  static String? gettitle() => prefs!.getString(_keytitle);
  static String? getcompanyId() => prefs!.getString(_keycompanyId);
  static String? getassignedtoObjectId() => prefs!.getString(_keyassignedtoObjectId);
  static String? getcreatedBy() => prefs!.getString(_keycreatedBy);
  static String? getaccountCode() => prefs!.getString(_keyaccountCode);
  static String? getprojectCode() => prefs!.getString(_keyprojectCode);
  static String? getraisebyObjectID() => prefs!.getString(_keyraisebyObjectID);
  static String? getraisebyObjectName() => prefs!.getString(_keyraisebyObjectName);

  static bool? getisLoggedIn() => prefs!.getBool(_keyisLoggedIn);

   static bool? getemailFlag() => prefs!.getBool(_keyemailflag);

   
   static bool? getreadStatus() => prefs!.getBool(_keyreadStatus);

  // static bool? getStatus() => prefs!.getBool(_keybool);
}
