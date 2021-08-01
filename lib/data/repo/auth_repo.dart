import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepo {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User user;
  Future<User> signInMethod({String email, String password}) async {
    final AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);

    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      user = userCredential.user;
      return user;
    } on PlatformException catch (error) {
      print("Error: " + error.message); //Will work when you have errors
    }
  }

  Future<User> signUp({String email, String password}) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // .whenComplete(() => _firestore
      //     .collection('user')
      //     .doc(_auth.currentUser.uid)
      //     .set({"email": email, "name": 'Robin Chauhan', 'game': 'pubg'}));

      user = userCredential.user;

      return user;
    } on PlatformException catch (error) {
      print("Error: " + error?.message); //Will work when you have errors
    }
  }

  Future<User> signWithFacebook({String email, String password}) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential = await _auth
            .signInWithCredential(credential)
            .whenComplete(() => _firestore
                .collection('user')
                .doc(_auth.currentUser.uid)
                .set(
                    {"email": email, "name": 'Robin Chauhan', 'game': 'pubg'}));

        user = userCredential.user;

        return user;
      }
    } catch (error) {
      print(error);
    }
  }
}
