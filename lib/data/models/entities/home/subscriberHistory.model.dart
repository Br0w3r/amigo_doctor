import 'dart:convert';

SubscriberHistory subscriberHistoryFromJson(String str) =>
    SubscriberHistory.fromJson(json.decode(str));

String subscriberHistoryToJson(SubscriberHistory data) =>
    json.encode(data.toJson());

class SubscriberHistory {
  List<Result>? results;
  int? total;
  int? totalFiltered;
  int? totalDisplay;

  SubscriberHistory({
    this.results,
    this.total,
    this.totalFiltered,
    this.totalDisplay,
  });

  factory SubscriberHistory.fromJson(Map<String, dynamic> json) =>
      SubscriberHistory(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
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

class Result {
  String? folio;
  DateTime? rechargeDate;
  DateTime? effectiveDate;
  DateTime? expirationDate;
  String? msisdn;
  Offer? offer;
  int? amount;
  String? tx;
  bool? expired;
  bool? approved;
  String? cycle;

  Result({
    this.folio,
    this.rechargeDate,
    this.effectiveDate,
    this.expirationDate,
    this.msisdn,
    this.offer,
    this.amount,
    this.tx,
    this.expired,
    this.approved,
    this.cycle,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        folio: json["folio"],
        rechargeDate: json["recharge_date"] == null
            ? null
            : DateTime.parse(json["recharge_date"]),
        effectiveDate:
            json["effective_date"] == null || json["effective_date"] == ""
                ? null
                : DateTime.parse(json["effective_date"]),
        expirationDate:
            json["expiration_date"] == null || json["expiration_date"] == ""
                ? null
                : DateTime.parse(json["expiration_date"]),
        msisdn: json["msisdn"],
        offer: json["offer"] == null ? null : Offer.fromJson(json["offer"]),
        amount: json["amount"],
        tx: json["tx"],
        expired: json["expired"],
        approved: json["approved"],
        cycle: json["cycle"],
      );

  Map<String, dynamic> toJson() => {
        "folio": folio,
        "recharge_date": rechargeDate?.toIso8601String(),
        "effective_date": effectiveDate,
        "expiration_date": expirationDate,
        "msisdn": msisdn,
        "offer": offer?.toJson(),
        "amount": amount,
        "tx": tx,
        "expired": expired,
        "approved": approved,
        "cycle": cycle,
      };
}

class Offer {
  String? code;
  String? name;
  String? brand;

  Offer({
    this.code,
    this.name,
    this.brand,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        code: json["code"],
        name: json["name"],
        brand: json["brand"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "brand": brand,
      };
}
