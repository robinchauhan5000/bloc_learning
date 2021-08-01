import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_button_state.dart';

class ToggleButtonCubit extends Cubit<ToggleButtonState> {
  ToggleButtonCubit()
      : super(ToggleButtonState(
            appNotifications: false, emailNotifications: false));

  void toggleAppNotifications(bool newValue) {
    print(newValue);
    emit(state.copyWith(appNotifications: newValue));
  }

  void toggleEmailNotifications(bool newValue) {
    print(newValue);
    emit(state.copyWith(emailNotifications: newValue));
  }
}
