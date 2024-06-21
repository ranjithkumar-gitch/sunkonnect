// To parse this JSON data, do
//
//     final getAssignedToListResponseModel = getAssignedToListResponseModelFromJson(jsonString);

import 'dart:convert';

GetAssignedToListResponseModel getAssignedToListResponseModelFromJson(
        String str) =>
    GetAssignedToListResponseModel.fromJson(json.decode(str));

String getAssignedToListResponseModelToJson(
        GetAssignedToListResponseModel data) =>
    json.encode(data.toJson());

class GetAssignedToListResponseModel {
  final int? status;
  final String? result;
  final String? response;
  final Data? data;

  GetAssignedToListResponseModel({
    this.status,
    this.result,
    this.response,
    this.data,
  });

  factory GetAssignedToListResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAssignedToListResponseModel(
        status: json["status"],
        result: json["result"],
        response: json["response"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "response": response,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Datum>? data;

  Data({
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? id;
  final String? userId;
  final String? name;
  final String? password;
  final CompanyId? companyId;
  final UserType? userType;
  final String? mobile;
  final RoleCode? roleCode;
  final Designation? designation;
  final String? description;
  final CreatedBy? createdBy;
  final Status? status;
  final bool? fSendEmails;
  final bool? fEmailTicketCreated;
  final bool? fEmailTicketStatusChange;
  final bool? fEmailTicketReassignment;
  final bool? fEmailAddMessage;
  final bool? setPswFlag;
  final String? userProfileImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? modifiedBy;
  final dynamic branchObjectId;

  Datum({
    this.id,
    this.userId,
    this.name,
    this.password,
    this.companyId,
    this.userType,
    this.mobile,
    this.roleCode,
    this.designation,
    this.description,
    this.createdBy,
    this.status,
    this.fSendEmails,
    this.fEmailTicketCreated,
    this.fEmailTicketStatusChange,
    this.fEmailTicketReassignment,
    this.fEmailAddMessage,
    this.setPswFlag,
    this.userProfileImage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.modifiedBy,
    this.branchObjectId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        password: json["password"],
        companyId: json["companyId"] == null
            ? null
            : CompanyId.fromJson(json["companyId"]),
        userType: userTypeValues.map[json["userType"]]!,
        mobile: json["mobile"],
        roleCode: roleCodeValues.map[json["roleCode"]]!,
        designation: designationValues.map[json["designation"]]!,
        description: json["description"],
        createdBy: createdByValues.map[json["createdBy"]]!,
        status: statusValues.map[json["status"]]!,
        fSendEmails: json["f_sendEmails"],
        fEmailTicketCreated: json["f_emailTicketCreated"],
        fEmailTicketStatusChange: json["f_emailTicketStatusChange"],
        fEmailTicketReassignment: json["f_emailTicketReassignment"],
        fEmailAddMessage: json["f_emailAddMessage"],
        setPswFlag: json["setPswFlag"],
        userProfileImage: json["userProfileImage"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        modifiedBy: json["modifiedBy"],
        branchObjectId: json["branchObjectId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "name": name,
        "password": password,
        "companyId": companyId?.toJson(),
        "userType": userTypeValues.reverse[userType],
        "mobile": mobile,
        "roleCode": roleCodeValues.reverse[roleCode],
        "designation": designationValues.reverse[designation],
        "description": description,
        "createdBy": createdByValues.reverse[createdBy],
        "status": statusValues.reverse[status],
        "f_sendEmails": fSendEmails,
        "f_emailTicketCreated": fEmailTicketCreated,
        "f_emailTicketStatusChange": fEmailTicketStatusChange,
        "f_emailTicketReassignment": fEmailTicketReassignment,
        "f_emailAddMessage": fEmailAddMessage,
        "setPswFlag": setPswFlag,
        "userProfileImage": userProfileImage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "modifiedBy": modifiedBy,
        "branchObjectId": branchObjectId,
      };
}

class CompanyId {
  final Id? id;
  final CompanyName? companyName;

  CompanyId({
    this.id,
    this.companyName,
  });

  factory CompanyId.fromJson(Map<String, dynamic> json) => CompanyId(
        id: idValues.map[json["_id"]]!,
        companyName: companyNameValues.map[json["companyName"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "companyName": companyNameValues.reverse[companyName],
      };
}

enum CompanyName { SUN_KPO }

final companyNameValues = EnumValues({"SUN KPO": CompanyName.SUN_KPO});

enum Id { THE_65_CE0189_D858_A553_CD4_CF10_F }

final idValues = EnumValues(
    {"65ce0189d858a553cd4cf10f": Id.THE_65_CE0189_D858_A553_CD4_CF10_F});

enum CreatedBy {
  SUNKONNECTADMIN_SUNKPO_COM,
  VISHALSUN_PROTONMAIL_COM,
  VISHAL_K_SUNKPO_COM
}

final createdByValues = EnumValues({
  "sunkonnectadmin@sunkpo.com": CreatedBy.SUNKONNECTADMIN_SUNKPO_COM,
  "vishalsun@protonmail.com": CreatedBy.VISHALSUN_PROTONMAIL_COM,
  "vishal.k@sunkpo.com": CreatedBy.VISHAL_K_SUNKPO_COM
});

enum Designation { DIRECTOR, ENGINEER }

final designationValues = EnumValues(
    {"Director": Designation.DIRECTOR, "Engineer": Designation.ENGINEER});

enum RoleCode { COMPANY_ADMIN, COMPANY_USER }

final roleCodeValues = EnumValues({
  "COMPANY ADMIN": RoleCode.COMPANY_ADMIN,
  "COMPANY USER": RoleCode.COMPANY_USER
});

enum Status { ACTIVE }

final statusValues = EnumValues({"ACTIVE": Status.ACTIVE});

enum UserType { COMPANY }

final userTypeValues = EnumValues({"Company": UserType.COMPANY});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
