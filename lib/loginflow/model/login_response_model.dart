// To parse this JSON data, do
//
//     final loginauth = loginauthFromJson(jsonString);

import 'dart:convert';

Loginauth loginauthFromJson(String str) => Loginauth.fromJson(json.decode(str));

String loginauthToJson(Loginauth data) => json.encode(data.toJson());

class Loginauth {
    final int? status;
    final String? result;
    final String? response;
    final LoginauthData? data;

    Loginauth({
        this.status,
        this.result,
        this.response,
        this.data,
    });

    factory Loginauth.fromJson(Map<String, dynamic> json) => Loginauth(
        status: json["status"],
        result: json["result"],
        response: json["response"],
        data: json["data"] == null ? null : LoginauthData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "response": response,
        "data": data?.toJson(),
    };
}

class LoginauthData {
    final DataData? data;
    final String? accessToken;
    final String? refreshToken;
    final String? userObjId;

    LoginauthData({
        this.data,
        this.accessToken,
        this.refreshToken,
        this.userObjId,
    });

    factory LoginauthData.fromJson(Map<String, dynamic> json) => LoginauthData(
        data: json["data"] == null ? null : DataData.fromJson(json["data"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        userObjId: json["userObjId"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "userObjId": userObjId,
    };
}

class DataData {
    final String? id;
    final String? userId;
    final String? password;
    final String? name;
    final int? emailVerificationCode;
    final int? mobileVerificationCode;
    final List<Rbac>? rbac;
    final String? createdBy;
    final String? status;
    final String? tempPassword;
    final bool? setPswFlag;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final String? modifiedBy;

    DataData({
        this.id,
        this.userId,
        this.password,
        this.name,
        this.emailVerificationCode,
        this.mobileVerificationCode,
        this.rbac,
        this.createdBy,
        this.status,
        this.tempPassword,
        this.setPswFlag,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.modifiedBy,
    });

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        id: json["_id"],
        userId: json["userId"],
        password: json["password"],
        name: json["name"],
        emailVerificationCode: json["emailVerificationCode"],
        mobileVerificationCode: json["mobileVerificationCode"],
        rbac: json["rbac"] == null ? [] : List<Rbac>.from(json["rbac"]!.map((x) => Rbac.fromJson(x))),
        createdBy: json["createdBy"],
        status: json["status"],
        tempPassword: json["tempPassword"],
        setPswFlag: json["setPswFlag"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        modifiedBy: json["modifiedBy"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "password": password,
        "name": name,
        "emailVerificationCode": emailVerificationCode,
        "mobileVerificationCode": mobileVerificationCode,
        "rbac": rbac == null ? [] : List<dynamic>.from(rbac!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "status": status,
        "tempPassword": tempPassword,
        "setPswFlag": setPswFlag,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "modifiedBy": modifiedBy,
    };
}

class Rbac {
    final String? roleCode;
    final String? roleDescription;
    final List<Permission>? permissions;

    Rbac({
        this.roleCode,
        this.roleDescription,
        this.permissions,
    });

    factory Rbac.fromJson(Map<String, dynamic> json) => Rbac(
        roleCode: json["roleCode"],
        roleDescription: json["roleDescription"],
        permissions: json["permissions"] == null ? [] : List<Permission>.from(json["permissions"]!.map((x) => Permission.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "roleCode": roleCode,
        "roleDescription": roleDescription,
        "permissions": permissions == null ? [] : List<dynamic>.from(permissions!.map((x) => x.toJson())),
    };
}

class Permission {
    final String? name;
    final bool? access;
    final String? screenId;
    final String? accessLevel;

    Permission({
        this.name,
        this.access,
        this.screenId,
        this.accessLevel,
    });

    factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        name: json["name"],
        access: json["ACCESS"],
        screenId: json["screenId"],
        accessLevel: json["ACCESS_LEVEL"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "ACCESS": access,
        "screenId": screenId,
        "ACCESS_LEVEL": accessLevel,
    };
}
