// To parse this JSON data, do
//
//     final contactUsResponseModel = contactUsResponseModelFromJson(jsonString);

import 'dart:convert';

ContactUsResponseModel contactUsResponseModelFromJson(String str) => ContactUsResponseModel.fromJson(json.decode(str));

String contactUsResponseModelToJson(ContactUsResponseModel data) => json.encode(data.toJson());

class ContactUsResponseModel {
    final int? status;
    final String? result;
    final String? response;

    ContactUsResponseModel({
        this.status,
        this.result,
        this.response,
    });

    factory ContactUsResponseModel.fromJson(Map<String, dynamic> json) => ContactUsResponseModel(
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
