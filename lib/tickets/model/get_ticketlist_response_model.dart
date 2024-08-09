// To parse this JSON data, do
//
//     final getTicketListResponseModel = getTicketListResponseModelFromJson(jsonString);

import 'dart:convert';

GetTicketListResponseModel getTicketListResponseModelFromJson(String str) =>
    GetTicketListResponseModel.fromJson(json.decode(str));

String getTicketListResponseModelToJson(GetTicketListResponseModel data) =>
    json.encode(data.toJson());

class GetTicketListResponseModel {
  final int? status;
  final String? result;
  final String? response;
  final Data? data;

  GetTicketListResponseModel({
    this.status,
    this.result,
    this.response,
    this.data,
  });

  factory GetTicketListResponseModel.fromJson(Map<String, dynamic> json) =>
      GetTicketListResponseModel(
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
  final String? ticketId;
  final String? title;
  final String? accountCode;
  final String? projectCode;
  final ObjectId? raisebyObjectId;
  final CustomerId? customerId;
  final CompanyId? companyId;
  final BranchObjectId? branchObjectId;
  final String? description;
  final dynamic requestedBy;
  final int? daysOpen;
  final String? category;
  final String? severity;
  final String? startDate;
  final String? status;
  final List<Image>? images;
  final String? createdBy;
  final String? utcTime;
  final DateTime? createdAt;
  final DateTime? latestCreatedAt;

  final DateTime? updatedAt;
  // final int? v;
  final ObjectId? assignedtoObjectId;
  final String? endDate;
  final String? endDateutcTimeZone;
  final String? modifiedBy;

  Datum({
    this.id,
    this.ticketId,
    this.title,
    this.accountCode,
    this.projectCode,
    this.raisebyObjectId,
    this.customerId,
    this.companyId,
    this.branchObjectId,
    this.description,
    this.requestedBy,
    this.daysOpen,
    this.category,
    this.severity,
    this.startDate,
    this.status,
    this.images,
    this.createdBy,
    this.utcTime,
    this.createdAt,
    this.latestCreatedAt,
    this.updatedAt,
    // this.v,
    this.assignedtoObjectId,
    this.endDate,
    this.endDateutcTimeZone,
    this.modifiedBy,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        ticketId: json["ticketId"],
        title: json["title"],
        accountCode: json["AccountCode"],
        projectCode: json["projectCode"],
        raisebyObjectId: json["raisebyObjectId"] == null
            ? null
            : ObjectId.fromJson(json["raisebyObjectId"]),
        customerId: json["customerId"] == null
            ? null
            : CustomerId.fromJson(json["customerId"]),
        companyId: json["companyId"] == null
            ? null
            : CompanyId.fromJson(json["companyId"]),
        branchObjectId: json["branchObjectId"] == null
            ? null
            : BranchObjectId.fromJson(json["branchObjectId"]),
        description: json["description"].toString(),
        requestedBy: json["requestedBY"],
        daysOpen: json["daysOpen"],
        category: json["category"],
        severity: json["severity"].toString(),
        startDate: json["startDate"],
        status: json["status"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        createdBy: json["createdBy"],
        utcTime: json["utcTime"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        latestCreatedAt: json["latestCreatedAt"] == null
            ? null
            : DateTime.parse(json["latestCreatedAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        // v: json["__v"],
        assignedtoObjectId: json["assignedtoObjectId"] == null
            ? null
            : ObjectId.fromJson(json["assignedtoObjectId"]),
        endDate: json["endDate"],
        endDateutcTimeZone: json["endDateutcTimeZone"],
        modifiedBy: json["modifiedBy"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "ticketId": ticketId,
        "title": title,
        "AccountCode": accountCode,
        "projectCode": projectCode,
        "raisebyObjectId": raisebyObjectId?.toJson(),
        "customerId": customerId?.toJson(),
        "companyId": companyId?.toJson(),
        "branchObjectId": branchObjectId?.toJson(),
        "description": description,
        "requestedBY": requestedBy,
        "daysOpen": daysOpen,
        "category": category,
        "severity": severity,
        "startDate": startDate,
        "status": status,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "utcTime": utcTime,
        "createdAt": createdAt?.toIso8601String(),
        "latestCreatedAt": latestCreatedAt?.toIso8601String(),

        "updatedAt": updatedAt?.toIso8601String(),
        // "__v": v,
        "assignedtoObjectId": assignedtoObjectId?.toJson(),
        "endDate": endDate,
        "endDateutcTimeZone": endDateutcTimeZone,
        "modifiedBy": modifiedBy,
      };
}

class ObjectId {
  final String? id;
  final String? name;

  ObjectId({
    this.id,
    this.name,
  });

  factory ObjectId.fromJson(Map<String, dynamic> json) => ObjectId(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class BranchObjectId {
  final String? id;
  final String? branchName;

  BranchObjectId({
    this.id,
    this.branchName,
  });

  factory BranchObjectId.fromJson(Map<String, dynamic> json) => BranchObjectId(
        id: json["_id"],
        branchName: json["branchName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "branchName": branchName,
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

class CustomerId {
  final String? id;
  final String? customerName;

  CustomerId({
    this.id,
    this.customerName,
  });

  factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
        id: json["_id"],
        customerName: json["customerName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "customerName": customerName,
      };
}

class Image {
  final String? fileName;
  final String? fileUrl;
  final String? extension;

  Image({
    this.fileName,
    this.fileUrl,
    this.extension,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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
