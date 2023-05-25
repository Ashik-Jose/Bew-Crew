//import 'package:backlearn/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(
          "Brew Crew",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.brown[400],
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            label: Text(
              "Register",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 19.1),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter a valid email":null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 19.1),
              TextFormField(
                obscureText: true,
                validator: (val) => val.length<6 ? "Enter a longer password" : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 19.1),
              ElevatedButton(
                child: Text("SignIn"),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    print(email);
                    print(password);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
