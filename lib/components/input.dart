import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input(
      {required this.label,
      required this.icon,
      required this.obscured,
      this.controller,
      this.validator,
      Key? key})
      : super(key: key);

  final String label;
  final bool obscured;
  final Icon icon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscured,
            decoration: InputDecoration(
              hintText: label,
              prefixIcon: icon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
