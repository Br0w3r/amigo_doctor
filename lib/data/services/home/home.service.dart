import 'dart:convert';

import 'package:amigo_doctor/data/models/enums/request_method.enum.dart';
import 'package:amigo_doctor/data/services/base.service.dart';
import 'package:amigo_doctor/data/services/home/home.contract.dart';

class HomeApiService extends BaseService implements IHomeService {
  @override
  Future<List<dynamic>> fetchUserRepositories() async {
    var response = await provider.request(
      RequestMethod.get,
      '${apiHost.apiHost}user/repos',
    );

    List<dynamic> list = json.decode(response);
    List<Map<String, dynamic>> listOfMaps =
        list.map((item) => item as Map<String, dynamic>).toList();

    return listOfMaps;
  }
}
