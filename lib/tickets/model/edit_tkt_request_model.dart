import 'package:json_annotation/json_annotation.dart';

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
  dynamic raisebyObjectId;
  dynamic assignedtoObjectId;
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
    this.raisebyObjectId,
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

EditTicketRequestModel _$EditTicketRequestModelFromJson(
    Map<String, dynamic> json) {
  return EditTicketRequestModel(
    ticketId: json['data'],
    companyId: json['data'],
    customerId: json['data'],
    branchObjectId: json['data'],
    startDate: json['data'],
    title: json['data'],
    accountCode: json['data'],
    projectCode: json['data'],
    requestedBy: json['data'],
    daysOpen: json['data'],
    category: json['data'],
    severity: json['data'],
    raisebyObjectId: json['data'],
    assignedtoObjectId: json['data'],
    endDate: json['data'] ?? '',
    status: json['data'],
    createdBy: json['data'],
    description: json['data'],
    images: (json['data']),
    roleCode: json['data'],
    userId: json['data'],
    modifiedBy: json['data'],
    loginUser: json['data'],
  );
}

Map<String, dynamic> _$EditTicketRequestModelToJson(
        EditTicketRequestModel instance) =>
    <String, dynamic>{
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
      'raisebyObjectId': instance.raisebyObjectId,
      'assignedtoObjectId': instance.assignedtoObjectId,
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
