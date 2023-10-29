import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UpdateUserEvent>((event, emit) => emit(UserReadyState(event.user)));
  }
}
