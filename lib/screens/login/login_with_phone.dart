import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/service/firebase_auth_service.dart';
import 'package:avukapp/widgets/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:avukapp/service/auth_base.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
  late bool _passwordVisible;
  TextEditingController codeController = TextEditingController();
  late FirebaseAuth auth;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                suffixIcon:
                    TextButton(onPressed: () {}, child: const Text('Kod Al')),
                labelText: 'Phone number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: codeController,
              decoration: InputDecoration(
                  labelText: 'Gelen Kod',
                  prefixIcon: const Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            PressButtonWidget(
                buttonText: "Giriş Yap",
                buttonColor: kNavyBlueColor,
                textColor: kWhiteColor,
                buttonHeight: height / 50,
                buttonWeight: width,
                onPress: () {
                  loginWithPhone();
                }),
          ],
        ),
      ),
    );
  }

  void loginWithPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+905532047875",
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        debugPrint("telefon onaylandı");
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint(e.toString());
      },
      codeSent: (String verificationId, int? resendToken) async {
        debugPrint("code send");
        String smsCode = "123456";
        var credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("code send timeout");
      },
    );
  }
}
