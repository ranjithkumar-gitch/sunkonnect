import 'package:sunkonnect/constant.dart';
import 'package:sunkonnect/loginflow/model/login_request_model.dart';
import 'package:sunkonnect/loginflow/model/login_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // loginservice //

  Future<Loginauth> loginauth(Loginrequestauth requestModel) async {
    String url = "${AppConstant.sunkonnectProdUrl}login/login-to-dashboard";
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
}
