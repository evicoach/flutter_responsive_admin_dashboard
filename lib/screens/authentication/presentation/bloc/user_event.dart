
import '../../data/models/user_model.dart';

abstract class UserEvent {}

class UpdateUserEvent extends UserEvent{
    UserModel user;

    UpdateUserEvent(this.user);
}