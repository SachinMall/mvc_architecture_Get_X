// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    String email;
    String mobile;
    String password;
    String name;
    String gender;

    SignUpModel({
        required this.email,
        required this.mobile,
        required this.password,
        required this.name,
        required this.gender,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        name: json["name"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "mobile": mobile,
        "password": password,
        "name": name,
        "gender": gender,
    };
}
