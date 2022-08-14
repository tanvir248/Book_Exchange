// To parse this JSON data, do
//
//     final searchBooks = searchBooksFromJson(jsonString);

import 'dart:convert';

SearchBooks searchBooksFromJson(String str) => SearchBooks.fromJson(json.decode(str));

String searchBooksToJson(SearchBooks data) => json.encode(data.toJson());

class SearchBooks {
    SearchBooks({
      required  this.success,
      required  this.data,
      required  this.message,
    });

    bool success;
    List<Datum> data;
    String message;

    factory SearchBooks.fromJson(Map<String, dynamic> json) => SearchBooks(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    Datum({
       required this.id,
        required this.name,
        required this.category,
        required this.writer,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
    });

    int id;
    String name;
    String category;
    String writer;
    int userId;
    DateTime createdAt;
    DateTime updatedAt;
    User user;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        writer: json["writer"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "writer": writer,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
    };
}

class User {
    User({
      required  this.id,
      required  this.name,
      required  this.location,
      required  this.phone,
      required  this.email,
      required  this.createdAt,
      required  this.updatedAt,
    });

    int id;
    String name;
    String location;
    String phone;
    String email;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        phone: json["phone"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "phone": phone,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
