// To parse this JSON data, do
//
//     final subscriber = subscriberFromJson(jsonString);

import 'dart:convert';

Subscriber subscriberFromJson(String str) =>
    Subscriber.fromJson(json.decode(str));

String subscriberToJson(Subscriber data) => json.encode(data.toJson());

class Subscriber {
  List<ResultSubscribeModel>? results;
  int? total;
  int? totalFiltered;
  int? totalDisplay;

  Subscriber({
    this.results,
    this.total,
    this.totalFiltered,
    this.totalDisplay,
  });

  factory Subscriber.fromJson(Map<String, dynamic> json) => Subscriber(
        results: json["results"] == null
            ? []
            : List<ResultSubscribeModel>.from(
                json["results"]!.map((x) => ResultSubscribeModel.fromJson(x))),
        total: json["total"],
        totalFiltered: json["total_filtered"],
        totalDisplay: json["total_display"],
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total": total,
        "total_filtered": totalFiltered,
        "total_display": totalDisplay,
      };
}

class ResultSubscribeModel {
  int? num;
  String? alias;
  bool? main;
  String? createdAt;
  String? updatedAt;
  Portability? status;
  Sim? sim;
  Device? device;
  LastOffer? lastOffer;
  Portability? portability;

  ResultSubscribeModel({
    this.num,
    this.alias,
    this.main,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.sim,
    this.device,
    this.lastOffer,
    this.portability,
  });

  factory ResultSubscribeModel.fromJson(Map<String, dynamic> json) => ResultSubscribeModel(
        num: json["num"],
        alias: json["alias"],
        main: json["main"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        status: json["status"] == null
            ? null
            : Portability.fromJson(json["status"]),
        sim: json["sim"] == null ? null : Sim.fromJson(json["sim"]),
        device: json["device"] == null ? null : Device.fromJson(json["device"]),
        lastOffer: json["last_offer"] == null
            ? null
            : LastOffer.fromJson(json["last_offer"]),
        portability: json["portability"] == null
            ? null
            : Portability.fromJson(json["portability"]),
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "alias": alias,
        "main": main,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "status": status?.toJson(),
        "sim": sim?.toJson(),
        "device": device?.toJson(),
        "last_offer": lastOffer?.toJson(),
        "portability": portability?.toJson(),
      };
}

class Device {
  String? imei;
  String? model;
  String? brand;
  bool? blocked;

  Device({
    this.imei,
    this.model,
    this.brand,
    this.blocked,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        imei: json["imei"],
        model: json["model"],
        brand: json["brand"],
        blocked: json["blocked"],
      );

  Map<String, dynamic> toJson() => {
        "imei": imei,
        "model": model,
        "brand": brand,
        "blocked": blocked,
      };
}

class LastOffer {
  String? folio;
  String? createdAt;
  String? effectiveDate;
  String? expirationDate;
  String? duration;
  bool? renewal;
  bool? expired;
  bool? approved;
  String? cycle;

  LastOffer({
    this.folio,
    this.createdAt,
    this.effectiveDate,
    this.expirationDate,
    this.duration,
    this.renewal,
    this.expired,
    this.approved,
    this.cycle,
  });

  factory LastOffer.fromJson(Map<String, dynamic> json) => LastOffer(
        folio: json["folio"],
        createdAt: json["created_at"],
        effectiveDate: json["effective_date"],
        expirationDate: json["expiration_date"],
        duration: json["duration"],
        renewal: json["renewal"],
        expired: json["expired"],
        approved: json["approved"],
        cycle: json["cycle"],
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "created_at": createdAt,
        "effective_date": effectiveDate,
        "expiration_date": expirationDate,
        "duration": duration,
        "renewal": renewal,
        "expired": expired,
        "approved": approved,
        "cycle": cycle,
      };
}

class Portability {
  String? code;
  String? description;

  Portability({
    this.code,
    this.description,
  });

  factory Portability.fromJson(Map<String, dynamic> json) => Portability(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}

class Sim {
  String? contractNumber;
  String? icc;
  String? imsi;
  String? msisdn;

  Sim({
    this.contractNumber,
    this.icc,
    this.imsi,
    this.msisdn,
  });

  factory Sim.fromJson(Map<String, dynamic> json) => Sim(
        contractNumber: json["contract_number"],
        icc: json["icc"],
        imsi: json["imsi"],
        msisdn: json["msisdn"],
      );

  Map<String, dynamic> toJson() => {
        "contract_number": contractNumber,
        "icc": icc,
        "imsi": imsi,
        "msisdn": msisdn,
      };
}
