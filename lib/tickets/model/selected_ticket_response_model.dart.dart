// To parse this JSON data, do
//
//     final selectedticketResponseModel = selectedticketResponseModelFromJson(jsonString);

import 'dart:convert';

SelectedticketResponseModel selectedticketResponseModelFromJson(String str) =>
    SelectedticketResponseModel.fromJson(json.decode(str));

String selectedticketResponseModelToJson(SelectedticketResponseModel data) =>
    json.encode(data.toJson());

class SelectedticketResponseModel {
  final int? status;
  final String? result;
  final String? response;
  final List<Datum>? data;

  SelectedticketResponseModel({
    this.status,
    this.result,
    this.response,
    this.data,
  });

  factory SelectedticketResponseModel.fromJson(Map<String, dynamic> json) =>
      SelectedticketResponseModel(
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
  final String? ticketId;
  final String? title;
  final String? accountCode;
  final String? projectCode;
  final RaisebyObjectId? raisebyObjectId;
  final CustomerId? customerId;
  final CompanyId? companyId;
  final BranchObjectId? branchObjectId;
  final String? description;
  final DateTime? requestedBy;
  final int? daysOpen;
  final String? category;
  final String? severity;
  final String? startDate;
  final String? status;
  final List<Image>? images;
  final String? createdBy;
  final String? utcTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final AssignedtoObjectId? assignedtoObjectId;
  // final dynamic assignedtoObjectId;
  final String? endDate;
  final String? modifiedBy;
  final String? endDateutcTimeZone;

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
    this.updatedAt,
    this.v,
    this.assignedtoObjectId,
    this.endDate,
    this.modifiedBy,
    this.endDateutcTimeZone,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        ticketId: json["ticketId"],
        title: json["title"],
        accountCode: json["AccountCode"],
        projectCode: json["projectCode"],
        raisebyObjectId: json["raisebyObjectId"] == null
            ? null
            : RaisebyObjectId.fromJson(json["raisebyObjectId"]),
        customerId: json["customerId"] == null
            ? null
            : CustomerId.fromJson(json["customerId"]),
        companyId: json["companyId"] == null
            ? null
            : CompanyId.fromJson(json["companyId"]),
        branchObjectId: json["branchObjectId"] == null
            ? null
            : BranchObjectId.fromJson(json["branchObjectId"]),
        description: json["description"],
        requestedBy: json["requestedBY"] == null
            ? null
            : DateTime.parse(json["requestedBY"]),
        daysOpen: json["daysOpen"],
        category: json["category"],
        severity: json["severity"],
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
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],

        assignedtoObjectId: json["assignedtoObjectId"] == null
            ? null
            : AssignedtoObjectId.fromJson(json["assignedtoObjectId"]),
        // assignedtoObjectId: json["assignedtoObjectId"],
        endDate: json['endDate'],
        // endDate: json["endDate"] == null ? '' : json["endDate"],
        modifiedBy: json["modifiedBy"],
        endDateutcTimeZone: json["endDateutcTimeZone"],
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
        "requestedBY": requestedBy?.toIso8601String(),
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
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        // "assignedtoObjectId": assignedtoObjectId,
        "assignedtoObjectId": assignedtoObjectId?.toJson(),

        "endDate": endDate,
        "modifiedBy": modifiedBy,
        "endDateutcTimeZone": endDateutcTimeZone,
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

class AssignedtoObjectId {
  final String? id;
  final String? name;

  AssignedtoObjectId({
    this.id,
    this.name,
  });

  factory AssignedtoObjectId.fromJson(Map<String, dynamic> json) =>
      AssignedtoObjectId(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
