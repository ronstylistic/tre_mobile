import 'package:get_storage/get_storage.dart';
import 'package:tre_app/models/user.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token, UserModel? user) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    await box.write(CacheManagerKey.USER.toString(), user);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  UserModel? getUser() {
    final box = GetStorage();
    if(box.hasData(CacheManagerKey.USER.toString())) {
      return UserModel.fromJson(box.read(CacheManagerKey.USER.toString()));
    }
    return null;
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
    await box.remove(CacheManagerKey.USER.toString());
  }
}

enum CacheManagerKey { TOKEN, USER }