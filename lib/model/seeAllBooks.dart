// To parse this JSON data, do
//
//     final searchBooks = searchBooksFromJson(jsonString);

import 'dart:convert';

SearchBooks searchBooksFromJson(String str) =>
    SearchBooks.fromJson(json.decode(str));

String searchBooksToJson(SearchBooks data) => json.encode(data.toJson());

class SearchBooks {
  SearchBooks({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Book> data;
  String message;

  factory SearchBooks.fromJson(Map<String, dynamic> json) => SearchBooks(
        success: json["success"],
        data: List<Book>.from(json["data"].map((x) => Book.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Book {
  Book(
      {required this.id,
      required this.type,
      required this.name,
      required this.category,
      required this.writer,
      required this.userId,
      required this.createdAt,
      required this.updatedAt,
      required this.user,
      required this.photo});

  int id;
  String name;
  String category;
  String writer;
  int userId;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  String photo;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
      id: json["id"],
      type: json["type"],
      name: json["name"],
      category: json["category"],
      writer: json["writer"],
      userId: json["user_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      user: User.fromJson(json["user"]),
      photo: json["photo_url"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "writer": writer,
        "type": type,
        "user_id": userId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.location,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
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
