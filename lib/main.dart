import 'package:app_theme/pages/main_page.dart';
import 'package:app_theme/providers/theme_provider.dart';
import 'package:app_theme/screens/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      child: const MyApp(),
      supportedLocales: const [Locale('en' ,'US'), Locale('my', 'MM')],
      path: 'assets/languages',
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context){
          return ThemeProvider();
        },
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, ThemeProvider tp, Widget? child){
          return MaterialApp(
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            themeMode: tp.themeMode,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Pyidaungsu',
              brightness: Brightness.light,
              primaryColor: Colors.red,
              primarySwatch: Colors.indigo,
            ),
            darkTheme: ThemeData(
              fontFamily: 'Pyidaungsu',
              brightness: Brightness.dark,
              primaryColor: Colors.teal,
              primarySwatch: Colors.cyan,
            ),
            home: MainPage(),
          );
        },
      ),
    );
  }
}
