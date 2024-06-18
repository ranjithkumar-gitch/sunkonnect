import 'package:flutter/material.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/load_data/repository_data.dart';
import 'package:sunkonnect/loginflow/model/get_ticketlist_response_model.dart';
import 'package:sunkonnect/loginflow/model/message_log_reponseModel.dart';
import 'package:sunkonnect/loginflow/model/selected_ticket_response_model.dart.dart';
import 'package:sunkonnect/loginflow/model/view_messagelog_response_model.dart';
import 'package:sunkonnect/widgets/print_local.dart';

class MyTicketsListProvider extends ChangeNotifier {
  final RepositoryData _repositoryData = RepositoryData();

  ApiResponse<GetTicketListResponseModel>? _getTicketListResponseModel;
  ApiResponse<GetTicketListResponseModel>? get getTicketListResponseModel =>
      _getTicketListResponseModel;
  Future<void> loadMyTicketsList({
    bool reload = false,
    String? status,
    var requestmodel,
  }) async {
    // notifyListeners();
    if (_getTicketListResponseModel == null || reload == true) {
      _getTicketListResponseModel = ApiResponse.loading();

      // notifyListeners();
      try {
        GetTicketListResponseModel data =
            await _repositoryData.getMyTicketsList(requestmodel);
        _getTicketListResponseModel = ApiResponse.completed(data);
        printL("My Tickets data recieved");
      } catch (e) {
        printL("loadProfile error $e");
        _getTicketListResponseModel = ApiResponse.error(e.toString());
        notifyListeners();
      }
      notifyListeners();
    }
  }

  clearTicketList() {
    _getTicketListResponseModel = null;
    notifyListeners();
  }

  // final RepositoryData _repositoryData = RepositoryData();

  ApiResponse<SelectedticketResponseModel>? _selectedticketResponseModel;
  ApiResponse<SelectedticketResponseModel>? get selectedticketResponseModel =>
      _selectedticketResponseModel;
  Future<void> selectedmytickets({
    bool reload = false,
    String? status,
  }) async {
    if (_selectedticketResponseModel == null || reload == true) {
      _selectedticketResponseModel = ApiResponse.loading();

      // notifyListeners();
      try {
        SelectedticketResponseModel data =
            await _repositoryData.selectedMyticket();
        _selectedticketResponseModel = ApiResponse.completed(data);
        printL("Selected Ticket data recieved");
      } catch (e) {
        printL("loadProfile error $e");
        _selectedticketResponseModel = ApiResponse.error(e.toString());
        notifyListeners();
      }
      notifyListeners();
    }
  }

  clearSelectedTicketDetails() {
    _selectedticketResponseModel = null;
    notifyListeners();
  }
//message log list

  ApiResponse<MessageLogResponseModel>? _messageLogResponseModel;
  ApiResponse<MessageLogResponseModel>? get messageLogResponseModel =>
      _messageLogResponseModel;
  Future<void> messageLog({
    bool reload = false,
    String? status,
  }) async {
    if (_messageLogResponseModel == null || reload == true) {
      _messageLogResponseModel = ApiResponse.loading();

      // notifyListeners();
      try {
        MessageLogResponseModel data = await _repositoryData.messageLog();
        _messageLogResponseModel = ApiResponse.completed(data);
        printL("message log recieved");
      } catch (e) {
        printL("loadProfile error $e");
        _messageLogResponseModel = ApiResponse.error(e.toString());
        notifyListeners();
      }
      notifyListeners();
    }
  }

  clearmessagelogDetails() {
    _messageLogResponseModel = null;
    notifyListeners();
  }

  ApiResponse<ViewMessageLogResponseModel>? _viewMessageLogResponseModel;
  ApiResponse<ViewMessageLogResponseModel>? get viewMessageLogResponseModel =>
      _viewMessageLogResponseModel;
  Future<void> viewmessageLog({
    bool reload = false,
    String? status,
  }) async {
    if (_viewMessageLogResponseModel == null || reload == true) {
      _viewMessageLogResponseModel = ApiResponse.loading();

      // notifyListeners();
      try {
        ViewMessageLogResponseModel data =
            await _repositoryData.viewMessageLog();
        _viewMessageLogResponseModel = ApiResponse.completed(data);
        printL("view message log recieved");
      } catch (e) {
        printL("loadProfile error $e");
        _viewMessageLogResponseModel = ApiResponse.error(e.toString());
        notifyListeners();
      }
      notifyListeners();
    }
  }

  clearviewmessagelogDetails() {
    _viewMessageLogResponseModel = null;
    notifyListeners();
  }
}
