import 'package:flutter/material.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/load_data/repository_data.dart';
import 'package:sunkonnect/loginflow/model/get_ticketlist_response_model.dart';
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

  clearReportsDetails() {
    _getTicketListResponseModel = null;
    notifyListeners();
  }
}
