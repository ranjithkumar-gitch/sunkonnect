// To parse this JSON data, do
//
//     final messageResponseModel = messageResponseModelFromJson(jsonString);

import 'dart:convert';

MessageResponseModel messageResponseModelFromJson(String str) => MessageResponseModel.fromJson(json.decode(str));

String messageResponseModelToJson(MessageResponseModel data) => json.encode(data.toJson());

class MessageResponseModel {
    final int? status;
    final String? result;
    final String? response;

    MessageResponseModel({
        this.status,
        this.result,
        this.response,
    });

    factory MessageResponseModel.fromJson(Map<String, dynamic> json) => MessageResponseModel(
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
