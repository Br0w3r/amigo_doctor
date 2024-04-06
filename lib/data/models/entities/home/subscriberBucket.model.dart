// To parse this JSON data, do
//
//     final subscriberBucket = subscriberBucketFromJson(jsonString);

import 'dart:convert';

SubscriberBucket subscriberBucketFromJson(String str) =>
    SubscriberBucket.fromJson(json.decode(str));

String subscriberBucketToJson(SubscriberBucket data) =>
    json.encode(data.toJson());

class SubscriberBucket {
  FreeUnits? minutes;
  FreeUnits? sms;
  bool? hasOffer;
  dynamic msisdnStatus;
  dynamic descriptionStatus;
  dynamic hasPromo;
  FreeUnits? freeUnits;
  Offers? offers;
  String? lastTicketAmount;

  SubscriberBucket({
    this.minutes,
    this.sms,
    this.hasOffer,
    this.msisdnStatus,
    this.descriptionStatus,
    this.hasPromo,
    this.freeUnits,
    this.offers,
    this.lastTicketAmount,
  });

  factory SubscriberBucket.fromJson(Map<String, dynamic> json) =>
      SubscriberBucket(
        minutes: json["minutes"] == null
            ? null
            : FreeUnits.fromJson(json["minutes"]),
        sms: json["sms"] == null ? null : FreeUnits.fromJson(json["sms"]),
        hasOffer: json["has_offer"],
        msisdnStatus: json["msisdn_status"],
        descriptionStatus: json["description_status"],
        hasPromo: json["has_promo"],
        freeUnits: json["free_units"] == null
            ? null
            : FreeUnits.fromJson(json["free_units"]),
        offers: json["offers"] == null ? null : Offers.fromJson(json["offers"]),
        lastTicketAmount: json["last_ticket_amount"],
      );

  Map<String, dynamic> toJson() => {
        "minutes": minutes?.toJson(),
        "sms": sms?.toJson(),
        "has_offer": hasOffer,
        "msisdn_status": msisdnStatus,
        "description_status": descriptionStatus,
        "has_promo": hasPromo,
        "free_units": freeUnits?.toJson(),
        "offers": offers?.toJson(),
        "last_ticket_amount": lastTicketAmount,
      };
}

class FreeUnits {
  int? totalAmount;
  int? unusedAmount;
  int? consumedAmount;
  int? renderAmount;
  DateTime? effectiveDate;
  DateTime? expireDate;

  FreeUnits({
    this.totalAmount,
    this.unusedAmount,
    this.consumedAmount,
    this.renderAmount,
    this.effectiveDate,
    this.expireDate,
  });

  factory FreeUnits.fromJson(Map<String, dynamic> json) => FreeUnits(
        totalAmount: json["total_amount"],
        unusedAmount: json["unused_amount"],
        consumedAmount: json["consumed_amount"],
        renderAmount: json["render_amount"],
        effectiveDate: json["effective_date"] == null
            ? null
            : DateTime.parse(json["effective_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
      );

  Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
        "unused_amount": unusedAmount,
        "consumed_amount": consumedAmount,
        "render_amount": renderAmount,
        "effective_date":
            "${effectiveDate!.year.toString().padLeft(4, '0')}-${effectiveDate!.month.toString().padLeft(2, '0')}-${effectiveDate!.day.toString().padLeft(2, '0')}",
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
      };
}

class Offers {
  The202204100631271809934006? the202204100631271809934006;
  The202204100631271709934006? the202204100631271709934006;
  The202204091938011? the202204091938011809934008;
  The202204091938011? the202204091938011609934000;

  Offers({
    this.the202204100631271809934006,
    this.the202204100631271709934006,
    this.the202204091938011809934008,
    this.the202204091938011609934000,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        the202204100631271809934006: json["20220410063127_1809934006"] == null
            ? null
            : The202204100631271809934006.fromJson(
                json["20220410063127_1809934006"]),
        the202204100631271709934006: json["20220410063127_1709934006"] == null
            ? null
            : The202204100631271709934006.fromJson(
                json["20220410063127_1709934006"]),
        the202204091938011809934008: json["20220409193801_1809934008"] == null
            ? null
            : The202204091938011.fromJson(json["20220409193801_1809934008"]),
        the202204091938011609934000: json["20220409193801_1609934000"] == null
            ? null
            : The202204091938011.fromJson(json["20220409193801_1609934000"]),
      );

  Map<String, dynamic> toJson() => {
        "20220410063127_1809934006": the202204100631271809934006?.toJson(),
        "20220410063127_1709934006": the202204100631271709934006?.toJson(),
        "20220409193801_1809934008": the202204091938011809934008?.toJson(),
        "20220409193801_1609934000": the202204091938011609934000?.toJson(),
      };
}

class The202204091938011 {
  String? offeringId;
  String? purchaseSecuence;
  String? tradename;
  String? category;
  bool? tethering;
  DateTime? effectiveDate;
  DateTime? expireDate;
  The202204091938011609934000Details? details;

