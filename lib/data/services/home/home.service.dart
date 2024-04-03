import 'dart:convert';
import 'dart:io';
import 'package:amigo_doctor/app/utils/snackBar.utils.dart';
import 'package:amigo_doctor/app/utils/storage.utils.dart';
import 'package:amigo_doctor/core/values/keys.dart';
import 'package:amigo_doctor/data/services/base.service.dart';
import 'package:amigo_doctor/data/services/home/home.contract.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeApiService extends BaseService implements IHomeService {
  @override
  Future<bool> signIn() async {
    bool isSuccess = false;

    try {
      GithubAuthProvider githubAuthProvider = GithubAuthProvider();
      var userCredential =
          await FirebaseAuth.instance.signInWithProvider(githubAuthProvider);

      if (userCredential.user != null) {
        isSuccess = true;

        //Save Token
        LocalStorageUtils.setStringKey(
          Keys.tokenUser,
          userCredential.credential!.accessToken!,
        );

        //Save User
        LocalStorageUtils.setStringKey(
          Keys.userInfo,
          jsonEncode(userCredential.user),
        );
      }

      return isSuccess;
    } on SocketException catch (_) {
      isSuccess;
    } catch (error) {
      if (error is FirebaseException) {
        switch (error.code) {
          case "unknown":
            SnackBarUtils.advertence(
                "Lo sentimos, pero el tiempo de espera se ha excedido. Por favor, inténtalo de nuevo más tarde o verifica tu conexión a internet. Si el problema persiste, comunícate con el soporte técnico para obtener ayuda.");
            break;
          case "web-context-canceled":
            SnackBarUtils.advertence("Proceso cancelado.");
            break;
        }
      }
    }

    return isSuccess;
  }
}
