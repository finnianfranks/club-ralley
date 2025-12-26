import 'package:flutter/material.dart';
import 'package:my_app/screens/root_screen.dart';
import 'package:my_app/widgets/login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 3),
            const Text(
              "Login", style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold
              ),
            ),
          LoginTextField(hintText: "Username", controller: usernameController),
          LoginTextField(hintText: "Password", controller: passwordController, obscureText: true, onSubmitted: () {_goToHome(context);},
          ),
          const Spacer(flex: 3),
        ],
      ),
     ),
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const RootScreen(),
      ),
      );
  }
}
