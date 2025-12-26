import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback? onSubmitted;
  final bool obscureText;

  const LoginTextField({super.key,
  required this.hintText,
  required this.controller,
  this.onSubmitted,
  this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            textInputAction: onSubmitted != null
              ? TextInputAction.done
              : TextInputAction.next,
            onSubmitted: (_) => onSubmitted?.call(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintText,
            ),
          ),
        );
  }
}