import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authenication/firebase/firebase_auth_methods.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class EmailPasswordLogin extends StatefulWidget {
  const EmailPasswordLogin({super.key});

  @override
  State<EmailPasswordLogin> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordLogin> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Email'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Password'),
            ),
            const SizedBox(height: 20),
            CustomButton(
                onPressed: () {
                  loginUser();
                },
                title: 'Login')
          ],
        ),
      ),
    );
  }

  loginUser() {
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
  }
}
