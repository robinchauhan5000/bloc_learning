import 'package:bloc_library/bloc/auth/auth_bloc.dart';
import 'package:bloc_library/bloc/toggle_cubit/toggle_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CheckToggleButton.dart';
import 'login_screen.dart';

class SignUpFormScreen extends StatefulWidget {
  @override
  _SignUpFormScreenState createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;
  AuthBloc authBloc = AuthBloc();

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up Screen'),
      ),
      body: Column(
        children: [
          BlocConsumer<AuthBloc, AuthState>(
            bloc: authBloc,
            listener: (context, state) {
              print(state);
              if (state is AuthenticationAuthenticated) {
                print(state.user?.uid);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Account Created Successfully'),
                  ),
                );
              } else if (state is ErrorAuthState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'Email'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    context.read<AuthBloc>().add(SignUpEvent(
                                        _emailController.text,
                                        _passwordController.text));
                                  }
                                },
                                child: const Text('Sign Up'),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LoginFormScreen()));
                                },
                                child: const Text('Login'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (state is AuthLoadingState)
                    Center(child: CircularProgressIndicator())
                ],
              );
            },
          ),
          // BlocBuilder<ToggleButtonCubit, ToggleButtonState>(
          //   builder: (context, state) {
          //     return Switch(
          //       value: state.emailNotifications,
          //       onChanged: (value) {
          //         print(value);
          //         context
          //             .read<ToggleButtonCubit>()
          //             .toggleEmailNotifications(value);
          //       },
          //     );
          //   },
          // ),

          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                              value:
                                  BlocProvider.of<ToggleButtonCubit>(context),
                              child: CheckToggleButton(),
                            )));
              },
              child: Text('Check Toggle Button')),

          BlocBuilder<ToggleButtonCubit, ToggleButtonState>(
            builder: (context, state) {
              return Column(
                children: [
                  Switch(
                    value: state.emailNotifications,
                    onChanged: (value) {
                      print(value);
                      context
                          .read<ToggleButtonCubit>()
                          .toggleEmailNotifications(value);
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
