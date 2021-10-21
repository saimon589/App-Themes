import 'package:app_theme/pages/main_page.dart';
import 'package:app_theme/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:app_theme/utils/page_navigation_ext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000),(){
       context.pushEnd(const MainPage());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[400],
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/app_icon.png',height: 100,),
                        SizedBox(height: 20,),
                        Text('Application Settings',style: textStyle,)
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        SizedBox(height: 50,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('This is the app settings, for theme, language etc..',
                            textAlign: TextAlign.center,
                            style: textStyle1,),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
