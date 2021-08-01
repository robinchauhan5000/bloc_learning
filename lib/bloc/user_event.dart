part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {}

class UserModelLoadedEvent extends UserEvent {
  UserModel userData;

  UserModelLoadedEvent({this.userData});

  @override
  List<Object> get props => [userData];
}

class UserModelTappedEvent extends UserEvent {
  int index;
  UserModel userData;
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
