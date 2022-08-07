import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authenication/widgets/otp_dialog.dart';
import 'package:flutter/material.dart';

import '../widgets/snackbar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

//Email Password signup
  Future<void> signupWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }
  //Email verification

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      showSnackbar(
          context, 'Email verification sent to ${_auth.currentUser!.email}');
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }

  //Email login
  //
  Future<void> loginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }

  Future<void> otpLogin(
      {required String number, required BuildContext context}) async {
    final TextEditingController otpController = TextEditingController();
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        showSnackbar(context, e.message!);
      },
      codeSent: ((verificationId, forceResendingToken) async {
        showOtpDialog(
          context: context,
          controller: otpController,
          onpressed: () async {
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId,
              smsCode: otpController.text.trim(),
            );

            await _auth.signInWithCredential(credential);
          },
        );
        Navigator.of(context).pop();
      }),
      codeAutoRetrievalTimeout: (String verificationId) {
        //print..
      },
    );
  }
}
