import 'package:app_theme/pages/home.dart';
import 'package:app_theme/pages/settings.dart';
import 'package:app_theme/providers/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List<Widget> pageList = <Widget>[
    HomePage(),
    SettingPage()
  ];
  @override
  Widget build(BuildContext context) {
    ThemeProvider tp = Provider.of<ThemeProvider>(context, listen: false);
    tp.checkTheme();
    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: tr('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: tr('settings')),
        ],
      ),
    );
  }
}
