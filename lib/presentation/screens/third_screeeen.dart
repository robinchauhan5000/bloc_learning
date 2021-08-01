import 'package:bloc_library/bloc/toggle_cubit/toggle_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatelessWidget {
  static const route = 'ThirdScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ToggleButtonCubit, ToggleButtonState>(
          builder: (context, state) {
            return Text(
              state.emailNotifications
                  ? 'All value True Now'
                  : 'Everything is False',
              style: TextStyle(fontSize: 25),
            );
          },
        ),
      ),
    );
  }
}
