import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{

  Future<String> getToken() async{
    String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ??'';
    print('token $token');
    return token;
  }

  setToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

}