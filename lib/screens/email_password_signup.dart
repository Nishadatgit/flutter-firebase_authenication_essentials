import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authenication/firebase/firebase_auth_methods.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class EmailPasswordSignup extends StatefulWidget {
  const EmailPasswordSignup({super.key});

  @override
  State<EmailPasswordSignup> createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<EmailPasswordSignup> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void signupUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signupWithEmail(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
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
                  signupUser();
                },
                title: 'Signup')
          ],
        ),
      ),
    );
  }
}
