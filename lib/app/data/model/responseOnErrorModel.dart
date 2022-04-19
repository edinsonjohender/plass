// ignore_for_file: file_names

import 'dart:convert';

ResponseOnError responseOnErrorFromJson(String str) => ResponseOnError.fromJson(json.decode(str));

String responseOnErrorToJson(ResponseOnError data) => json.encode(data.toJson());

class ResponseOnError {
    ResponseOnError({
        this.code,
        this.error,
    });

    ResponseOnErrorError? error;
    int? code;

    factory ResponseOnError.fromJson(Map<String, dynamic> json) => ResponseOnError(
        code: json["code"] == null ? null : json["code"],
        error: ResponseOnErrorError.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "error": error!.toJson(),
    };
}

class ResponseOnErrorError {
    ResponseOnErrorError({
        this.code,
        this.message,
        this.errors,
    });

    int? code;
    String? message;
    List<ErrorElement>? errors;

    factory ResponseOnErrorError.fromJson(Map<String, dynamic> json) => ResponseOnErrorError(
        code: json["code"],
        message: json["message"],
        errors: List<ErrorElement>.from(json["errors"].map((x) => ErrorElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "errors": List<dynamic>.from(errors!.map((x) => x.toJson())),
    };
}

class ErrorElement {
    ErrorElement({
        this.message,
        this.domain,
        this.reason,
    });

    String? message;
    String? domain;
    String? reason;

    factory ErrorElement.fromJson(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "domain": domain,
        "reason": reason,
    };
}
