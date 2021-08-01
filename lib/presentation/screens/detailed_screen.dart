import 'package:bloc_library/services/models/user_model.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  UserModel userModel;

  DetailedScreen(this.userModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(userModel.name),
            Text(userModel.email),
            Text(userModel.phone),
          ],
        ),
      ),
    );
  }
}
