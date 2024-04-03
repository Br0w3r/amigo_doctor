
import 'package:amigo_doctor/core/values/validation_messages.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormsUtils {

  static ValidatorFunction mustMatch(String controlName, String matchingControlName) {
    return (AbstractControl<dynamic> control) {
      final form = control as FormGroup;

      final formControl = form.control(controlName);
      final matchingFormControl = form.control(matchingControlName);

      if (formControl.value != matchingFormControl.value) {
        matchingFormControl.setErrors({'mustMatch': true});

        // force messages to show up as soon as possible
        matchingFormControl.markAsTouched();
      } else {
        matchingFormControl.removeError('mustMatch');
      }
      return null;
    };
  }

  static ValidatorFunction haveLowerCase(){
     return (value) {
      if (!RegExp(r'[a-z]').hasMatch(value.value ?? '')) {
        return {ValidationMessages.lowercase: true};
      }
      return null;
    };
  }

  static ValidatorFunction haveUpperCase(){
    return (value) {
      if (!RegExp(r'[A-Z]').hasMatch(value.value ?? '')) {
        return {ValidationMessages.upperCase: true};
      }
      return null;
    };
  }

  static ValidatorFunction haveSymbol(){
    return (value) {
      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value.value ?? '')) {
        return {ValidationMessages.symbol: true};
      }
      return null;
    };
  }
}
