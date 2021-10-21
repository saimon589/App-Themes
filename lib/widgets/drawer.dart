import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app_theme/utils/page_navigation_ext.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
              child: Column(
                children: [
                  Image.asset('assets/icons/app_icon.png',height: 60,),
                  SizedBox(height: 20,),
                  RichText(text: TextSpan(text: 'App ',style: TextStyle(color: Colors.indigo),
                    children: const [
                      TextSpan(text: 'Setting', style: TextStyle(color: Colors.white)),
                    ]
                  ),
                  ),
                ],
              ),
          ),
          ListTile(
            onTap: (){context.pop();},
            leading: Icon(Icons.home),
            title: Text(tr('home')),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(),
          ListTile(
            onTap: (){context.pop();},
            leading: Icon(Icons.settings),
            title: Text(tr('settings')),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(),
          ListTile(
            onTap: (){context.pop();},
            leading: Icon(Icons.star),
            title: Text(tr('rate_us')),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
