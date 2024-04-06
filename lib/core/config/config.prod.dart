import 'package:amigo_doctor/data/models/entities/environment.model.dart';
import 'package:amigo_doctor/data/services/base.config.dart';

class ProdConfig implements BaseConfig {
  @override
  EnvironmentModel get apisHost => EnvironmentModel(
        apiHost: "https://api.github.com/",
      );
  @override
  bool get reportErrors => false;
  @override
  bool get trackEvents => false;
  @override
  bool get useHttps => true;
}
