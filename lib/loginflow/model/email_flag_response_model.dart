// To parse this JSON data, do
//
//     final emailFlagResponse = emailFlagResponseFromJson(jsonString);


import 'dart:convert';

EmailFlagResponse emailFlagResponseFromJson(String str) => EmailFlagResponse.fromJson(json.decode(str));

String emailFlagResponseToJson(EmailFlagResponse data) => json.encode(data.toJson());

class EmailFlagResponse{
    final int status;
    final String result;
    final String response;

    EmailFlagResponse({
        required this.status,
        required this.result,
        required this.response,
    });

    factory EmailFlagResponse.fromJson(Map<String, dynamic> json) => EmailFlagResponse(
        status: json["status"],
        result: json["result"],
        response: json["response"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "response": response,
    };
}
