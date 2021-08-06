import 'package:flutter/material.dart';
import 'package:login/components/input.dart';
import 'package:login/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.people),
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Input(
              label: "Username",
              icon: Icon(Icons.person),
              obscured: false,
            ),
            Input(
              label: "Password",
              icon: Icon(Icons.vpn_key),
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
    );
  }
}
