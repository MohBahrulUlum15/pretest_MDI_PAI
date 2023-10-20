import 'package:pandawa_agri_indo_test/config/network/api.dart';
import 'package:pandawa_agri_indo_test/config/network/app_request.dart';
import 'package:pandawa_agri_indo_test/data/local/user_prefs.dart';
import 'package:pandawa_agri_indo_test/data/model/auth_user.dart';

class SourceAuth {
  static Future<SignInResult> signin(String username, String password) async {
    String url = '${Api.BASE_URL_AUTH}/login';
    Map? responseBody = await AppRequest.post(
        url, {'username': username, 'password': password});

    if (responseBody!.isNotEmpty) {
      if (responseBody["id"] != null) {
        UserPreferrences().saveUser(AuthUser(
          id: responseBody["id"],
          username: responseBody["username"],
          email: responseBody["email"],
          firstName: responseBody["firstName"],
          lastName: responseBody["lastName"],
          gender: responseBody["gender"],
          image: responseBody["image"],
          token: responseBody["token"],
        ));
        return SignInResult(success: true, message: "Login successfull");
      } else {
        return SignInResult(success: false, message: responseBody["message"]);
      }
    } else {
      return SignInResult(success: false, message: 'Network error!');
    }
  }
}

class SignInResult {
  final bool success;
  final String message;

  SignInResult({required this.success, required this.message});
}
