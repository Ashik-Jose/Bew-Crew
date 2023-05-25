import 'package:backlearn/screens/authenticate/signIn.dart';
import 'package:flutter/material.dart';
import 'package:backlearn/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleVeiew() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn)
      return SignIn( toggleView: toggleVeiew);
    else
      return Register(toggleView: toggleVeiew);
  }
}
