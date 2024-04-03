import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));
String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.usuarioId,
    this.empleadoId,
    this.fotoPerfilId,
    this.nombreUsuario,
    this.numeroEmpleado,
    this.nombre,
    this.correoElectronico,
    this.telefonoMovil,
    this.fechaNacimiento,
    this.usuarioClientes,
    this.weekPack,
    this.vigency,
  });

  int? usuarioId;
  int? empleadoId;
  int? fotoPerfilId;
  String? nombreUsuario;
  String? numeroEmpleado;
  String? nombre;
  String? correoElectronico;
  String? telefonoMovil;
  DateTime? fechaNacimiento;
  String? weekPack;
  DateTime? vigency;
  List<UsuarioCliente>? usuarioClientes;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        usuarioId: json["usuarioId"] ?? "",
        empleadoId: json["empleadoId"] ?? "",
        fotoPerfilId: json["fotoPerfilId"] ?? "",
        nombreUsuario: json["nombreUsuario"] ?? "",
        numeroEmpleado: json["numeroEmpleado"] ?? "",
        nombre: json["nombre"] ?? "",
        correoElectronico: json["correoElectronico"] ?? "",
        telefonoMovil: json["telefonoMovil"] ?? "",
        fechaNacimiento:
            DateTime.parse(json["fechaNacimiento"] ?? "1900-01-01"),
        usuarioClientes: json["usuarioClientes"] != null
            ? List<UsuarioCliente>.from(
                json["usuarioClientes"].map((x) => UsuarioCliente.fromJson(x)))
            : [],
        weekPack: json["weekPack"] ?? "",
        vigency: DateTime.parse(json["vigenciaPaquete"] ?? "1900-01-01"),
      );

  factory UserModel.fromVoid() => UserModel(
        usuarioId: 0,
        empleadoId: 0,
        fotoPerfilId: 0,
        nombreUsuario: "",
        numeroEmpleado: "",
        nombre: "",
        correoElectronico: "",
        telefonoMovil: "",
        fechaNacimiento: DateTime(0),
        usuarioClientes: [],
        weekPack: "",
        vigency: DateTime(0),
      );

  Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "empleadoId": empleadoId,
        "fotoPerfilId": fotoPerfilId,
        "nombreUsuario": nombreUsuario,
        "numeroEmpleado": numeroEmpleado,
        "nombre": nombre,
        "correoElectronico": correoElectronico,
        "telefonoMovil": telefonoMovil,
        "fechaNacimiento": fechaNacimiento!.toIso8601String(),
        "usuarioClientes":
            List<dynamic>.from(usuarioClientes!.map((x) => x.toJson())),
        "weekPack": weekPack,
        "vigency": vigency!.toIso8601String(),
      };
}

class UsuarioCliente {
  UsuarioCliente({
    this.clienteId,
    this.clienteAxId,
    this.numeroClienteAx,
    this.rfc,
    this.razonSocial,
  });

  int? clienteId;
  int? clienteAxId;
  String? numeroClienteAx;
  String? rfc;
  String? razonSocial;

  factory UsuarioCliente.fromJson(Map<String, dynamic> json) => UsuarioCliente(
        clienteId: json["clienteId"] ?? "",
        clienteAxId: json["clienteAXId"] ?? "",
        numeroClienteAx: json["numeroClienteAX"] ?? "",
        rfc: json["rfc"] ?? "",
        razonSocial: json["razonSocial"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "clienteId": clienteId,
        "clienteAXId": clienteAxId,
        "numeroClienteAX": numeroClienteAx,
        "rfc": rfc,
        "razonSocial": razonSocial,
      };
}
