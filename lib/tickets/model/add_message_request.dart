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
    ticketId: json['data'],
    ticketID: json['data'],
    ticketObjId: json['data'],
    title: json['data'],
    dateOfLog: json['data'],
    accountCode: json['data'],
    projectCode: json['data'],
    raisebyObjectID: RaisebyObjectID.fromJson(json['data'] ),
    // raisebyObjectID: json['data'],
    // raisebyObjectName: json['data'],
    assignedtoObjectId: json['data'],
    createdBy: json['data'],
    companyId: json['data'],
    description: json['data'],
    ticketLogImages: (json['data']),
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
   String ? id;
   String ? name;

  RaisebyObjectID({required this.id, required this.name});

  factory RaisebyObjectID.fromJson(Map<String, dynamic> json) {
    return RaisebyObjectID(
      id: json['_id'],
      name: json['name'],
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







