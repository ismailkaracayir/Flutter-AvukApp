import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> registerUser(String email, String password) async {
  try {
    var userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    var myUser = userCredential.user;
    if (!myUser!.emailVerified) {
      await myUser.sendEmailVerification();
    } else {
      debugPrint("onaylanmış");
    }
    // Kayıt işlemi başarılı
    print(userCredential.toString());
  } on FirebaseAuthException catch (e) {
    // Hata meydana geldi
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> signIn(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    // Kayıt işlemi başarılı
  } on FirebaseAuthException catch (e) {
    // Hata meydana geldi
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  } catch (e) {
    print(e);
  }
}
