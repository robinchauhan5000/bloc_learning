part of 'notification_bloc.dart';

class NotificationEvent extends Equatable {
  final String payload;
  const NotificationEvent({this.payload});

  @override
  List<Object> get props => [payload];
}
