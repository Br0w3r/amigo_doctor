import 'dart:convert';
import 'dart:io';
import 'package:amigo_doctor/app/utils/snackBar.utils.dart';
import 'package:amigo_doctor/app/utils/storage.utils.dart';
import 'package:amigo_doctor/core/values/keys.dart';
import 'package:amigo_doctor/data/services/base.service.dart';
import 'package:amigo_doctor/data/services/login/login.contract.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginApiService extends BaseService implements ILoginService {
  @override
  Future<bool> signIn() async {
    bool isSuccess = false;

    try {
      GithubAuthProvider githubAuthProvider = GithubAuthProvider();
      var userCredential =
          await FirebaseAuth.instance.signInWithProvider(githubAuthProvider);
      debugPrintStack(
          stackTrace: StackTrace.current,
          label: userCredential.user.toString(),
          maxFrames: 2);
      if (userCredential.user != null) {
        isSuccess = true;

        //Save Token
        LocalStorageUtils.setStringKey(
          Keys.tokenUser,
          userCredential.credential!.accessToken!,
        );

        var userMap = {
          'uid': userCredential.user!.uid,
          'email': userCredential.user!.email,
          'displayName': userCredential.user!.displayName,
          'photoURL': userCredential.user!.photoURL,
          'phoneNumber': userCredential.user!.phoneNumber,
        };

        //Save User
        LocalStorageUtils.setStringKey(
          Keys.userInfo,
          jsonEncode(userMap),
        );
      }

      return isSuccess;
    } on SocketException catch (_) {
      isSuccess;
    } catch (error) {
      if (error is FirebaseException) {
        debugPrintStack(
            stackTrace: StackTrace.current,
            label: error.toString(),
            maxFrames: 2);
        switch (error.code) {
          case "unknown":
            SnackBarUtils.advertence(
                "Lo sentimos, pero el tiempo de espera se ha excedido. Por favor, inténtalo de nuevo más tarde o verifica tu conexión a internet. Si el problema persiste, comunícate con el soporte técnico para obtener ayuda.");
            break;
          case "web-context-canceled":
            SnackBarUtils.advertence("Proceso cancelado.");
            break;
          case "invalid-cert-hash":
            SnackBarUtils.advertence("Certificado Incorrecto.");
          default:
            SnackBarUtils.advertence(error.code);
        }
      }
    }

    return isSuccess;
  }
}
