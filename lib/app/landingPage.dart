import 'package:flutter/material.dart';
import 'package:learn_time/Services/auth.dart';
import 'package:learn_time/app/HomePage.dart';
import 'package:learn_time/app/signIn.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;

  const LandingPage({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserDetail?>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          } else {
            return HomePage(
              auth: auth,
            );
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
