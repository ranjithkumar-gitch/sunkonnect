// To parse this JSON data, do
//
//     final markasReadResponseModel = markasReadResponseModelFromJson(jsonString);


import 'dart:convert';

MarkasReadResponseModel markasReadResponseModelFromJson(String str) => MarkasReadResponseModel.fromJson(json.decode(str));

String markasReadResponseModelToJson(MarkasReadResponseModel data) => json.encode(data.toJson());

class MarkasReadResponseModel {
    final int status;
    final String result;
    final String response;

    MarkasReadResponseModel({
        required this.status,
        required this.result,
        required this.response,
    });

    factory MarkasReadResponseModel.fromJson(Map<String, dynamic> json) => MarkasReadResponseModel(
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
