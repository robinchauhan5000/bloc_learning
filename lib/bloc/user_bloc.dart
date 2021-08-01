import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_library/services/api/user_api.dart';
import 'package:bloc_library/services/models/user_model.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserApi userApi = UserApi();

  UserBloc() : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserModelLoadedEvent) {
      yield UserFetchingState();
      try {
        List<UserModel> data = await userApi.getUserList();
        yield UserFetchedState(userModel: data);
      } catch (error) {
        yield UserErrorState();
      }
    }
  }
}
