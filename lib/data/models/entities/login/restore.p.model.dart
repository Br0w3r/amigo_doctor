class RestorePModel {
  RestorePModel({
      this.contraseniaActual, 
      this.contraseniaNueva,});

  RestorePModel.fromJson(dynamic json) {
    contraseniaActual = json['contraseniaActual'];
    contraseniaNueva = json['contraseniaNueva'];
  }
  String? contraseniaActual;
  String? contraseniaNueva;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contraseniaActual'] = contraseniaActual;
    map['contraseniaNueva'] = contraseniaNueva;
    return map;
  }

}