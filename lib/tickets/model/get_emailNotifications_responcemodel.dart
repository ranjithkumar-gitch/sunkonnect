// To parse this JSON data, do
//
//     final getEmailNotifiactonsResponseModel = getEmailNotifiactonsResponseModelFromJson(jsonString);

import 'dart:convert';

GetEmailNotifiactonsResponseModel getEmailNotifiactonsResponseModelFromJson(
        String str) =>
    GetEmailNotifiactonsResponseModel.fromJson(json.decode(str));

String getEmailNotifiactonsResponseModelToJson(
        GetEmailNotifiactonsResponseModel data) =>
    json.encode(data.toJson());

class GetEmailNotifiactonsResponseModel {
  final int? status;
  final String? result;
  final String? response;
  final Data? data;

  GetEmailNotifiactonsResponseModel({
    this.status,
    this.result,
    this.response,
    this.data,
  });

  factory GetEmailNotifiactonsResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetEmailNotifiactonsResponseModel(
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
  final int? total;

  Data({
    this.data,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class Datum {
  final String? id;
  // final From? from;
  // final Bcc? to;
  // final List<Bcc>? cc;
  // final String? subject;
  // final String? message;
  final String? emailBody;
  final String? generatedId;
  // final String? companyObjId;
  // final String? customerObjId;
  // final String? userObjId;
  // final String? startDate;
  // final List<Bcc>? loginUser;
  // final List<Bcc>? emailIds;
  final UserReadStatus? userReadStatus;
  final DateTime? createdAt;
  // final DateTime? updatedAt;
  // final int? v;
  // final Bcc? bcc;

  Datum({
    this.id,
    // // this.from,
    // this.to,
    // this.cc,
    // this.subject,
    // this.message,
    this.emailBody,
    this.generatedId,
    // this.companyObjId,
    // this.customerObjId,
    // this.userObjId,
    // this.startDate,
    // this.loginUser,
    // this.emailIds,
    this.userReadStatus,
    this.createdAt,
    // this.updatedAt,
    // this.v,
    // this.bcc,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        // from: fromValues.map[json["from"]]!,
        // to: bccValues.map[json["to"]]!,
        // cc: json["cc"] == null
        //     ? []
        //     : List<Bcc>.from(json["cc"]!.map((x) => bccValues.map[x]!)),
        // subject: json["subject"],
        // message: json["message"],
        emailBody: json["emailBody"],
        generatedId: json["generatedId"],
        // companyObjId: json["companyObjId"],
        // customerObjId: json["customerObjId"],
        // userObjId: json["userObjId"],
        // startDate: json["startDate"] ?? "",
        // loginUser: json["loginUser"] == null
        //     ? []
        //     : List<Bcc>.from(json["loginUser"]!.map((x) => bccValues.map[x]!)),
        // emailIds: json["emailIds"] == null
        //     ? []
        //     : List<Bcc>.from(json["emailIds"]!.map((x) => bccValues.map[x]!)),
        userReadStatus: json["userReadStatus"] == null
            ? null
            : UserReadStatus.fromJson(json["userReadStatus"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        // updatedAt: json["updatedAt"] == null
        //     ? null
        //     : DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
        // bcc: bccValues.map[json["bcc"]]!,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        // "from": fromValues.reverse[from],
        // "to": bccValues.reverse[to],
        // "cc": cc == null
        //     ? []
        //     : List<dynamic>.from(cc!.map((x) => bccValues.reverse[x])),
        // "subject": subject,
        // "message": message,
        "emailBody": emailBody,
        "generatedId": generatedId,
        // "companyObjId": companyObjId,
        // "customerObjId": customerObjId,
        // "userObjId": userObjId,
        // "startDate": startDate,
        // "loginUser": loginUser == null
        //     ? []
        //     : List<dynamic>.from(loginUser!.map((x) => bccValues.reverse[x])),
        // "emailIds": emailIds == null
        //     ? []
        //     : List<dynamic>.from(emailIds!.map((x) => bccValues.reverse[x])),
        "userReadStatus": userReadStatus?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        // "updatedAt": updatedAt?.toIso8601String(),
        // "__v": v,
        // "bcc": bccValues.reverse[bcc],
      };
}

class UserReadStatus {
  final String? userId;
  final bool? read;
  final String? id;

  UserReadStatus({
    this.userId,
    this.read,
    this.id,
  });

  factory UserReadStatus.fromJson(Map<String, dynamic> json) => UserReadStatus(
        userId: json["userId"],
        read: json["read"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "read": read,
        "_id": id,
      };
}
