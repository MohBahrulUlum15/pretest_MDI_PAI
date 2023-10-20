import 'dart:convert';
import 'package:http/http.dart' as http;

class AppRequest {
  static Future<Map?> gets(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      Map? responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      return null;
    }
  }

  static Future<Map?> post(String url, Object? body) async {
    try {
      var response = await http.post(Uri.parse(url), body: body);
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return responseBody;
    } catch (e) {
      return null;
    }
  }
}