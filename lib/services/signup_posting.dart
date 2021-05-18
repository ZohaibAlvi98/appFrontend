// To parse this JSON data, do
//
//     final signUpPosting = signUpPostingFromJson(jsonString);

import 'dart:convert';

SignUpPosting signUpPostingFromJson(String str) =>
    SignUpPosting.fromJson(json.decode(str));

String signUpPostingToJson(SignUpPosting data) => json.encode(data.toJson());

class SignUpPosting {
  SignUpPosting({
    this.code,
    this.id,
    this.message,
  });

  int code;
  int id;
  String message;

  factory SignUpPosting.fromJson(Map<String, dynamic> json) => SignUpPosting(
        code: json["code"],
        id: json["id"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'id': id,
        'message': message,
      };
}
