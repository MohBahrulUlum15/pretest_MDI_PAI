// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:pandawa_agri_indo_test/data/model/dummy_user.dart';
import 'package:pandawa_agri_indo_test/data/remote/source/source_dummy_user.dart';

class ControllerDummyUser extends GetxController{
  final _loading = false.obs;
  bool get loading => _loading.value;

  final _listDummyUser = <DummyUser>[].obs;
  List<DummyUser> get listDummyUser => _listDummyUser.value;

  getListDummyUser() async{
    _loading.value = true;
    update();
    _listDummyUser.value = await SourceDummyUser.getDummyUser();
    update();
    _loading.value = false;
    update();
  }

  searchDummyUser(String query) async{
    _loading.value = true;
    update();
    _listDummyUser.value = await SourceDummyUser.searchtDummyUser(query);
    update();
    _loading.value = false;
    update();
  }
}