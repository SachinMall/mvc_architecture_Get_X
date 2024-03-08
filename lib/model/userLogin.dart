// To parse this JSON data, do
//
//     final LoginModel = LoginModelFromJson(jsonString);

import 'dart:convert';

LoginModel LoginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String LoginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int businessUserId;
  String businessUsername;
  String email;
  String fileName;
  String translatedPdf;

  LoginModel({
    this.businessUserId = 0,
    this.businessUsername = '',
    this.email = '',
    this.fileName = '',
    this.translatedPdf = '',
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        businessUserId: json["business_user_id"] ?? 0,
        businessUsername: json["business_username"],
        email: json["email"],
        fileName: json["file_name"],
        translatedPdf: json["translated_pdf"],
      );

  Map<String, dynamic> toJson() => {
        "business_user_id": businessUserId,
        "business_username": businessUsername,
        "email": email,
        "file_name": fileName,
        "translated_pdf": translatedPdf,
      };
}
