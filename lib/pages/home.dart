import 'package:app_theme/widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(title: Text(tr('home')),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink),
            ),
              child: const Text('Elevated Button'),
              onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                    content: Text('This is the snack bar')),);
               },
              ),
          TextButton(
              onPressed: (){
                showDialog(
                    context: context, builder: (context){
                      return AlertDialog(
                        title: const Text('Alert Dialog'),
                        content: const Text('This is the alert dialog'),
                        actions: [
                          TextButton(
                              onPressed: (){},
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: (){},
                              child: const Text('Ok'))
                        ],
                      );
                });
              },
              child: const Text('Text Button')),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.add_a_photo)),
        ],
      ),
    );
  }
}
