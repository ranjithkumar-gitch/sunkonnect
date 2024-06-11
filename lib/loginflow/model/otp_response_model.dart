// To parse this JSON data, do
//
//     final otpResponseModel = otpResponseModelFromJson(jsonString);

import 'dart:convert';

OtpResponseModel otpResponseModelFromJson(String str) => OtpResponseModel.fromJson(json.decode(str));

String otpResponseModelToJson(OtpResponseModel data) => json.encode(data.toJson());

class OtpResponseModel {
    final int? status;
    final String? result;
    final String? response;
    final Data? data;

    OtpResponseModel({
        this.status,
        this.result,
        this.response,
        this.data,
    });

    factory OtpResponseModel.fromJson(Map<String, dynamic> json) => OtpResponseModel(
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
    final String? token;
    final int? remaining;

    Data({
        this.token,
        this.remaining,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        remaining: json["remaining"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "remaining": remaining,
    };
}
