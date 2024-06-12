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
  String daysOpen;
  String limit;
  String page;


  GetTicketListRequestModel({
    required this.userId,
    required this.roleCode,
    required this.selectedDropdownValue,
    required this.searchKey,
    required this.pageSize,
    required this.pageNo,
    required this.ticketId,
    required this.status,
    required this.severity,
    required this.startDate,
    required this.category,
    required this.daysOpen,
    required this.limit,
    required this.page,
  
    
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId.toString().trim(),
      'roleCode': roleCode.toString().trim(),
      'selectedDropdownValue' : selectedDropdownValue.toString().trim(),
      'searchKey': searchKey.toString().trim(),
      'pageSize': pageSize.toString().trim(),
      'pageNo': pageNo.toString().trim(),
      'ticketId': ticketId.toString().trim(),
      'status': status.toString().trim(),
      'severity': severity.toString().trim(),
      'startDate': startDate.toString().trim(),
      'category': category.toString().trim(),
      'daysOpen': daysOpen.toString().trim(),
      'limit': limit.toString().trim(),
      'page': page.toString().trim(),
      
    };
    return map;
  }
}
