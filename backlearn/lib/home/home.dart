import 'package:backlearn/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Brew Crew"),
        backgroundColor: Colors.brown[400],
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              return await _auth.signOut();
            },
            icon: Icon(Icons.person),
            label: Text("logout"),
           ),
        ],
      ),
    );
  }
}
