

import 'package:shared_preferences/shared_preferences.dart';

class SharePref{
  static Future<bool> saveData({String? key, String? value})async{
    SharedPreferences preferences =
     await SharedPreferences.getInstance();
     preferences.setString(key!, value!);
    return true;
  }

  static Future<dynamic> getData({String? key}) async {
    SharedPreferences preferences =
        await SharedPreferences.getInstance();
    return preferences.getString(key!);
  }
}