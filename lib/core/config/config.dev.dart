import 'package:amigo_doctor/data/models/entities/environment.model.dart';
import 'package:amigo_doctor/data/services/base.config.dart';

class DevConfig implements BaseConfig {
  @override
  EnvironmentModel get apisHost => EnvironmentModel(
        apiHost: "https://api.github.com/",
      );
  @override
  bool get reportErrors => true;
  @override
  bool get trackEvents => true;
  @override
  bool get useHttps => false;
}
