import 'package:sunkonnect/load_data/http_client.dart';
import 'package:sunkonnect/tickets/model/get_ticket_log_responsemodel.dart';
import 'package:sunkonnect/tickets/model/get_ticketlist_response_model.dart';
import 'package:sunkonnect/loginflow/model/message_log_reponseModel.dart';
import 'package:sunkonnect/tickets/model/selected_ticket_response_model.dart.dart';
import 'package:sunkonnect/tickets/model/view_messagelog_response_model.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/tickets/messagelogscreen.dart';

class RepositoryData {
  Map<String, String> accessheaders = {
    "Authorization": SharedPrefServices.getaccessToken().toString(),
  };
  Future<GetTicketListResponseModel> getMyTicketsList(var requestModel) async {
    String url = "Ticket/get-tickets-list";
    final response = await HttpClient.instance.post(url, requestModel);
    return getTicketListResponseModelFromJson(response);
  }
//selected my ticket

  Future<SelectedticketResponseModel> selectedMyticket() async {
    String url = "Ticket/get-ticket-info/${SharedPrefServices.getTicketId()}";

    final response = await HttpClient.instance.get(
      url,
    );
    return selectedticketResponseModelFromJson(response);
  }
// message log list

  Future<MessageLogResponseModel> messageLog() async {
    String url =
        "ticketLog/get-message-log-list/${SharedPrefServices.getTicketobjId()}";

    final response = await HttpClient.instance.get(
      url,
    );
    return messageLogResponseModelFromJson(response);
  }
//view message log

  Future<ViewMessageLogResponseModel> viewMessageLog() async {
    String url =
        "ticketLog/patch-message-info/${SharedPrefServices.getDatumTicketId()}";

    final response = await HttpClient.instance.get(
      url,
    );
    return viewMessageLogResponseModelFromJson(response);
  }

  // ticket log
  Future<GetticketLogResponseModel> getTicketLog() async {
    String url =
        "Ticket/get-email-log-for-tickets/${SharedPrefServices.getTicketId()}";
    print("uday get  url $url");
    print(
        "uday get message acccesstkn ${SharedPrefServices.getaccessToken().toString()}");
    final response = await HttpClient.instance.get(
      url,
    );
    return getticketLogResponseModelFromJson(response);
  }
}
