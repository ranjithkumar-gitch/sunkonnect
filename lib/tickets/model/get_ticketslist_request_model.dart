import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GetTicketListRequestModel {
  String userId;
  String roleCode;
  String selectedDropdownValue;
  String searchKey;
  String pageSize;
  String pageNo;
  String ticketId;
  String status;
  String severity;
  String startDate;
  String category;
  String dateSort;

  String daysOpen;
  String limit;
  String page;

  GetTicketListRequestModel({
    this.userId = "",
    this.roleCode = "",
    this.selectedDropdownValue = "",
    this.searchKey = "",
    this.pageSize = "",
    this.pageNo = "",
    this.ticketId = "",
    this.status = "",
    this.severity = "",
    this.startDate = "",
    this.category = "",
    this.dateSort = "lastUpdated",
    this.daysOpen = "",
    this.limit = "",
    this.page = "",
  });
  factory GetTicketListRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetTicketListRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetTicketListRequestModelToJson(this);
}

GetTicketListRequestModel _$GetTicketListRequestModelFromJson(
    Map<String, dynamic> json) {
  return GetTicketListRequestModel(
    userId: (json['data'] as String),
    roleCode: (json['data'] as String),
    selectedDropdownValue: (json['data'] as String),
    searchKey: (json['data'] as String),
    ticketId: (json['data'] as String),
    status: (json['data'] as String),
    severity: (json['data'] as String),
    startDate: (json['data'] as String),
    category: (json['data'] as String),
    daysOpen: (json['data'] as String),
    pageSize: (json['data'] as String),
    dateSort: (json['data'] as String),
    pageNo: (json['data'] as String),
    limit: (json['data'] as String),
    page: (json['data'] as String),
  );
}

Map<String, dynamic> _$GetTicketListRequestModelToJson(
        GetTicketListRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'roleCode': instance.roleCode,
      'selectedDropdownValue': instance.selectedDropdownValue,
      'searchKey': instance.searchKey,
      'pageSize': instance.pageSize,
      'pageNo': instance.pageNo,
      'ticketId': instance.ticketId,
      'status': instance.status,
      'severity': instance.severity,
      'startDate': instance.startDate,
      'category': instance.category,
      'dateSort': instance.dateSort,
      'daysOpen': instance.daysOpen,
      'limit': instance.limit,
      'page': instance.page,
    };
