// To parse this JSON data, do
//
//     final viewMessageLogResponseModel = viewMessageLogResponseModelFromJson(jsonString);

import 'dart:convert';

ViewMessageLogResponseModel viewMessageLogResponseModelFromJson(String str) =>
    ViewMessageLogResponseModel.fromJson(json.decode(str));

String viewMessageLogResponseModelToJson(ViewMessageLogResponseModel data) =>
    json.encode(data.toJson());

class ViewMessageLogResponseModel {
  final int? status;
  final String? result;
  final String? response;
  final List<Datum>? data;

  ViewMessageLogResponseModel({
    this.status,
    this.result,
    this.response,
    this.data,
  });

  factory ViewMessageLogResponseModel.fromJson(Map<String, dynamic> json) =>
      ViewMessageLogResponseModel(
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
  final String? datumTicketId;
  final String? ticketObjId;
  final String? raisebyObjectId;
  final String? description;
  final List<dynamic>? ticketLogimages;
  final String? dateOfLog;
  final String? utcDateTime;
  final String? ticketId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Datum({
    this.id,
    this.datumTicketId,
    this.ticketObjId,
    this.raisebyObjectId,
    this.description,
    this.ticketLogimages,
    this.dateOfLog,
    this.utcDateTime,
    this.ticketId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        datumTicketId: json["ticketId"],
        ticketObjId: json["ticketObjId"],
        raisebyObjectId: json["raisebyObjectId"],
        description: json["description"],
        ticketLogimages: json["ticketLogimages"] == null
            ? []
            : List<dynamic>.from(json["ticketLogimages"]!.map((x) => x)),
        dateOfLog: json["dateOfLog"],
        utcDateTime: json["utcDateTime"],
        ticketId: json["ticketID"],
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
        "ticketId": datumTicketId,
        "ticketObjId": ticketObjId,
        "raisebyObjectId": raisebyObjectId,
        "description": description,
        "ticketLogimages": ticketLogimages == null
            ? []
            : List<dynamic>.from(ticketLogimages!.map((x) => x)),
        "dateOfLog": dateOfLog,
        "utcDateTime": utcDateTime,
        "ticketID": ticketId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
