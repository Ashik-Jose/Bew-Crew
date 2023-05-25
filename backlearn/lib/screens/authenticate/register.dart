import 'package:flutter/material.dart';
import 'package:backlearn/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text(
          "Sign Up to Brew Crew",
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
              "SignIn",
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
          child: Column(
            children: [
              SizedBox(height: 19.1),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 19.1),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 19.1),
              ElevatedButton(
                child: Text("SignUp"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[200]),
                ),
                onPressed: () async {
                  dynamic result = await _auth.registerEmail(email, password);
                  if (result == null)
                    setState(() {
                      error = "Please enter a valid email id";
                    });
                },
              ),
            SizedBox(height: 12.0),
            Text(error,
            style: TextStyle(
              color: Colors.red,
            ),
            ),  
            ],
          ),
        ),
      ),
    );
  }
}
