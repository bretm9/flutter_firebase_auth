import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String alert = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(title: Text('Sign In Page')),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(onChanged: (val) {
                    setState(() => email = val);
                  }),
                  SizedBox(height: 20.0),
                  TextFormField(onChanged: (val) {
                    setState(() => password = val);
                  }),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Text('Sign In!'),
                    onPressed: () async {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => alert =
                            'Sign in failed: Invalid credentials. Please try again.');
                      } else {
                        setState(() => alert = 'Sign in successful!');
                      }
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text(alert),
                ]))));
  }
}
