// To parse this JSON data, do
//
//     final imagesResponseModel = imagesResponseModelFromJson(jsonString);

import 'dart:convert';

ImagesResponseModel imagesResponseModelFromJson(String str) => ImagesResponseModel.fromJson(json.decode(str));

String imagesResponseModelToJson(ImagesResponseModel data) => json.encode(data.toJson());

class ImagesResponseModel {
    final int? status;
    final String? result;
    final Response? response;

    ImagesResponseModel({
        this.status,
        this.result,
        this.response,
    });

    factory ImagesResponseModel.fromJson(Map<String, dynamic> json) => ImagesResponseModel(
        status: json["status"],
        result: json["result"],
        response: json["response"] == null ? null : Response.fromJson(json["response"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result,
        "response": response?.toJson(),
    };
}

class Response {
    final List<UploadedImagePath>? uploadedImagePath;

    Response({
        this.uploadedImagePath,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        uploadedImagePath: json["uploadedImagePath"] == null ? [] : List<UploadedImagePath>.from(json["uploadedImagePath"]!.map((x) => UploadedImagePath.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uploadedImagePath": uploadedImagePath == null ? [] : List<dynamic>.from(uploadedImagePath!.map((x) => x.toJson())),
    };
}

class UploadedImagePath {
    final String? fieldname;
    final String? originalname;
    final String? encoding;
    final String? mimetype;
    final int? size;
    final String? bucket;
    final String? key;
    final String? acl;
    final String? contentType;
    final dynamic contentDisposition;
    final dynamic contentEncoding;
    final String? storageClass;
    final dynamic serverSideEncryption;
    final dynamic metadata;
    final String? location;
    final String? etag;

    UploadedImagePath({
        this.fieldname,
        this.originalname,
        this.encoding,
        this.mimetype,
        this.size,
        this.bucket,
        this.key,
        this.acl,
        this.contentType,
        this.contentDisposition,
        this.contentEncoding,
        this.storageClass,
        this.serverSideEncryption,
        this.metadata,
        this.location,
        this.etag,
    });

    factory UploadedImagePath.fromJson(Map<String, dynamic> json) => UploadedImagePath(
        fieldname: json["fieldname"],
        originalname: json["originalname"],
        encoding: json["encoding"],
        mimetype: json["mimetype"],
        size: json["size"],
        bucket: json["bucket"],
        key: json["key"],
        acl: json["acl"],
        contentType: json["contentType"],
        contentDisposition: json["contentDisposition"],
        contentEncoding: json["contentEncoding"],
        storageClass: json["storageClass"],
        serverSideEncryption: json["serverSideEncryption"],
        metadata: json["metadata"],
        location: json["location"],
        etag: json["etag"],
    );

    Map<String, dynamic> toJson() => {
        "fieldname": fieldname,
        "originalname": originalname,
        "encoding": encoding,
        "mimetype": mimetype,
        "size": size,
        "bucket": bucket,
        "key": key,
        "acl": acl,
        "contentType": contentType,
        "contentDisposition": contentDisposition,
        "contentEncoding": contentEncoding,
        "storageClass": storageClass,
        "serverSideEncryption": serverSideEncryption,
        "metadata": metadata,
        "location": location,
        "etag": etag,
    };
}