  The202204091938011({
    this.offeringId,
    this.purchaseSecuence,
    this.tradename,
    this.category,
    this.tethering,
    this.effectiveDate,
    this.expireDate,
    this.details,
  });

  factory The202204091938011.fromJson(Map<String, dynamic> json) =>
      The202204091938011(
        offeringId: json["offering_id"],
        purchaseSecuence: json["purchase_secuence"],
        tradename: json["tradename"],
        category: json["category"],
        tethering: json["tethering"],
        effectiveDate: json["effective_date"] == null
            ? null
            : DateTime.parse(json["effective_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        details: json["details"] == null
            ? null
            : The202204091938011609934000Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "offering_id": offeringId,
        "purchase_secuence": purchaseSecuence,
        "tradename": tradename,
        "category": category,
        "tethering": tethering,
        "effective_date": effectiveDate?.toIso8601String(),
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "details": details?.toJson(),
      };
}

class The202204091938011609934000Details {
  Data? data;

  The202204091938011609934000Details({
    this.data,
  });

  factory The202204091938011609934000Details.fromJson(
          Map<String, dynamic> json) =>
      The202204091938011609934000Details(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  int? initialAmount;
  double? unusedAmount;
  double? consumedAmount;
  List<DataDetail>? details;

  Data({
    this.initialAmount,
    this.unusedAmount,
    this.consumedAmount,
    this.details,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        initialAmount: json["initial_amount"],
        unusedAmount: json["unused_amount"]?.toDouble(),
        consumedAmount: json["consumed_amount"]?.toDouble(),
        details: json["details"] == null
            ? []
            : List<DataDetail>.from(
                json["details"]!.map((x) => DataDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "initial_amount": initialAmount,
        "unused_amount": unusedAmount,
        "consumed_amount": consumedAmount,
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class DataDetail {
  String? name;
  String? category;
  int? initialAmount;
  double? unusedAmount;
  double? consumedAmount;

  DataDetail({
    this.name,
    this.category,
    this.initialAmount,
    this.unusedAmount,
    this.consumedAmount,
  });

  factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
        name: json["name"],
        category: json["category"],
        initialAmount: json["initial_amount"],
        unusedAmount: json["unused_amount"]?.toDouble(),
        consumedAmount: json["consumed_amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "initial_amount": initialAmount,
        "unused_amount": unusedAmount,
        "consumed_amount": consumedAmount,
      };
}

class The202204100631271709934006 {
  String? offeringId;
  String? purchaseSecuence;
  String? tradename;
  String? category;
  bool? tethering;
  DateTime? effectiveDate;
  DateTime? expireDate;
  The202204100631271709934006Details? details;

  The202204100631271709934006({
    this.offeringId,
    this.purchaseSecuence,
    this.tradename,
    this.category,
    this.tethering,
    this.effectiveDate,
    this.expireDate,
    this.details,
  });

  factory The202204100631271709934006.fromJson(Map<String, dynamic> json) =>
      The202204100631271709934006(
        offeringId: json["offering_id"],
        purchaseSecuence: json["purchase_secuence"],
        tradename: json["tradename"],
        category: json["category"],
        tethering: json["tethering"],
        effectiveDate: json["effective_date"] == null
            ? null
            : DateTime.parse(json["effective_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        details: json["details"] == null
            ? null
            : The202204100631271709934006Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "offering_id": offeringId,
        "purchase_secuence": purchaseSecuence,
        "tradename": tradename,
        "category": category,
        "tethering": tethering,
        "effective_date": effectiveDate?.toIso8601String(),
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "details": details?.toJson(),
      };
}

class The202204100631271709934006Details {
  Redirect? redirect;

  The202204100631271709934006Details({
    this.redirect,
  });

  factory The202204100631271709934006Details.fromJson(
          Map<String, dynamic> json) =>
      The202204100631271709934006Details(
        redirect: json["redirect"] == null
            ? null
            : Redirect.fromJson(json["redirect"]),
      );

  Map<String, dynamic> toJson() => {
        "redirect": redirect?.toJson(),
      };
}

class Redirect {
  int? initialAmount;
  int? unusedAmount;
  int? consumedAmount;
  List<RedirectDetail>? details;

  Redirect({
    this.initialAmount,
    this.unusedAmount,
    this.consumedAmount,
    this.details,
  });

  factory Redirect.fromJson(Map<String, dynamic> json) => Redirect(
        initialAmount: json["initial_amount"],
        unusedAmount: json["unused_amount"],
        consumedAmount: json["consumed_amount"],
        details: json["details"] == null
            ? []
            : List<RedirectDetail>.from(
                json["details"]!.map((x) => RedirectDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "initial_amount": initialAmount,
        "unused_amount": unusedAmount,
        "consumed_amount": consumedAmount,
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toJson())),
      };
}

class RedirectDetail {
  String? name;
  String? category;
  DateTime? effectiveDate;
  DateTime? expireDate;
  int? initialAmount;
  int? unusedAmount;
  int? consumedAmount;

  RedirectDetail({
    this.name,
    this.category,
    this.effectiveDate,
    this.expireDate,
    this.initialAmount,
    this.unusedAmount,
    this.consumedAmount,
  });

  factory RedirectDetail.fromJson(Map<String, dynamic> json) => RedirectDetail(
        name: json["name"],
        category: json["category"],
        effectiveDate: json["effective_date"] == null
            ? null
            : DateTime.parse(json["effective_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        initialAmount: json["initial_amount"],
        unusedAmount: json["unused_amount"],
        consumedAmount: json["consumed_amount"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "effective_date": effectiveDate?.toIso8601String(),
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "initial_amount": initialAmount,
        "unused_amount": unusedAmount,
        "consumed_amount": consumedAmount,
      };
}

class The202204100631271809934006 {
  String? offeringId;
  String? purchaseSecuence;
  String? tradename;
  String? category;
  bool? tethering;
  DateTime? effectiveDate;
  DateTime? expireDate;
  The202204100631271809934006Details? details;

  The202204100631271809934006({
    this.offeringId,
    this.purchaseSecuence,
    this.tradename,
    this.category,
    this.tethering,
    this.effectiveDate,
    this.expireDate,
    this.details,
  });

  factory The202204100631271809934006.fromJson(Map<String, dynamic> json) =>
      The202204100631271809934006(
        offeringId: json["offering_id"],
        purchaseSecuence: json["purchase_secuence"],
        tradename: json["tradename"],
        category: json["category"],
        tethering: json["tethering"],
        effectiveDate: json["effective_date"] == null
            ? null
            : DateTime.parse(json["effective_date"]),
        expireDate: json["expire_date"] == null
            ? null
            : DateTime.parse(json["expire_date"]),
        details: json["details"] == null
            ? null
            : The202204100631271809934006Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "offering_id": offeringId,
        "purchase_secuence": purchaseSecuence,
        "tradename": tradename,
        "category": category,
        "tethering": tethering,
        "effective_date": effectiveDate?.toIso8601String(),
        "expire_date":
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
        "details": details?.toJson(),
      };
}

class The202204100631271809934006Details {
  Redirect? sms;
  Redirect? minutes;
  Redirect? throttling;

  The202204100631271809934006Details({
    this.sms,
    this.minutes,
    this.throttling,
  });

  factory The202204100631271809934006Details.fromJson(
          Map<String, dynamic> json) =>
      The202204100631271809934006Details(
        sms: json["sms"] == null ? null : Redirect.fromJson(json["sms"]),
        minutes:
            json["minutes"] == null ? null : Redirect.fromJson(json["minutes"]),
        throttling: json["throttling"] == null
            ? null
            : Redirect.fromJson(json["throttling"]),
      );

  Map<String, dynamic> toJson() => {
        "sms": sms?.toJson(),
        "minutes": minutes?.toJson(),
        "throttling": throttling?.toJson(),
      };
}
