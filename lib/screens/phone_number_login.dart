import 'package:firebase_authenication/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PhoneNumberLogin extends StatefulWidget {
  const PhoneNumberLogin({super.key});

  @override
  State<PhoneNumberLogin> createState() => _PhoneNumberLoginState();
}

class _PhoneNumberLoginState extends State<PhoneNumberLogin> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Login'),
      ),
      body: Column(
        children: [
          const Text(
            'Login using otp',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _otpController,
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Enter your mobile number',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(title: 'Send OTP', onPressed: () {})
        ],
      ),
    );
  }
}
