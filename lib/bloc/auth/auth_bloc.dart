import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_library/data/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authRepo = AuthRepo();
  AuthBloc() : super(AuthInitial());
  User user;
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignUpEvent) {
      yield AuthLoadingState();
      try {
        user =
            await authRepo.signUp(email: event.email, password: event.password);
        yield AuthenticationAuthenticated(user: user);
      } catch (err) {
        print('google' + err?.toString());
        yield ErrorAuthState(message: err.toString());
      }
    }
    if (event is SignInEvent) {
      yield AuthLoadingState();
      try {
        await authRepo.signInMethod(
            email: event.email, password: event.password);
        yield AuthenticationAuthenticated();
      } catch (err) {
        yield ErrorAuthState(message: err.toString());
      }
    }
  }
}
