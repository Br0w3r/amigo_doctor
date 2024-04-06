import 'package:amigo_doctor/data/models/entities/environment.model.dart';
import 'package:amigo_doctor/data/providers/api.enviroments.dart';
import 'package:amigo_doctor/data/providers/api.provider.dart';

abstract class BaseService {
  final provider = ApiProvider.instance;
  final EnvironmentModel apiHost = ApiEnvironment().config.apisHost;
  final bool useHttps = ApiEnvironment().config.useHttps;
}
