import 'package:flutter/material.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/load_data/repository_data.dart';
import 'package:sunkonnect/loginflow/model/get_ticketlist_response_model.dart';
import 'package:sunkonnect/loginflow/model/selected_ticket_response_model.dart.dart';
import 'package:sunkonnect/widgets/print_local.dart';

class SelectedMyticketsProvider extends ChangeNotifier {
  final RepositoryData _repositoryData = RepositoryData();

  ApiResponse<SelectedticketResponseModel>? _selectedticketresponcemodel;
  ApiResponse<SelectedticketResponseModel>? get selectedticketresponcemodel =>
      _selectedticketresponcemodel;
  Future<void> selectedmytickets({
    bool reload = false,
    String? status,
    var requestmodel,
  }) async {
    // notifyListeners();
    if (_selectedticketresponcemodel == null || reload == true) {
      _selectedticketresponcemodel = ApiResponse.loading();

      // notifyListeners();
      try {
        SelectedticketResponseModel data =
            await _repositoryData.selectedMyticket();
        _selectedticketresponcemodel = ApiResponse.completed(data);
        printL("My Tickets data recieved");
      } catch (e) {
        printL("loadProfile error $e");
        _selectedticketresponcemodel = ApiResponse.error(e.toString());
        notifyListeners();
      }
      notifyListeners();
    }
  }

  clearReportsDetails() {
    _selectedticketresponcemodel = null;
    notifyListeners();
  }
}
