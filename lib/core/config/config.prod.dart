import 'package:amigo_doctor/data/models/entities/environment.model.dart';
import 'package:amigo_doctor/data/services/base.config.dart';

class ProdConfig implements BaseConfig {
  @override
  EnvironmentModel get apisHost => EnvironmentModel(
        apiCfeUrl: "http://qa-inventarios.cfeteit.net/csim/api/v1/",
      );
  @override
  bool get reportErrors => false;
  @override
  bool get trackEvents => false;
  @override
  bool get useHttps => true;
}
