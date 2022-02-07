import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:tre_app/models/auth/auth_request.dart';
import 'package:tre_app/models/auth/auth_response.dart';

/// LoginService responsible to communicate with web-server
/// via authentication related APIs
class AuthService extends GetConnect {
  final String loginUrl = 'http://tre.rcjsolutions.com/api/login';

  Future<AuthResponseModel?> fetchLogin(AuthRequestModel model) async {
    final response = await post(loginUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return AuthResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  /*Future<AuthResponseModel?> fetchRegister(
      AuthRequestModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return AuthResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }*/
}