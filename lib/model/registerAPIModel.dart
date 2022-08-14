// To parse this JSON data, do
//
//     final responseRegister = responseRegisterFromJson(jsonString);

// To parse this JSON data, do
//
//     final responseRegister = responseRegisterFromJson(jsonString);

import 'dart:convert';

ResponseRegister responseRegisterFromJson(String str) => ResponseRegister.fromJson(json.decode(str));

String responseRegisterToJson(ResponseRegister data) => json.encode(data.toJson());

class ResponseRegister {
    ResponseRegister({
       required this.success,
        required this.data,
        required this.message,
    });

    bool success;
    Data data;
    String message;

    factory ResponseRegister.fromJson(Map<String, dynamic> json) => ResponseRegister(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        required this.token,
        required this.name,
    });

    String token;
    String name;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
    };
}
