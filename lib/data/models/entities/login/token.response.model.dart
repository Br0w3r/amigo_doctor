// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

TokenModel tokenModelFromJson(String str) =>
    TokenModel.fromJson(json.decode(str));

List<NavElement> navElementFromJson(String str) =>
    List<NavElement>.from(json.decode(str).map((x) => NavElement.fromJson(x)));

Usr usrModelFromJson(String str) => Usr.fromJson(json.decode(str));
String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  String? iat;
  dynamic fat;
  String? message;
  String? messageError;
  int? idp;
  List<NavElement>? nav;
  Usr? usr;

  TokenModel({
    this.iat,
    this.fat,
    this.message,
    this.messageError,
    this.idp,
    this.nav,
    this.usr,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        iat: json["iat"],
        fat: json["fat"],
        message: json["message"],
        messageError: json["mensaje"],
        idp: json["idp"],
        nav: json["nav"] == null
            ? []
            : List<NavElement>.from(
                json["nav"]!.map((x) => NavElement.fromJson(x))),
        usr: json["usr"] == null ? null : Usr.fromJson(json["usr"]),
      );

  Map<String, dynamic> toJson() => {
        "iat": iat,
        "fat": fat,
        "message": message,
        "mensaje": messageError,
        "nav":
            nav == null ? [] : List<dynamic>.from(nav!.map((x) => x.toJson())),
        "usr": usr?.toJson(),
      };
}

class NavElement {
  String? id;
  int? order;
  String? icon;
  String? label;
  bool? disabled;
  String? modulo;
  String? slug;
  List<Subnavigation>? subnavigation;
  Widget? page;
  bool? counter;
  String? counterFn;

  NavElement({
    this.id,
    this.order,
    this.icon,
    this.label,
    this.slug,
    this.modulo,
    this.page,
    this.disabled,
    this.subnavigation,
    this.counter,
    this.counterFn,
  });

  factory NavElement.fromJson(Map<String, dynamic> json) => NavElement(
        id: json["id"],
        order: json["order"],
        icon: json["icon"],
        label: json["label"],
        slug: json["slug"],
        page: Container(),
        modulo: json["modulo"],
        disabled: json["disabled"] ?? true,
        subnavigation: json["subnavigation"] == null
            ? []
            : List<Subnavigation>.from(
                json["subnavigation"]!.map((x) => Subnavigation.fromJson(x))),
        counter: json["counter"],
        counterFn: json["counter_fn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order": order,
        "icon": icon,
        "label": label,
        "slug": slug,
        "modulo": modulo,
        "disabled": disabled,
        "subnavigation": subnavigation == null
            ? []
            : List<dynamic>.from(subnavigation!.map((x) => x.toJson())),
        "counter": counter,
        "counter_fn": counterFn,
      };
}

class Subnavigation {
  String? id;
  String? icon;
  dynamic label;
  dynamic slug;
  bool? counter;
  List<Section>? sections;

  Subnavigation({
    this.id,
    this.icon,
    this.label,
    this.slug,
    this.counter,
    this.sections,
  });

  factory Subnavigation.fromJson(Map<String, dynamic> json) => Subnavigation(
        id: json["id"],
        icon: json["icon"],
        label: json["label"],
        slug: json["slug"],
        counter: json["counter"],
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "label": label,
        "slug": slug,
        "counter": counter,
        "sections": sections == null
            ? []
            : List<dynamic>.from(sections!.map((x) => x.toJson())),
      };
}

class Section {
  String? id;
  String? label;
  String? slug;
  bool? counter;
  String? counterFn;

  Section({
    this.id,
    this.label,
    this.slug,
    this.counter,
    this.counterFn,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        label: json["label"],
        slug: json["slug"],
        counter: json["counter"],
        counterFn: json["counter_fn"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "slug": slug,
        "counter": counter,
        "counter_fn": counterFn,
      };
}

class Usr {
  String? nombre;
  String? primerApellido;
  String? rol;
  Opciones? opciones;

  Usr({
    this.nombre,
    this.primerApellido,
    this.rol,
    this.opciones,
  });

  factory Usr.fromJson(Map<String, dynamic> json) => Usr(
        nombre: json["nombre"],
        primerApellido: json["primer_apellido"],
        rol: json["rol"],
        opciones: json["opciones"] == null
            ? null
            : Opciones.fromJson(json["opciones"]),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "primer_apellido": primerApellido,
        "rol": rol,
        "opciones": opciones?.toJson(),
      };
}

class Opciones {
  OpcionesNav? nav;
  String? idr;

  Opciones({
    this.nav,
    this.idr,
  });

  factory Opciones.fromJson(Map<String, dynamic> json) => Opciones(
        nav: json["nav"] == null ? null : OpcionesNav.fromJson(json["nav"]),
        idr: json["idr"],
      );

  Map<String, dynamic> toJson() => {
        "nav": nav?.toJson(),
        "idr": idr,
      };
}

class OpcionesNav {
  bool? inicio;
  bool? sitios;
  bool? sims;
  bool? catalogos;

  OpcionesNav({
    this.inicio,
    this.sitios,
    this.sims,
    this.catalogos,
  });

  factory OpcionesNav.fromJson(Map<String, dynamic> json) => OpcionesNav(
        inicio: json["inicio"],
        sitios: json["sitios"],
        sims: json["sims"],
        catalogos: json["catalogos"],
      );

  Map<String, dynamic> toJson() => {
        "inicio": inicio,
        "sitios": sitios,
        "sims": sims,
        "catalogos": catalogos,
      };
}
