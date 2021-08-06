import 'package:flutter/material.dart';
import 'package:login/components/input.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Input(
              label: "Username",
              icon: Icon(Icons.person),
              obscured: false,
            ),
            Input(
              label: "Email",
              icon: Icon(Icons.mail),
              obscured: false,
            ),
            Input(
              label: "Password",
              icon: Icon(Icons.vpn_key),
              obscured: true,
            ),
            Input(
              label: "Confirm Password",
              icon: Icon(Icons.check),
              obscured: true,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 40.0,
              minWidth: 270.0,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                print('Received click');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
