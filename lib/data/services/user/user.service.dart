import 'dart:typed_data';
import 'package:amigo_doctor/data/services/base.service.dart';
import 'package:amigo_doctor/data/services/user/user.contract.dart';

class UserApiService extends BaseService implements IUserService {
  @override
  Future<Uint8List?> getImageProfile(int imageId) async {
    return null;
  }
}
