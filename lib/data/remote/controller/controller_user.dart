import 'package:get/get.dart';
import 'package:pandawa_agri_indo_test/data/model/auth_user.dart';

class ControllerUser extends GetxController{
  final _data = AuthUser().obs;
  AuthUser get data => _data.value;
  setData(n) => _data.value = n;
}