

import 'package:json_annotation/json_annotation.dart';
import 'selected_ticket_response_model.dart.dart';

        
@JsonSerializable()
class EditTicketRequestModel {
  String ticketId;
  String companyId;
  String customerId;
  String branchObjectId;
  String startDate;
  String title;
  String accountCode;
  String projectCode;
  String requestedBy;
  int daysOpen;
  String category;
  String severity;
  RaisebyObjectId raisebyObjectId;
  AssignedtoObjectId? assignedtoObjectId; 
  String endDate;
  String status;
  String createdBy;
  String description;
  List images;
  String roleCode;
  String userId;
  String modifiedBy;
  String loginUser;

  EditTicketRequestModel({
    this.ticketId = "",
    this.companyId = "",
    this.customerId = "",
    this.branchObjectId = "",
    this.startDate = "",
    this.title = "",
    this.accountCode = "",
    this.projectCode = "",
    this.requestedBy = "",
    this.daysOpen = 0,
    this.category = "",
    this.severity = "",
    required this.raisebyObjectId,
    this.assignedtoObjectId, 
    this.endDate = "",
    this.status = "",
    this.createdBy = "",
    this.description = "",
    this.images = const [],
    this.roleCode = "",
    this.userId = "",
    this.modifiedBy = "",
    this.loginUser = "",
  });

  factory EditTicketRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditTicketRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditTicketRequestModelToJson(this);
}

EditTicketRequestModel _$EditTicketRequestModelFromJson(Map<String, dynamic> json) {
  return EditTicketRequestModel(
    ticketId: json['ticketId'] ?? "",
    companyId: json['companyId'] ?? "",
    customerId: json['customerId'] ?? "",
    branchObjectId: json['branchObjectId'] ?? "",
    startDate: json['startDate'] ?? "",
    title: json['title'] ?? "",
    accountCode: json['accountCode'] ?? "",
    projectCode: json['projectCode'] ?? "",
    requestedBy: json['requestedBy'] ?? "",
    daysOpen: json['daysOpen'] ?? 0,
    category: json['category'] ?? "",
    severity: json['severity'] ?? "",
    raisebyObjectId: RaisebyObjectId.fromJson(json['raisebyObjectId']),
    assignedtoObjectId: json['assignedtoObjectId'] != null
        ? AssignedtoObjectId.fromJson(json['assignedtoObjectId'])
        : null, 
    endDate: json['endDate'] ?? "",
    status: json['status'] ?? "",
    createdBy: json['createdBy'] ?? "",
    description: json['description'] ?? "",
    images: json['images'] ?? [],
    roleCode: json['roleCode'] ?? "",
    userId: json['userId'] ?? "",
    modifiedBy: json['modifiedBy'] ?? "",
    loginUser: json['loginUser'] ?? "",
  );
}

Map<String, dynamic> _$EditTicketRequestModelToJson(EditTicketRequestModel instance) {
  final val = <String, dynamic>{
    'ticketId': instance.ticketId,
    'companyId': instance.companyId,
    'customerId': instance.customerId,
    'branchObjectId': instance.branchObjectId,
    'startDate': instance.startDate,
    'title': instance.title,
    'accountCode': instance.accountCode,
    'projectCode': instance.projectCode,
    'requestedBy': instance.requestedBy,
    'daysOpen': instance.daysOpen,
    'category': instance.category,
    'severity': instance.severity,
    'raisebyObjectId': instance.raisebyObjectId.toJson(),
    'assignedtoObjectId': instance.assignedtoObjectId?.toJson(), 
    'endDate': instance.endDate,
    'status': instance.status,
    'createdBy': instance.createdBy,
    'description': instance.description,
    'images': instance.images,
    'roleCode': instance.roleCode,
    'userId': instance.userId,
    'modifiedBy': instance.modifiedBy,
    'loginUser': instance.loginUser,
  };

return val;
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
