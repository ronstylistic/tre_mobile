import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:tre_app/models/menu.dart';
import 'package:tre_app/models/user.dart';

import 'cache_manager.dart';

class AuthManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  var homeMenu = <Menu>[].obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token, UserModel? user) async {
    isLogged.value = true;
    if(user != null){
      homeMenu.value = user.role == "Admin" ? menus : userMenus;
    }

    //Token is cached
    await saveToken(token, user);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
      homeMenu.value = isAdmin() ? menus: userMenus;
    }
  }

  bool isAdmin() {
    final user = getUser();
    if(user != null){
      return user.role == "Admin";
    }

    return false;
  }
}