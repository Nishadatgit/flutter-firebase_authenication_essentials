import 'package:firebase_authenication/screens/email_Password_login.dart';
import 'package:firebase_authenication/screens/email_password_signup.dart';
import 'package:firebase_authenication/screens/phone_number_login.dart';
import 'package:firebase_authenication/widgets/mian_button.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Column(
        children: [
          MainButton(
            title: 'Email Password Login',
            onpressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const EmailPasswordLogin()));
            },
          ),
          MainButton(
            title: 'Email Password Signup',
            onpressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const EmailPasswordSignup()));
            },
          ),
          MainButton(
            title: 'OTP Login',
            onpressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => const PhoneNumberLogin()));
            },
          ),
          MainButton(
            title: 'Google Login',
            onpressed: () {},
          ),
          MainButton(
            title: 'Facebook Login',
            onpressed: () {},
          ),
          MainButton(
            title: 'OTP Login',
            onpressed: () {},
          )
        ],
      ),
    );
  }
}
