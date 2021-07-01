import 'package:flutter/material.dart';
import 'package:learn_time/Services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({
    required this.auth,
  });
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
