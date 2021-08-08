import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // TextEditingController _nameInputController = TextEditingController();
  // TextEditingController _mailInputController = TextEditingController();
  // TextEditingController _passwordInputController = TextEditingController();
  // TextEditingController _confirmInputController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(),
    );
  }
}
