import 'package:bloc_library/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard.dart';

class LoginFormScreen extends StatefulWidget {
  @override
  _LoginFormScreenState createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body:
          // BlocListener<AuthBloc, AuthState>(
          //   listener: (context, state) {
          //     if (state is ErrorAuthState) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text(state.message),
          //         ),
          //       );
          //     }
          //   },
          //   child: BlocBuilder<AuthBloc, AuthState>(
          //     builder: (context, state) {
          //       return Stack(
          //         children: [
          //           Form(
          //             key: _formKey,
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 TextFormField(
          //                   controller: _emailController,
          //                   decoration: const InputDecoration(labelText: 'Email'),
          //                   validator: (String value) {
          //                     if (value.isEmpty) {
          //                       return 'Please enter some text';
          //                     }
          //                     return null;
          //                   },
          //                 ),
          //                 TextFormField(
          //                   controller: _passwordController,
          //                   decoration:
          //                       const InputDecoration(labelText: 'Password'),
          //                   validator: (String value) {
          //                     if (value.isEmpty) {
          //                       return 'Please enter some text';
          //                     }
          //                     return null;
          //                   },
          //                 ),
          //                 Container(
          //                   padding: const EdgeInsets.symmetric(vertical: 16.0),
          //                   alignment: Alignment.center,
          //                   child: ElevatedButton(
          //                     onPressed: () async {
          //                       if (_formKey.currentState.validate()) {
          //                         context.read<AuthBloc>().add(SignInEvent(
          //                             _emailController.text,
          //                             _passwordController.text));
          //                       }
          //                     },
          //                     child: const Text('Login'),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           if (state is AuthLoadingState)
          //             Center(child: CircularProgressIndicator())
          //         ],
          //       );
          //     },
          //   ),
          // ),

          BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticationAuthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('login Successfully'),
              ),
            );
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          }
          if (state is ErrorAuthState) {
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
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            context.read<AuthBloc>().add(SignInEvent(
                                _emailController.text,
                                _passwordController.text));
                          }
                        },
                        child: const Text('Login'),
                      ),
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
    );
  }
}
