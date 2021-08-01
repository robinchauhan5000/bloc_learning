part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthEvent {
  final String email, password;

  SignUpEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignInEvent extends AuthEvent {
  final String email, password;

  SignInEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
