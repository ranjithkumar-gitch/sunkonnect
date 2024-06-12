import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunkonnect/loginflow/model/get_ticketlist_response_model.dart';
import 'package:sunkonnect/loginflow/model/get_ticketslist_request_model.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
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
}