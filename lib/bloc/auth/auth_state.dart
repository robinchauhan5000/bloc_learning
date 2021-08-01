part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];

  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthenticationAuthenticated extends AuthState {
  final User user;

  AuthenticationAuthenticated({this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationUnauthenticated extends AuthState {}

class ErrorAuthState extends AuthState {
  final String message;

  ErrorAuthState({this.message});

  @override
  List<Object> get props => [message];
}
