


import 'package:app_theme/utils/share_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  checkTheme(){
    SharePref.getData(key: 'theme').then((theme){
      if(theme!=null){
        if(theme=='light'){
          themeMode = ThemeMode.light;
        }else{
          themeMode = ThemeMode.dark;
        }
        notifyListeners();
      }else{}
    });
  }
  changeToLight(){
    SharePref.saveData(key: 'theme', value: 'light');
    themeMode = ThemeMode.light;
    notifyListeners();
  }
  changeToDark(){
    SharePref.saveData(key: 'theme', value: 'dark');
    themeMode = ThemeMode.dark;
    notifyListeners();
  }
}