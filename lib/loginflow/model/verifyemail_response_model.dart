// To parse this JSON data, do
//
//     final verifyEmailresponseModel = verifyEmailresponseModelFromJson(jsonString);

import 'dart:convert';

VerifyEmailresponseModel verifyEmailresponseModelFromJson(String str) =>
    VerifyEmailresponseModel.fromJson(json.decode(str));

String verifyEmailresponseModelToJson(VerifyEmailresponseModel data) =>
    json.encode(data.toJson());

class VerifyEmailresponseModel {
  final int? status;
  final String? result;
  final String? response;
  final List<Datum>? data;

  VerifyEmailresponseModel({
    this.status,
    this.result,
    this.response,
    this.data,
  });

  factory VerifyEmailresponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyEmailresponseModel(
        status: json["status"],
        result: json["result"],
        response: json["response"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "response": response,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
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

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["userId"],
        password: json["password"],
        name: json["name"],
        emailVerificationCode: json["emailVerificationCode"],
        mobileVerificationCode: json["mobileVerificationCode"],
        rbac: json["rbac"] == null
            ? []
            : List<Rbac>.from(json["rbac"]!.map((x) => Rbac.fromJson(x))),
        createdBy: json["createdBy"],
        status: json["status"],
        tempPassword: json["tempPassword"],
        setPswFlag: json["setPswFlag"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
        "rbac": rbac == null
            ? []
            : List<dynamic>.from(rbac!.map((x) => x.toJson())),
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
        permissions: json["permissions"] == null
            ? []
            : List<Permission>.from(
                json["permissions"]!.map((x) => Permission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "roleCode": roleCode,
        "roleDescription": roleDescription,
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x.toJson())),
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
