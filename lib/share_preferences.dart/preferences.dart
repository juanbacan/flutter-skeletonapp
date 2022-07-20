import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _welcome = true;

  static String _name = '';
  static bool _isDarkmode = false;
  static int _gender = 1;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

// Si se muestra o no el screen de bienvenida
  static bool get welcome {
    return _prefs.getBool('welcome') ?? _welcome;
  }

  static set welcome(bool welcome) {
    _welcome = welcome;
    _prefs.setBool('welcome', welcome);
  }

// Nombre del usuario
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

// EL tema en modo claro u oscuro
  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool value) {
    _isDarkmode = value;
    _prefs.setBool('isDarkmode', value);
  }

// El género del usuarop
  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', value);
  }
}
