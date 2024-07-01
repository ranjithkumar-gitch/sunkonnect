import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AddMessageRequest {
  String ticketId;
  String raisebyObjectId;
  String dateOfLog;
  List ticketLogImages;
  String description;
  String ticketID;
  String ticketObjId;
  String assignedtoObjectId;
  String createdBy;
  String companyId;
  var raisebyObjectID;
  // String raisebyObjectName;
  String title;
  String accountCode;
  String projectCode;

  AddMessageRequest({
    this.ticketId = "",
    this.ticketID = "",
    this.ticketObjId = "",
    this.dateOfLog = "",
    this.title = "",
    this.accountCode = "",
    this.projectCode = "",
    this.assignedtoObjectId = "",
    this.raisebyObjectId = "",
    required this.raisebyObjectID,
    // this.raisebyObjectName = "",
    this.createdBy = "",
    this.companyId = "",
    this.description = "",
    this.ticketLogImages = const [],
  });
  factory AddMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$AddMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddMessageRequestToJson(this);
}

AddMessageRequest _$AddMessageRequestFromJson(Map<String, dynamic> json) {
  return AddMessageRequest(
    ticketId: (json['data'] as String),
    ticketID: (json['data'] as String),
    ticketObjId: (json['data'] as String),
    title: (json['data'] as String),
    dateOfLog: (json['data'] as String),
    accountCode: (json['data'] as String),
    projectCode: (json['data'] as String),
    raisebyObjectID: RaisebyObjectID.fromJson(json['data']),
    // raisebyObjectID: (json['data'] as String),
    // raisebyObjectName: (json['data'] as String),
    assignedtoObjectId: (json['data'] as String),
    createdBy: (json['data'] as String),
    companyId: (json['data'] as String),
    description: (json['data'] as String),
    ticketLogImages: (json['data'] as List),
  );
}

Map<String, dynamic> _$AddMessageRequestToJson(AddMessageRequest instance) =>
    <String, dynamic>{
      'ticketId': instance.ticketId,
      'ticketID': instance.ticketID,
      'ticketObjId': instance.ticketObjId,
      'title': instance.title,
      'dateOfLog': instance.dateOfLog,
      'accountCode': instance.accountCode,
      'projectCode': instance.projectCode,
      'raisebyObjectID': instance.raisebyObjectID.toJson(),
      // 'raisebyObjectName': instance.raisebyObjectName,
      'raisebyObjectId': instance.raisebyObjectId,
      'assignedtoObjectId': instance.assignedtoObjectId,
      'createdBy': instance.createdBy,
      'companyId': instance.companyId,
      'description': instance.description,
      'ticketLogimages': instance.ticketLogImages,
    };

class RaisebyObjectID {
  String? id;
  String? name;

  RaisebyObjectID({required this.id, required this.name});

  factory RaisebyObjectID.fromJson(Map<String, dynamic> json) {
    return RaisebyObjectID(
      id: json['_id'] ?? "",
      name: json['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

// class RaisebyObjectID {
//   String id;
//   String name;

//   RaisebyObjectID({
//     required this.id,
//     required this.name,
//   });

//   factory RaisebyObjectID.fromJson(Map<String, dynamic> json) {
//     return RaisebyObjectID(
//       id: json['id'],
//       name: json['name'],

//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,

//     };
//   }
// }

class TicketLogImage {
  String fileName;
  String fileUrl;
  String extension;

  TicketLogImage({
    required this.fileName,
    required this.fileUrl,
    required this.extension,
  });

  factory TicketLogImage.fromJson(Map<String, dynamic> json) {
    return TicketLogImage(
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
      extension: json['extension'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fileName': fileName,
      'fileUrl': fileUrl,
      'extension': extension,
    };
  }
}
