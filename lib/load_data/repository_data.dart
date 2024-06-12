import 'package:sunkonnect/load_data/http_client.dart';
import 'package:sunkonnect/loginflow/model/get_ticketlist_response_model.dart';

class RepositoryData {
  Future<GetTicketListResponseModel> getMyTicketsList(var requestModel) async {
    String url = "Ticket/get-tickets-list";
    final response = await HttpClient.instance.post(url, requestModel);
    return getTicketListResponseModelFromJson(response);
  }
}
