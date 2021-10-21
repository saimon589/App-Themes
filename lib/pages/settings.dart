import 'package:app_theme/providers/theme_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('settings')),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(tr('common_use')),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.brightness_4_rounded),
                  title: Text(tr('dark_mode')),
                  trailing: Consumer<ThemeProvider>(
                    builder: (BuildContext context, ThemeProvider tp, Widget? child){
                      return CupertinoSwitch(
                          value: tp.themeMode==ThemeMode.dark,
                          onChanged: (isChange){
                            if(isChange){
                              tp.changeToDark();
                            }else{
                              tp.changeToLight();
                            }
                          });
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text(tr('language')),
                ),
                ListTile(
                  onTap: (){
                    setState(() {
                      context.setLocale(Locale('en', 'US'));
                    });
                  },
                  leading: const Icon(Icons.language, color: Colors.transparent,),
                  title: const Text('English'),
                  trailing: context.locale == const Locale('en', 'US')
                  ? const Icon(Icons.check_rounded) : const Text('Select'),
                ),
                ListTile(
                  onTap: (){
                    setState(() {
                      context.setLocale(Locale('my', 'MM'));
                    });
                  },
                  leading: const Icon(Icons.language, color: Colors.transparent,),
                  title: const Text('မြန်မာ'),
                  trailing: context.locale == const Locale('my', 'MM')
                      ? const Icon(Icons.check_rounded) : const Text('Select'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
