import 'dart:convert';

CredentialModel credentialModelFromJson(String str) =>
    CredentialModel.fromJson(json.decode(str));

String credentialModelToJson(CredentialModel data) =>
    json.encode(data.toJson());

class CredentialModel {
  CredentialModel({this.username, this.password, this.isRemember});

  String? username;
  String? password;
  bool? isRemember;

  factory CredentialModel.fromJson(Map<String, dynamic> json) =>
      CredentialModel(
        username: json["usuario"],
        password: json["contrasenia"],
        isRemember: json["isRemember"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": username,
        "contrasenia": password,
        "isRemember": isRemember,
      };
  Map<String, dynamic> toJsonUser() => {
    "usuario": username
  };
  Map<String, dynamic> toJsonPass() => {
    "contrasenia": password
  };
}
