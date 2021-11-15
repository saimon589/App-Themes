import 'package:app_theme/bloc/user_bloc.dart';
import 'package:app_theme/bloc/user_event.dart';
import 'package:app_theme/bloc/user_state.dart';
import 'package:app_theme/providers/count_provider.dart';
import 'package:app_theme/widgets/drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Default";
  @override
  Widget build(BuildContext context) {
    CountProvider countProvider = Provider.of<CountProvider>(context);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(title: Text(tr('home')),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Text(tr('provider')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ElevatedButton(
                onPressed: (){
                  countProvider.increase();
                },
                child: Text(tr('add'))),
            Consumer<CountProvider>(builder: (context, CountProvider ct, child){
              return Text(ct.count.toString());
            }),
            ElevatedButton(
                onPressed: (){
                  countProvider.decrease();
                },
                child: Text(tr('sub'))),
          ],),
          Divider(),
          Text(tr('bloc')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: (){
                    BlocProvider.of<UserBloc>(context).add(StudentEvent());
                  },
                  child: Text(tr('student'))),
              BlocBuilder<UserBloc, UserState>(builder: (BuildContext context, UserState state){
                if(state is TeacherState){
                  name = state.name;
                }else if(state is StudentState){
                  name = state.name;
                }
                return Text(name);
              }),
              ElevatedButton(
                  onPressed: (){
                    BlocProvider.of<UserBloc>(context).add(TeacherEvent());
                  },
                  child: Text(tr('teacher'))),
            ],)
        ],
      ),
    );
  }
}
