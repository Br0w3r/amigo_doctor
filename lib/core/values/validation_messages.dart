import 'package:reactive_forms/reactive_forms.dart';

Map<String, String Function(Object)>? validationMessages(int? minLength, int? maxLength, {String? equals="No Hay coincidencia"}) =>
    {
      ValidationMessage.required: (e) => 'El campo se encuentra vacío',
      ValidationMessage.minLength: (e) => minLength != null
          ? "Mínimo $minLength Caracteres"
          : "Mínimo de Caracteres",
      ValidationMessage.maxLength: (e) => maxLength != null
          ? "Máximo $maxLength Caracteres"
          : "Máximo de Caracteres",
      ValidationMessage.number: (e) => "Solo se Admiten Números en Unidad",
      ValidationMessage.email: (e) => "Ingrese un correo válido",
      ValidationMessage.mustMatch: (e)=> equals??"No Hay coincidencia", "ccidRange": (e)=> "El ICCID es Mayor al inicial"
    };
class ValidationMessages {
      static const String upperCase = "Debes agregar al menos una letra Mayúscula";
      static const String lowercase = "Debes agregar al menos una letra Minúscula";
      static const String symbol = "Debes agregar al menos un símbolo";
}