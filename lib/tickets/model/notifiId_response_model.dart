// To parse this JSON data, do
//
//     final notifiIdTesponseModel = notifiIdTesponseModelFromJson(jsonString);
import 'dart:convert';

NotifiIdTesponseModel notifiIdTesponseModelFromJson(String str) => NotifiIdTesponseModel.fromJson(json.decode(str));

String notifiIdTesponseModelToJson(NotifiIdTesponseModel data) => json.encode(data.toJson());

class NotifiIdTesponseModel {
    final int status;
    final String result;
    final String response;
    final List<Datum> data;

    NotifiIdTesponseModel({
        required this.status,
        required this.result,
        required this.response,
        required this.data,
    });

    factory NotifiIdTesponseModel.fromJson(Map<String, dynamic> json) => NotifiIdTesponseModel(
        status: json["status"],
        result: json["result"],
        response: json["response"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "response": response,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final String id;
    final String ticketId;
    final String title;
    final String accountCode;
    final String projectCode;
    final RaisebyObjectId raisebyObjectId;
    final String assignedtoObjectId;
    final String customerId;
    final String companyId;
    final String branchObjectId;
    final String description;
    final DateTime requestedBy;
    final int daysOpen;
    final String epic;
    // final dynamic sprint;
    final String category;
    final String severity;
    final String priority;
    final String startDate;
    final String endDate;
    final String status;
    final String ticketlogs;
    // final dynamic numLogs;
    final List<Image> images;
    final String createdBy;
    final String utcTime;
    final String endDateutcTimeZone;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;
    final String modifiedBy;

    Datum({
        required this.id,
        required this.ticketId,
        required this.title,
        required this.accountCode,
        required this.projectCode,
        required this.raisebyObjectId,
        required this.assignedtoObjectId,
        required this.customerId,
        required this.companyId,
        required this.branchObjectId,
        required this.description,
        required this.requestedBy,
        required this.daysOpen,
        required this.epic,
        // required this.sprint,
        required this.category,
        required this.severity,
        required this.priority,
        required this.startDate,
        required this.endDate,
        required this.status,
        required this.ticketlogs,
        // required this.numLogs,
        required this.images,
        required this.createdBy,
        required this.utcTime,
        required this.endDateutcTimeZone,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.modifiedBy,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        ticketId: json["ticketId"],
        title: json["title"],
        accountCode: json["AccountCode"],
        projectCode: json["projectCode"],
        raisebyObjectId: RaisebyObjectId.fromJson(json["raisebyObjectId"]),
        assignedtoObjectId: json["assignedtoObjectId"],
        customerId: json["customerId"],
        companyId: json["companyId"],
        branchObjectId: json["branchObjectId"],
        description: json["description"],
        requestedBy: DateTime.parse(json["requestedBY"]),
        daysOpen: json["daysOpen"],
        epic: json["epic"],
        // sprint: json["sprint"] ?? '',
        category: json["category"],
        severity: json["severity"],
        priority: json["priority"],
        startDate: json["startDate"],
        endDate: json["endDate"] ?? '',
        status: json["status"],
        ticketlogs: json["ticketlogs"],
        // numLogs: json["numLogs"]?? '',
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        createdBy: json["createdBy"],
        utcTime: json["utcTime"],
        endDateutcTimeZone: json["endDateutcTimeZone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        modifiedBy: json["modifiedBy"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "ticketId": ticketId,
        "title": title,
        "AccountCode": accountCode,
        "projectCode": projectCode,
        "raisebyObjectId": raisebyObjectId.toJson(),
        "assignedtoObjectId": assignedtoObjectId,
        "customerId": customerId,
        "companyId": companyId,
        "branchObjectId": branchObjectId,
        "description": description,
        "requestedBY": requestedBy.toIso8601String(),
        "daysOpen": daysOpen,
        "epic": epic,
        // "sprint": sprint,
        "category": category,
        "severity": severity,
        "priority": priority,
        "startDate": startDate,
        "endDate": endDate,
        "status": status,
        "ticketlogs": ticketlogs,
        // "numLogs": numLogs,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "createdBy": createdBy,
        "utcTime": utcTime,
        "endDateutcTimeZone": endDateutcTimeZone,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "modifiedBy": modifiedBy,
    };
}

class Image {
    final dynamic fileName;
    final String fileUrl;
    final dynamic extension;

    Image({
        required this.fileName,
        required this.fileUrl,
        required this.extension,
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
    final String id;
    final String name;

    RaisebyObjectId({
        required this.id,
        required this.name,
    });

    factory RaisebyObjectId.fromJson(Map<String, dynamic> json) => RaisebyObjectId(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
