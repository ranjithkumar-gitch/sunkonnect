

import 'dart:convert';

GetflagResponseModel getflagResponseModelFromJson(String str) => GetflagResponseModel.fromJson(json.decode(str));

String getflagResponseModelToJson(GetflagResponseModel data) => json.encode(data.toJson());

class GetflagResponseModel {
    final int? status;
    final String? result;
    final String? response;
    final List<Datum>? data;

    GetflagResponseModel({
        this.status,
        this.result,
        this.response,
        this.data,
    });

    factory GetflagResponseModel.fromJson(Map<String, dynamic> json) => GetflagResponseModel(
        status: json["status"],
        result: json["result"],
        response: json["response"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "response": response,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final String? id;
    final bool? fSendEmails;

    Datum({
        this.id,
        this.fSendEmails,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        fSendEmails: json["f_sendEmails"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "f_sendEmails": fSendEmails,
    };
}
