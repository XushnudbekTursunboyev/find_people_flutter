import 'package:shared_preferences/shared_preferences.dart';


class MyPreference {
  static late final SharedPreferences _pref;

  static void init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static bool? isLogin(){
    return _pref.getBool('login');
  }

  static double? getLat(){
    return _pref.getDouble('lat');
  }

  static double? getLong(){
    return _pref.getDouble('long');
  }

  static String? getName() {
    return _pref.getString('user');
  }


  static String? getId() {
    return _pref.getString('id');
  }



  static void register(String name, double lat, double long, String id) {
    _pref.setBool("login", true);
    _pref.setString("user", name);
    _pref.setDouble('lat', lat);
    _pref.setDouble('long', long);
    _pref.setString('id', id);
  }

}