import 'package:flutter/material.dart';
import 'package:login/components/input.dart';
import 'package:login/pages/register_page.dart';
import 'package:login/pages/user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/pages/log_in_service.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.people),
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Input(
                label: "Email",
                icon: Icon(Icons.person),
                obscured: false,
                controller: _mailInputController,
              ),
              Input(
                label: "Senha",
                icon: Icon(Icons.vpn_key),
                obscured: true,
                controller: _passwordInputController,
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 40.0,
                minWidth: 270.0,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  _doLogin(_formKey, _mailInputController,
                      _passwordInputController, context);
                },
                child: Text('Entrar :D'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Não tem uma conta?"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          child: Text(
                            "Crie sua conta",
                            style: TextStyle(color: Colors.orange),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage(
                                        title: "Cadastro - Mooney",
                                      ))),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _doLogin(
    _formKey, _mailInputController, _passwordInputController, context) async {
  if (_formKey.currentState.validate()) {
    var response = LoginService()
        .login(_mailInputController.text, _passwordInputController.text);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => UserPage(
    //               title: "Página de Usuário",
    //             )));
  } else {
    print("invalido");
  }
}
