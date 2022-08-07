import 'package:flutter/material.dart';

void showOtpDialog(
    {required BuildContext context,
    required TextEditingController controller,
    required VoidCallback onpressed}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Enter your OTP'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration.collapsed(hintText: 'Enter OTP'),

              ),
              
            ],
          ),
          actions: [
            TextButton(onPressed: onpressed, child: const Text('Continue'))
          ],
        );
      });
}
