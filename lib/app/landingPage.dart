import 'package:flutter/material.dart';
import 'package:learn_time/Services/auth.dart';
import 'package:learn_time/app/HomePage.dart';
import 'package:learn_time/app/signIn.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;

  const LandingPage({Key? key, required this.auth}) : super(key: key);
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  UserDetail? _user;

  @override
  void initState() {
    super.initState();
    _checkCurruntUser();
  }

  void _checkCurruntUser() async {
    UserDetail? user = await widget.auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(UserDetail? user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser,
      );
    } else {
      return HomePage(
        auth: widget.auth,
        onSignOut: () => _updateUser(null),
      );
    }
  }
}
