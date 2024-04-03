import 'package:amigo_doctor/data/models/entities/environment.model.dart';
import 'package:amigo_doctor/data/services/base.config.dart';

class Config implements BaseConfig {
  @override
  EnvironmentModel get apisHost => EnvironmentModel(
        apiCfeUrl: "https://pre-inventarios.cfeteit.net/csim/api/v1/",
      );
  @override
  bool get reportErrors => true;
  @override
  bool get trackEvents => true;
  @override
  bool get useHttps => true;
}
