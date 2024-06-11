// To parse this JSON data, do
//
//     final secretResponse = secretResponseFromJson(jsonString);

import 'dart:convert';

SecretResponse secretResponseFromJson(String str) => SecretResponse.fromJson(json.decode(str));

String secretResponseToJson(SecretResponse data) => json.encode(data.toJson());

class SecretResponse {
    final int? status;
    final String? result;
    final String? response;
    final Data? data;

    SecretResponse({
        this.status,
        this.result,
        this.response,
        this.data,
    });

    factory SecretResponse.fromJson(Map<String, dynamic> json) => SecretResponse(
        status: json["status"],
        result: json["result"],
        response: json["response"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "response": response,
        "data": data?.toJson(),
    };
}

class Data {
    final String? secret;

    Data({
        this.secret,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        secret: json["secret"],
    );

    Map<String, dynamic> toJson() => {
        "secret": secret,
    };
}
