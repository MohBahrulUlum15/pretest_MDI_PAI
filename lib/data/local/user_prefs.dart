import 'package:pandawa_agri_indo_test/data/model/auth_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferrences {
  Future saveUser(AuthUser user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', user.id!);
    prefs.setString('username', user.username!);
    prefs.setString('email', user.email!);
    prefs.setString('firstName', user.firstName!);
    prefs.setString('lastName', user.lastName!);
    prefs.setString('gender', user.gender!);
    prefs.setString('image', user.image!);
    prefs.setString('token', user.token!);

    // return user;
    // return prefs.commit();
  }

  Future<AuthUser> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      int id = prefs.getInt('id') as int;
      String username = prefs.getString('username') as String;
      String email = prefs.getString('email') as String;
      String firstName = prefs.getString('firstName') as String;
      String lastName = prefs.getString('lastName') as String;
      String gender = prefs.getString('gender') as String;
      String image = prefs.getString('image') as String;
      String token = prefs.getString('token') as String;

      return AuthUser(
          id: id,
          username: username,
          email: email,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          image: image,
          token: token,);
    } catch (e) {
      throw e.toString();
    }
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('username');
    prefs.remove('email');
    prefs.remove('firstName');
    prefs.remove('lastName');
    prefs.remove('gender');
    prefs.remove('image');
    prefs.remove('token');
    prefs.remove('university');
    prefs.remove('color');
  }
}