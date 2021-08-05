import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Teste - Mooney'),
    );
  }
}

class Input extends StatelessWidget {
  const Input({required this.label, required this.icon, Key? key})
      : super(key: key);

  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: label,
                prefixIcon: icon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLogged = false;

  void _checkLogin() {
    setState(() {
      _isLogged = !_isLogged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Input(
              label: "Username",
              icon: Icon(Icons.person),
            ),
            Input(
              label: "Email",
              icon: Icon(Icons.mail),
            ),
            Input(
              label: "Password",
              icon: Icon(Icons.vpn_key),
            ),
            Input(
              label: "Confirm Password",
              icon: Icon(Icons.check),
            ),
            OutlinedButton(
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
