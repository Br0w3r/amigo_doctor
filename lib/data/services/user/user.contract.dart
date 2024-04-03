import 'dart:typed_data';

abstract class IUserService {
  Future<Uint8List?> getImageProfile(int imageId);
}
