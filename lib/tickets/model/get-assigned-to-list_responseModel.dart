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
  final List<Datumdata>? data;

  Data({
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datumdata>.from(
                json["data"]!.map((x) => Datumdata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datumdata {
  final String? id;
  final String? userId;
  final String? name;
  final String? password;
  final CompanyId? companyId;
  final String? userType;
  final String? mobile;
  final String? roleCode;
  final String? designation;
  final String? description;
  final String? createdBy;
  final String? status;
  final bool? fSendEmails;
  final bool? fEmailTicketCreated;
  final bool? fEmailTicketStatusChange;
  final bool? fEmailTicketReassignment;
  final bool? fEmailAddMessage;
  final bool? setPswFlag;
  // final dynamic userProfileImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Datumdata({
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
    // this.userProfileImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datumdata.fromJson(Map<String, dynamic> json) => Datumdata(
        id: json["_id"],
        userId: json["userId"],
        name: json["name"],
        password: json["password"],
        companyId: json["companyId"] == null
            ? null
            : CompanyId.fromJson(json["companyId"]),
        userType: json["userType"],
        mobile: json["mobile"],
        roleCode: json["roleCode"],
        designation: json["designation"],
        description: json["description"],
        createdBy: json["createdBy"],
        status: json["status"],
        fSendEmails: json["f_sendEmails"],
        fEmailTicketCreated: json["f_emailTicketCreated"],
        fEmailTicketStatusChange: json["f_emailTicketStatusChange"],
        fEmailTicketReassignment: json["f_emailTicketReassignment"],
        fEmailAddMessage: json["f_emailAddMessage"],
        setPswFlag: json["setPswFlag"],
        // userProfileImage: json["userProfileImage"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "name": name,
        "password": password,
        "companyId": companyId?.toJson(),
        "userType": userType,
        "mobile": mobile,
        "roleCode": roleCode,
        "designation": designation,
        "description": description,
        "createdBy": createdBy,
        "status": status,
        "f_sendEmails": fSendEmails,
        "f_emailTicketCreated": fEmailTicketCreated,
        "f_emailTicketStatusChange": fEmailTicketStatusChange,
        "f_emailTicketReassignment": fEmailTicketReassignment,
        "f_emailAddMessage": fEmailAddMessage,
        "setPswFlag": setPswFlag,
        // "userProfileImage": userProfileImage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CompanyId {
  final String? id;
  final String? companyName;

  CompanyId({
    this.id,
    this.companyName,
  });

  factory CompanyId.fromJson(Map<String, dynamic> json) => CompanyId(
        id: json["_id"],
        companyName: json["companyName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
      };
}
