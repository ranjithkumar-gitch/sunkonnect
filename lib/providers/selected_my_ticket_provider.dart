import 'package:flutter/material.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/load_data/repository_data.dart';
import 'package:sunkonnect/loginflow/model/selected_ticket_response_model.dart.dart';
import 'package:sunkonnect/widgets/print_local.dart';

class SelectedMyticketsProvider extends ChangeNotifier {
  final RepositoryData _repositoryData = RepositoryData();

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

  clearReportsDetails() {
    _selectedticketResponseModel = null;
    notifyListeners();
  }
}
