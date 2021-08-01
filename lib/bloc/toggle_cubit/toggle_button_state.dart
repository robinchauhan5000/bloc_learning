part of 'toggle_button_cubit.dart';

class ToggleButtonState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;

  ToggleButtonState({this.appNotifications, this.emailNotifications});

  ToggleButtonState copyWith({
    final bool appNotifications,
    final bool emailNotifications,
  }) {
    return ToggleButtonState(
      appNotifications: appNotifications ?? this.appNotifications,
      emailNotifications: emailNotifications ?? this.emailNotifications,
    );
  }

  @override
  List<Object> get props => [appNotifications, emailNotifications];
}
