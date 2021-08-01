part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class UserFetchingState extends UserState {}

class UserFetchedState extends UserState {
  List<UserModel> userModel;

  UserFetchedState({this.userModel});

  @override
  List<Object> get props => [userModel];
}

class UserErrorState extends UserState {}
