// To parse this JSON data, do
//
//     final changePasswordResponseModel = changePasswordResponseModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordResponseModel changePasswordResponseModelFromJson(String str) => ChangePasswordResponseModel.fromJson(json.decode(str));

String changePasswordResponseModelToJson(ChangePasswordResponseModel data) => json.encode(data.toJson());

class ChangePasswordResponseModel {
    final int? status;
    final String? result;
    final String? response;

    ChangePasswordResponseModel({
        this.status,
        this.result,
        this.response,
    });

    factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) => ChangePasswordResponseModel(
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
