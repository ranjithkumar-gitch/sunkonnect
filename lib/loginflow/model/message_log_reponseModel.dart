// To parse this JSON data, do
//
//     final messageLogResponseModel = messageLogResponseModelFromJson(jsonString);

import 'dart:convert';

MessageLogResponseModel messageLogResponseModelFromJson(String str) =>
    MessageLogResponseModel.fromJson(json.decode(str));

String messageLogResponseModelToJson(MessageLogResponseModel data) =>
    json.encode(data.toJson());

class MessageLogResponseModel {
  final int? status;
  final String? result;
  final String? response;
  final Data? data;

  MessageLogResponseModel({
    this.status,
    this.result,
    this.response,
    this.data,
  });

  factory MessageLogResponseModel.fromJson(Map<String, dynamic> json) =>
      MessageLogResponseModel(
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
  final int? total;
  final int? totalPages;
  final int? currentPage;
  final int? limit;
  final List<Datum>? data;

  Data({
    this.total,
    this.totalPages,
    this.currentPage,
    this.limit,
    this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
        limit: json["limit"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalPages": totalPages,
        "currentPage": currentPage,
        "limit": limit,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? id;
  final String? datumTicketId;
  final String? ticketObjId;
  final RaisebyObjectId? raisebyObjectId;
  final String? description;
  final List<TicketLogimage>? ticketLogimages;
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
        raisebyObjectId: json["raisebyObjectId"] == null
            ? null
            : RaisebyObjectId.fromJson(json["raisebyObjectId"]),
        description: json["description"],
        ticketLogimages: json["ticketLogimages"] == null
            ? []
            : List<TicketLogimage>.from(json["ticketLogimages"]!
                .map((x) => TicketLogimage.fromJson(x))),
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
        "raisebyObjectId": raisebyObjectId?.toJson(),
        "description": description,
        "ticketLogimages": ticketLogimages == null
            ? []
            : List<dynamic>.from(ticketLogimages!.map((x) => x.toJson())),
        "dateOfLog": dateOfLog,
        "utcDateTime": utcDateTime,
        "ticketID": ticketId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class RaisebyObjectId {
  final String? id;
  final String? name;

  RaisebyObjectId({
    this.id,
    this.name,
  });

  factory RaisebyObjectId.fromJson(Map<String, dynamic> json) =>
      RaisebyObjectId(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class TicketLogimage {
  final String? fileName;
  final String? fileUrl;
  final String? extension;

  TicketLogimage({
    this.fileName,
    this.fileUrl,
    this.extension,
  });

  factory TicketLogimage.fromJson(Map<String, dynamic> json) => TicketLogimage(
        fileName: json["fileName"],
        fileUrl: json["fileUrl"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "fileName": fileName,
        "fileUrl": fileUrl,
        "extension": extension,
      };
}
