
import '../../data/models/user_model.dart';

abstract class UserState{}

class UserReadyState extends UserState{
  final UserModel user;

  UserReadyState(this.user);
}

class UserInitialState extends UserState{}