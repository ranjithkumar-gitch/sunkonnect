// To parse this JSON data, do
//
//     final getticketLogResponseModel = getticketLogResponseModelFromJson(jsonString);

import 'dart:convert';

GetticketLogResponseModel getticketLogResponseModelFromJson(String str) =>
    GetticketLogResponseModel.fromJson(json.decode(str));

String getticketLogResponseModelToJson(GetticketLogResponseModel data) =>
    json.encode(data.toJson());

class GetticketLogResponseModel {
  final int? status;
  final String? result;
  final String? response;
  final List<Datum>? data;

  GetticketLogResponseModel({
    this.status,
    this.result,
    this.response,
    this.data,
  });

  factory GetticketLogResponseModel.fromJson(Map<String, dynamic> json) =>
      GetticketLogResponseModel(
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
  final String? from;
  final String? to;
  final List<String>? cc;
  final String? subject;
  final String? message;
  final String? emailBody;
  final String? generatedId;
  final String? companyObjId;
  final String? customerObjId;
  final String? userObjId;
  final String? startDate;
  final List<String>? loginUser;
  final List<String>? emailIds;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final bool? read;

  Datum({
    this.id,
    this.from,
    this.to,
    this.cc,
    this.subject,
    this.message,
    this.emailBody,
    this.generatedId,
    this.companyObjId,
    this.customerObjId,
    this.userObjId,
    this.startDate,
    this.loginUser,
    this.emailIds,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.read,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        from: json["from"],
        to: json["to"],
        cc: json["cc"] == null
            ? []
            : List<String>.from(json["cc"]!.map((x) => x)),
        subject: json["subject"],
        message: json["message"],
        emailBody: json["emailBody"],
        generatedId: json["generatedId"],
        companyObjId: json["companyObjId"],
        customerObjId: json["customerObjId"],
        userObjId: json["userObjId"],
        startDate: json["startDate"],
        loginUser: json["loginUser"] == null
            ? []
            : List<String>.from(json["loginUser"]!.map((x) => x)),
        emailIds: json["emailIds"] == null
            ? []
            : List<String>.from(json["emailIds"]!.map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        read: json["read"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "from": from,
        "to": to,
        "cc": cc == null ? [] : List<dynamic>.from(cc!.map((x) => x)),
        "subject": subject,
        "message": message,
        "emailBody": emailBody,
        "generatedId": generatedId,
        "companyObjId": companyObjId,
        "customerObjId": customerObjId,
        "userObjId": userObjId,
        "startDate": startDate,
        "loginUser": loginUser == null
            ? []
            : List<dynamic>.from(loginUser!.map((x) => x)),
        "emailIds":
            emailIds == null ? [] : List<dynamic>.from(emailIds!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "read": read,
      };
}
