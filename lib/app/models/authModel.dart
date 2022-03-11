import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    required this.email,
    required this.idToken,
  });

  String email;
  String idToken;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        email: json["email"].toString(),
        idToken: json["idToken"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "idToken": idToken,
      };
}
