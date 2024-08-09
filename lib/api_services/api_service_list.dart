import 'dart:async';
import 'dart:developer';
import 'package:sunkonnect/loginflow/model/email_flag_request_model.dart';
import 'package:sunkonnect/loginflow/model/email_flag_response_model.dart';
import 'package:sunkonnect/sidemenu/model/contactus_request_model.dart';
import 'package:sunkonnect/sidemenu/model/contactus_response_model.dart';
import 'package:sunkonnect/sidemenu/model/getflag_response_model.dart';
import 'package:sunkonnect/tickets/model/add_message_request.dart';
import 'package:sunkonnect/tickets/model/get-assigned-to-list_responseModel.dart';
import 'package:sunkonnect/tickets/model/get_emailNotifications_responcemodel.dart';
import 'package:sunkonnect/tickets/model/get_email_notification_lis_request_Modelt.dart';
import 'package:sunkonnect/tickets/model/get_notificationflag_response_model.dart';
import 'package:sunkonnect/tickets/model/get_ticketlist_response_model.dart';
import 'package:sunkonnect/tickets/model/get_ticketslist_request_model.dart';
import 'package:sunkonnect/loginflow/model/verifyemail_response_model.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/tickets/model/images_respoonse_model.dart';
import 'package:sunkonnect/tickets/model/markas_read_request_model.dart';
import 'package:sunkonnect/tickets/model/markas_read_response_model.dart';
import 'package:sunkonnect/tickets/model/notifiId_response_model.dart';
import 'package:sunkonnect/widgets/constant.dart';
import 'package:sunkonnect/loginflow/model/change_password_response_model.dart';
import 'package:sunkonnect/loginflow/model/forgot_request_model.dart';
import 'package:sunkonnect/loginflow/model/login_request_model.dart';
import 'package:sunkonnect/loginflow/model/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:sunkonnect/loginflow/model/otp_response_model.dart';
import 'package:sunkonnect/loginflow/model/password_update_request_model.dart';
import 'package:sunkonnect/loginflow/model/secret_response_model.dart';

