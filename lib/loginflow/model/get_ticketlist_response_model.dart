// To parse this JSON data, do
//
//     final getTicketListResponseModel = getTicketListResponseModelFromJson(jsonString);

import 'dart:convert';

GetTicketListResponseModel getTicketListResponseModelFromJson(String str) => GetTicketListResponseModel.fromJson(json.decode(str));

String getTicketListResponseModelToJson(GetTicketListResponseModel data) => json.encode(data.toJson());

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

    factory GetTicketListResponseModel.fromJson(Map<String, dynamic> json) => GetTicketListResponseModel(
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
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "totalPages": totalPages,
        "currentPage": currentPage,
        "limit": limit,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
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
    final Severity? severity;
    final String? startDate;
    final String? status;
    final List<Image>? images;
    final String? createdBy;
    final String? utcTime;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? v;
    final ObjectId? assignedtoObjectId;
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
        raisebyObjectId: json["raisebyObjectId"] == null ? null : ObjectId.fromJson(json["raisebyObjectId"]),
        customerId: json["customerId"] == null ? null : CustomerId.fromJson(json["customerId"]),
        companyId: json["companyId"] == null ? null : CompanyId.fromJson(json["companyId"]),
        branchObjectId: json["branchObjectId"] == null ? null : BranchObjectId.fromJson(json["branchObjectId"]),
        description: json["description"],
        requestedBy: json["requestedBY"],
        daysOpen: json["daysOpen"],
        category: json["category"],
        severity: severityValues.map[json["severity"]]!,
        startDate: json["startDate"],
        status: json["status"],
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        createdBy: json["createdBy"],
        utcTime: json["utcTime"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        assignedtoObjectId: json["assignedtoObjectId"] == null ? null : ObjectId.fromJson(json["assignedtoObjectId"]),
        endDate: json["endDate"],
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
        "requestedBY": requestedBy,
        "daysOpen": daysOpen,
        "category": category,
        "severity": severityValues.reverse[severity],
        "startDate": startDate,
        "status": status,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "utcTime": utcTime,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "assignedtoObjectId": assignedtoObjectId?.toJson(),
        "endDate": endDate,
        "modifiedBy": modifiedBy,
        "endDateutcTimeZone": endDateutcTimeZone,
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

enum CompanyName {
    SUN_KPO
}

final companyNameValues = EnumValues({
    "SUN KPO": CompanyName.SUN_KPO
});

enum Id {
    THE_65_CE0189_D858_A553_CD4_CF10_F
}

final idValues = EnumValues({
    "65ce0189d858a553cd4cf10f": Id.THE_65_CE0189_D858_A553_CD4_CF10_F
});

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
    final String? fileUrl;
    final String? fileName;
    final Extension? extension;

    Image({
        this.fileUrl,
        this.fileName,
        this.extension,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        fileUrl: json["fileUrl"],
        fileName: json["fileName"],
        extension: extensionValues.map[json["extension"]]!,
    );

    Map<String, dynamic> toJson() => {
        "fileUrl": fileUrl,
        "fileName": fileName,
        "extension": extensionValues.reverse[extension],
    };
}

enum Extension {
    PDF,
    STEP,
    XLSB
}

final extensionValues = EnumValues({
    "pdf": Extension.PDF,
    "step": Extension.STEP,
    "xlsb": Extension.XLSB
});

enum Severity {
    HIGH,
    LOW,
    MEDIUM
}

final severityValues = EnumValues({
    "High": Severity.HIGH,
    "Low": Severity.LOW,
    "Medium": Severity.MEDIUM
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
