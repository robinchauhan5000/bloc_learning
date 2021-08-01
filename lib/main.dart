import 'package:bloc_library/bloc/auth/auth_bloc.dart';
import 'package:bloc_library/bloc/user_bloc.dart';
import 'package:bloc_library/presentation/screens/third_screeeen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/toggle_cubit/toggle_button_cubit.dart';
import 'presentation/screens/signup_screen.dart';

Future<void> backgroundHandler(RemoteMessage remoteMessage) async {
  print(remoteMessage.data.toString());
  print(remoteMessage.data.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage((backgroundHandler));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage();

    FirebaseMessaging.onMessage.listen((event) {
      if (event.notification != null) {
        print(event.notification.body);
        print(event.notification.title);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('route' + event?.data['route']);
      if (event.data != null) {
        Navigator.pushNamed(context, '${event.data['route']}');
      }
    });

    FirebaseMessaging.onBackgroundMessage((message) {
      if (message.notification != null) {
        print(message.notification.body);
        print(message.notification.title);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (userBlocContext) => UserBloc()),
        BlocProvider(create: (authContext) => AuthBloc()),
        BlocProvider(create: (toggleCubit) => ToggleButtonCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUpFormScreen(),
        routes: {
          ThirdScreen.route: (context) => ThirdScreen(),
        },
      ),
    );
  }
}
