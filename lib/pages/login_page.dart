import 'package:flutter/material.dart';
import 'package:login/components/input.dart';
import 'package:login/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            Input(
              label: "Username",
              icon: Icon(Icons.person),
              obscured: false,
            ),
            Input(
              label: "Password",
              icon: Icon(Icons.person),
              obscured: true,
            ),
            InkWell(
              child: Text("Crie sua conta"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterPage(
                            title: "Testando mudança de título!",
                            key: Key("Register"),
                          ))),
            )
          ],
        ),
      ),
    );
  }
}
