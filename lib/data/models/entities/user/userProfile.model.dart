// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  int? id;
  String? username;
  Member? member;

  UserProfileModel({
    this.id,
    this.username,
    this.member,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        username: json["username"],
        member: json["member"] == null ? null : Member.fromJson(json["member"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "member": member?.toJson(),
      };
}

class Member {
  int? id;
  int? membershipNum;
  String? name;
  String? firstSurname;
  String? secondSurname;
  String? email;
  String? sex;
  int? age;
  String? cveState;
  String? state;
  bool? accountActive;
  Address? address;
  String? curp;
  String? birthDate;
  String? curpTutor;
  bool? anonymous;

  Member({
    this.id,
    this.membershipNum,
    this.name,
    this.firstSurname,
    this.secondSurname,
    this.email,
    this.sex,
    this.age,
    this.cveState,
    this.state,
    this.accountActive,
    this.address,
    this.curp,
    this.birthDate,
    this.curpTutor,
    this.anonymous,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        membershipNum: json["membership_num"],
        name: json["name"],
        firstSurname: json["first_surname"],
        secondSurname: json["second_surname"],
        email: json["email"],
        sex: json["sex"],
        age: json["age"],
        cveState: json["cve_state"],
        state: json["state"],
        accountActive: json["account_active"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        curp: json["curp"],
        birthDate: json["birth_date"],
        curpTutor: json["curp_tutor"],
        anonymous: json["anonymous"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "membership_num": membershipNum,
        "name": name,
        "first_surname": firstSurname,
        "second_surname": secondSurname,
        "email": email,
        "sex": sex,
        "age": age,
        "cve_state": cveState,
        "state": state,
        "account_active": accountActive,
        "address": address?.toJson(),
        "curp": curp,
        "birth_date": birthDate,
        "curp_tutor": curpTutor,
        "anonymous": anonymous,
      };
}

class Address {
  Address();

  factory Address.fromJson(Map<String, dynamic> json) => Address();

  Map<String, dynamic> toJson() => {};
}
