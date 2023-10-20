import 'package:pandawa_agri_indo_test/config/network/api.dart';
import 'package:pandawa_agri_indo_test/config/network/app_request.dart';
import 'package:pandawa_agri_indo_test/data/model/dummy_user.dart';

class SourceDummyUser {
  static Future<List<DummyUser>> getDummyUser() async {
    String url = Api.BASE_URL;
    Map? responseBody = await AppRequest.gets(url);

    if (responseBody == null) {
      return [];
    }
    if (responseBody.isNotEmpty) {
      List data = responseBody['users'];
      return data.map((e) => DummyUser.fromJson(e)).toList();
    }
    return [];
  }

  static Future<List<DummyUser>> searchtDummyUser(String query) async {
    String url = '{$Api.BASE_URL}/search?q=$query';
    Map? responseBody = await AppRequest.gets(url);

    if (responseBody == null) {
      return [];
    }
    if (responseBody.isNotEmpty) {
      List data = responseBody['users'];
      return data.map((e) => DummyUser.fromJson(e)).toList();
    }
    return [];
  }
}
