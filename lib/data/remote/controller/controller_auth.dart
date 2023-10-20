import 'package:get/get.dart';
import 'package:pandawa_agri_indo_test/data/remote/source/source_auth.dart';

class ControllerAuth extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;
  final _successLogin = false.obs;
  bool get successLogin => _successLogin.value;

  final _message = "".obs;
  String get message => _message.value;

  login(String username, String password) async {
    _loading.value = true;
    update();
    SignInResult result = await SourceAuth.signin(username, password);
    _successLogin.value = result.success;
    _message.value = result.message;
    update();
    _loading.value = false;
    update();
  }
}