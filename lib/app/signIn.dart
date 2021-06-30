// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_time/Services/auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({required this.onSignIn, required this.auth});

  final Function(UserDetail?) onSignIn;
  final AuthBase auth;

  Future<void> _signinAnonymously() async {
    try {
      UserDetail? user = await auth.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        centerTitle: true,
      ),
      backgroundColor: Colors.indigo,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialSiginButton(
                icon: 'assets/google.svg',
                textColor: Colors.black,
                color: Colors.white,
                title: 'Signin with Google',
                function: () {},
              ),
              SizedBox(height: 20),
              SocialSiginButton(
                icon: 'assets/facebook.svg',
                textColor: Colors.black,
                color: Colors.white,
                title: 'Signin with Facebook',
                function: () {},
              ),
              SizedBox(height: 20),
              SocialSiginButton(
                icon: 'assets/email.svg',
                textColor: Colors.black,
                color: Colors.white,
                title: 'Signin with Email',
                function: () {},
              ),
              SizedBox(height: 20),
              Text(
                'or',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              SocialSiginButton(
                icon: 'assets/mask.svg',
                textColor: Colors.black,
                color: Colors.white,
                title: 'Signin Anonymously',
                function: () {
                  _signinAnonymously();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialSiginButton extends StatelessWidget {
  const SocialSiginButton({
    required this.color,
    required this.textColor,
    required this.function,
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final String title;
  final String icon;

  final Color color;
  final Color textColor;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 55.0,
      color: color,
      onPressed: function,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              icon,
              width: 25,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: textColor,
                // letterSpacing: 1,
              ),
            ),
            Opacity(
              opacity: 0.0,
              child: SvgPicture.asset(
                icon,
                width: 25,
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
