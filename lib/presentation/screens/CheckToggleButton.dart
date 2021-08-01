import 'package:bloc_library/bloc/toggle_cubit/toggle_button_cubit.dart';
import 'package:bloc_library/presentation/screens/third_screeeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<ToggleButtonCubit, ToggleButtonState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: state.emailNotifications,
                  onChanged: (value) {
                    context
                        .read<ToggleButtonCubit>()
                        .toggleEmailNotifications(value);
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                    value: BlocProvider.of<ToggleButtonCubit>(
                                        context),
                                    child: ThirdScreen(),
                                  )));
                    },
                    child: Text('Go to third Screen'))
              ],
            ),
          );
        },
      ),
    ));
  }
}
