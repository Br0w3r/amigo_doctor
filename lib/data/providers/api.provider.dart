import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:amigo_doctor/app/utils/storage.utils.dart';
import 'package:amigo_doctor/core/common/exit_app.dart';
import 'package:amigo_doctor/core/values/keys.dart';
import 'package:amigo_doctor/data/models/enums/request_method.enum.dart';
import 'package:amigo_doctor/data/providers/api_exceptions.dart';

class ApiProvider {
  // Singleton
  ApiProvider._privateConstructor();
  static final ApiProvider _instance = ApiProvider._privateConstructor();
  static ApiProvider get instance => _instance;

  // ignore: prefer_typing_uninitialized_variables
  var jsonError;
  // End Singleton

  Future<dynamic> request<T>(RequestMethod method, String endPoint,
      {String body = '', bool returnFullResponse = false}) async {
    http.Response resp;

    final Uri url = Uri.parse(endPoint);

    final Map<String, String> headers = <String, String>{};
    headers.putIfAbsent('Content-Type', () => 'application/json');
    //headers.putIfAbsent("X-Authorization-Token", () => Globals.authorizationTokenHeader);

    // Get and apply token
    var token = await LocalStorageUtils.getStringByKey(Keys.tokenUser);

    if (token.isNotEmpty) {
      headers.putIfAbsent(HttpHeaders.authorizationHeader, () => token);
    }

    try {
      if (method == RequestMethod.get) {
        resp = await http.get(
          url,
          headers: headers,
        );
      } else if (method == RequestMethod.put) {
        resp = await http.put(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.patch) {
        resp = await http.patch(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.post) {
        resp = await http.post(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.delete) {
        resp = await http.delete(
          url,
          headers: headers,
        );
      } else {
        throw Exception('Otro error');
      }

      jsonError = resp;
      return _returnResponse(resp, returnFullResponse);
    } on TimeoutException catch (_) {
      throw Exception("tiempo de espera agotado, intente nuevamente");
    } on SocketException {
      throw const SocketException('Error de Conexión');
    } on Error catch (_) {
      _returnResponse(jsonError, returnFullResponse);
      throw Exception();
    } on AppException catch (_) {
      _returnResponse(jsonError, returnFullResponse);
      throw Exception("error por app");
    }
  }

  dynamic _returnResponse(
      http.Response? response, bool returnFullResponse) async {
    if (response != null) {
      switch (response.statusCode) {
        case 200:
          return response.body;
        case 202:
          return response.body;
        case 201:
          return response.body;
        case 301:
          return response.body;
        case 302:
          return response.body;
        case 400:
          return response.body;
        case 401:
          return ExitApp.singOut();
        case 403:
          return response.body;
        case 404:
          return response.body;
        case 409:
          return response.body;
        case 424:
          return response.body;
        case 500:
          return response.body;
        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } else {
      throw FetchDataException('Error occured while Communication');
    }
  }
}
