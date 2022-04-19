
// ignore_for_file: file_names, prefer_if_null_operators

import 'dart:convert';

List<ResponseMododel> responseMododelFromJson(String str) => List<ResponseMododel>.from(json.decode(str).map((x) => ResponseMododel.fromJson(x)));

String responseMododelToJson(List<ResponseMododel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResponseMododel {
    ResponseMododel({
        this.kind,
        this.idToken,
        this.email,
        this.refreshToken,
        this.expiresIn,
        this.localId,
        this.displayName,
        this.registered,
    });

    String? kind;
    String? idToken;
    String? email;
    String? refreshToken;
    String? expiresIn;
    String? localId;
    String? displayName;
    bool? registered;

    factory ResponseMododel.fromJson(Map<String, dynamic> json) => ResponseMododel(
        kind: json["kind"],
        idToken: json["idToken"],
        email: json["email"],
        refreshToken: json["refreshToken"] == null ? null : json["refreshToken"],
        expiresIn: json["expiresIn"] == null ? null : json["expiresIn"],
        localId: json["localId"],
        displayName: json["displayName"] == null ? null : json["displayName"],
        registered: json["registered"] == null ? null : json["registered"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "idToken": idToken,
        "email": email,
        "refreshToken": refreshToken == null ? null : refreshToken,
        "expiresIn": expiresIn == null ? null : expiresIn,
        "localId": localId,
        "displayName": displayName == null ? null : displayName,
        "registered": registered == null ? null : registered,
    };
}