class ApiService {
  // loginservice //
  Map<String, String> accessheaders = {
    "Authorization": SharedPrefServices.getaccessToken().toString(),
  };
// ticketLog/insert-ticketLogInfo
  Future<Loginauth> loginauth(Loginrequestauth requestModel) async {
    String url = "${AppConstant.sunkonnectDevUrl}login/login-to-dashboard";
    print(url);

    try {
      final response = await http.post(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      // print("response.body requestModel ${requestModel.toJson()}");
      // print("response.body signin ${response.body}");
      // print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return loginauthFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return loginauthFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return loginauthFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return loginauthFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return loginauthFromJson(response.body);
      } else
        return loginauthFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  // verify email
  Future<dynamic> verifyEmail(String email) async {
    String url = "${AppConstant.sunkonnectDevUrl}login/get-login-data/$email";
    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      print("response.body secretCode ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return verifyEmailresponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return verifyEmailresponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return verifyEmailresponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return verifyEmailresponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return verifyEmailresponseModelFromJson(response.body);
      } else
        return verifyEmailresponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    throw Exception('Failed to load Data');
  }

  // Secret code for verification OTP //

  Future<SecretResponse> getSecretCode() async {
    String url =
        "${AppConstant.sunkonnectDevUrl}sendgrid/get-verification-secret-code";
    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
      );

      print("response.body secretCode ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return secretResponseFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return secretResponseFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return secretResponseFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return secretResponseFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return secretResponseFromJson(response.body);
      } else
        return secretResponseFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    throw Exception('Failed to load Data');
  }

  // get OTP by POST Service//

  Future<OtpResponseModel> getOTPByPost(
      ForgotPasswordRequestModel requestModel) async {
    String url =
        "${AppConstant.sunkonnectDevUrl}sendgrid/send-verification-code-to-email";
    print(url);

    try {
      final response = await http.post(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      print("response.body requestModel ${requestModel.toJson()}");
      print("response.body signin ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return otpResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return otpResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return otpResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return otpResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return otpResponseModelFromJson(response.body);
      } else
        return otpResponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  // change password by PUT Meathod //

  Future<ChangePasswordResponseModel> changePassword(
      Passwordupdaterequestmodel requestModel) async {
    String url = "${AppConstant.sunkonnectDevUrl}login/forget-password-update";
    print(url);

    try {
      final response = await http.put(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      print("response.body requestModel ${requestModel.toJson()}");
      print("response.body changePassword ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return changePasswordResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return changePasswordResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return changePasswordResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return changePasswordResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return changePasswordResponseModelFromJson(response.body);
      } else
        return changePasswordResponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  // get tickets list by POST Service //

  Future<GetTicketListResponseModel> getTicketList(
      GetTicketListRequestModel requestModel) async {
    String url = "${AppConstant.sunkonnectDevUrl}Ticket/get-tickets-list";
    print(SharedPrefServices.getaccessToken().toString());
    print(url);
    print("response.body requestModel ${requestModel.toJson()}");

    try {
      final response = await http.post(Uri.parse(url),
          body: requestModel.toJson(), headers: accessheaders);

      print("response.body signin ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return getTicketListResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return getTicketListResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return getTicketListResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return getTicketListResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return getTicketListResponseModelFromJson(response.body);
      } else
        return getTicketListResponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print("idauyasdasd");
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  // addimages&files POST service //

  Future<ImagesResponseModel> addMultiFiles(TicketLogImage requestModel) async {
    String url =
        "${AppConstant.sunkonnectDevUrl}imageUpload/multipleImageUploader";

    print(
        "Print Multi Files response.body requestModel ${requestModel.toJson()}");

    try {
      final response = await http.post(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return imagesResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return imagesResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return imagesResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return imagesResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return imagesResponseModelFromJson(response.body);
      } else
        return imagesResponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  // get assignedTo Dropdown List

  Future<GetAssignedToListResponseModel> getAssignedTo() async {
    String _id = SharedPrefServices.getBranchobjId().toString();
    String url =
        "${AppConstant.sunkonnectDevUrl}common-services/get-assigned-to-list/$_id";
    print(url);

    try {
      final response = await http.get(Uri.parse(url), headers: accessheaders);

      print("response.body Dropdown List ${response.body}");
      print("Dropdown List Status code ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return getAssignedToListResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return getAssignedToListResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return getAssignedToListResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return getAssignedToListResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return getAssignedToListResponseModelFromJson(response.body);
      } else {
        return getAssignedToListResponseModelFromJson(response.body);
      }
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    throw Exception('Failed to load Data');
  }

  // get email flag
  Future<GetflagResponseModel> getEmailFlag() async {
    String email = SharedPrefServices.getuserId().toString();
    String url =
        "${AppConstant.sunkonnectDevUrl}users/get-user-email-flag/$email";

    print(url);
    print(SharedPrefServices.getaccessToken().toString());

    //   var headers = accessheaders;
    // var request = http.Request('GET', Uri.parse(url));

    // request.headers.addAll(headers);

    try {
      final response = await http.get(Uri.parse(url), headers: accessheaders);

      //  http.StreamedResponse streamedResponse = await request.send();
      // var response = await http.Response.fromStream(streamedResponse);

      print('fetch response email flag data  $response');

      print("response.body emailflag ${response.body}");
      print("response.body emailflag ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return getflagResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return getflagResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return getflagResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return getflagResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return getflagResponseModelFromJson(response.body);
      } else
        return getflagResponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    throw Exception('Failed to load Data');
  }

  // Contact US POST Service

  Future<ContactUsResponseModel> contactUs(
      ContactUSRequestModel requestModel) async {
    String url = "${AppConstant.sunkonnectDevUrl}contact-us/insert-contactus";
    print(url);

    try {
      final response = await http.post(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      print("response.body requestModel ${requestModel.toJson()}");
      print("response.body signin ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return contactUsResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return contactUsResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return contactUsResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return contactUsResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return contactUsResponseModelFromJson(response.body);
      } else
        return contactUsResponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  Future<EmailFlagResponse> emailFlagUpdate(
      EmailFlagupdateRequestModel requestModel) async {
    String url = "${AppConstant.sunkonnectDevUrl}Ticket/update-email-flag";
    print(url);

    try {
      final response = await http.put(Uri.parse(url),
          body: requestModel.toJson(), headers: accessheaders);

      print("response.body requestModel ${requestModel.toJson()}");
      print("response.body update email ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return emailFlagResponseFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return emailFlagResponseFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return emailFlagResponseFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return emailFlagResponseFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return emailFlagResponseFromJson(response.body);
      } else
        return emailFlagResponseFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  Future<GetEmailNotifiactonsResponseModel> notificationbadge(
      GetEmailNotificationListRequestModel requestModel) async {
    String url =
        "${AppConstant.sunkonnectDevUrl}Ticket/get-email-notifications";
    print(url);

    try {
      final response = await http.post(Uri.parse(url),
          body: requestModel.toJson(), headers: accessheaders);

      // print("response.body requestModel ${requestModel.toJson()}");
      // print("response.body signin ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return getEmailNotifiactonsResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return getEmailNotifiactonsResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return getEmailNotifiactonsResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return getEmailNotifiactonsResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return getEmailNotifiactonsResponseModelFromJson(response.body);
      } else
        return getEmailNotifiactonsResponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  Future<GetNotificationFlagResponse> notificationFlag(
      GetEmailNotificationListRequestModel requestModel) async {
    String url =
        "${AppConstant.sunkonnectDevUrl}Ticket/get-email-notifications";
    print(url);

    try {
      final response = await http.post(Uri.parse(url),
          body: requestModel.toJson(), headers: accessheaders);

      // print("response.body requestModel ${requestModel.toJson()}");
      // print("response.body signin ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return GetNotificationFlagResponseFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return GetNotificationFlagResponseFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return GetNotificationFlagResponseFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return GetNotificationFlagResponseFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return GetNotificationFlagResponseFromJson(response.body);
      } else
        return GetNotificationFlagResponseFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  Future<MarkasReadResponseModel> markasRead(
      MarkasReadRequestModel requestModel) async {
    String url =
        "${AppConstant.sunkonnectDevUrl}Ticket/markNotificationsAsRead";
    print(url);

    try {
      final response = await http.post(Uri.parse(url),
          body: requestModel.toJson(), headers: accessheaders);

      print("response.body requestModel ${requestModel.toJson()}");
      print("response.body signin ${response.body}");
      print("response.body statusCode ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return markasReadResponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return markasReadResponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return markasReadResponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return markasReadResponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return markasReadResponseModelFromJson(response.body);
      } else
        return markasReadResponseModelFromJson(response.body);
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    print(requestModel);

    throw Exception('Failed to load Data');
  }

  Future<NotifiIdTesponseModel> getNotifiData(String generateID) async {
    String url =
        "${AppConstant.sunkonnectDevUrl}Ticket/patch-ticketInfo/$generateID";

    print(generateID);
    print(url);

    try {
      final response = await http.get(Uri.parse(url), headers: accessheaders);

      print('fetch response notifiId data  $response');

      print("response.body notifiId ${response.body}");
      print("response.body notifiId ${response.statusCode}");
      // inspect(requestModel.toJson());
      if (response.statusCode == 200) {
        return notifiIdTesponseModelFromJson(response.body);
      } else if (response.statusCode == 203) {
        // throw Exception('incorrect data');
        return notifiIdTesponseModelFromJson(response.body);
      } else if (response.statusCode == 201) {
        // throw Exception('incorrect data');
        return notifiIdTesponseModelFromJson(response.body);
      } else if (response.statusCode == 401) {
        // throw Exception('incorrect data');
        return notifiIdTesponseModelFromJson(response.body);
      } else if (response.statusCode == 404) {
        // throw Exception('incorrect data');
        return notifiIdTesponseModelFromJson(response.body);
      } else {
        return notifiIdTesponseModelFromJson(response.body);
      }
      // print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
    // return userloginfailureresponseFromJson(response.body);

    throw Exception('Failed to load Data');
  }
}
