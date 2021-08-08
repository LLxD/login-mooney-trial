import 'package:flutter/material.dart';
import 'package:login/components/input.dart';
import 'package:login/pages/sign_up_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Input(
                controller: _nameInputController,
                label: "Username",
                icon: Icon(Icons.person),
                obscured: false,
              ),
              Input(
                controller: _mailInputController,
                label: "Email",
                icon: Icon(Icons.mail),
                obscured: false,
              ),
              Input(
                controller: _passwordInputController,
                label: "Password",
                icon: Icon(Icons.vpn_key),
                obscured: true,
              ),
              Input(
                controller: _confirmInputController,
                validator: (value) {
                  if (value != _passwordInputController.text) {
                    return "As senhas devem ser iguais";
                  }
                  return null;
                },
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
                onPressed: () => _doSignUp(
                    _formKey, _mailInputController, _passwordInputController),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _doSignUp(_formKey, _mailInputController, _passwordInputController) {
  if (_formKey.currentState.validate()) {
    SignUpService().signUp(
      _mailInputController.text,
      _passwordInputController.text,
    );
  } else {
    print("invalido");
  }
}
