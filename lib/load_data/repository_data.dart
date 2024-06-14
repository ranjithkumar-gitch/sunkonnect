import 'package:sunkonnect/load_data/http_client.dart';
import 'package:sunkonnect/loginflow/model/get_ticketlist_response_model.dart';
import 'package:sunkonnect/loginflow/model/selected_ticket_response_model.dart.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';

class RepositoryData {
  Map<String, String> accessheaders = {
    "Authorization": SharedPrefServices.getaccessToken().toString(),
  };
  Future<GetTicketListResponseModel> getMyTicketsList(var requestModel) async {
    String url = "Ticket/get-tickets-list";
    final response = await HttpClient.instance.post(url, requestModel);
    return getTicketListResponseModelFromJson(response);
  }

  Future<SelectedticketResponseModel> selectedMyticket() async {
    String url = "Ticket/patch-ticketInfo/${SharedPrefServices.getTicketId()}";

    final response = await HttpClient.instance.get(url, headers: accessheaders);
    return SelectedticketResponseModelFromJson(response);
  }
}
