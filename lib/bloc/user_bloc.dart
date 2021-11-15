import 'package:app_theme/bloc/user_event.dart';
import 'package:app_theme/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc():super(InitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event)async*{
    if(event is StudentEvent){
      yield StudentState();
    }else if(event is TeacherEvent){
      yield TeacherState();
    }
  }
}