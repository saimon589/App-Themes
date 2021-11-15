abstract class UserState{}

class InitialState extends UserState{}

class StudentState extends UserState{
  String name = "Ko Ko";
}

class TeacherState extends UserState{
  String name = "U Mg Mg";
}