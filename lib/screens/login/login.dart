import 'dart:math';

import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/screens/login/login_with_phone.dart';
import 'package:avukapp/screens/register/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../service/firebase_service.dart';
import '../../widgets/social_button.dart';
import '../home/manager/page_manager.dart';
import '../home/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  late bool _passwordVisible;
  late FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    auth = FirebaseAuth.instance;
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint("User oturumu kapalı ");
      } else {
        debugPrint(
            "User oturumu açık ${user.email} ve meail durumu ${user.emailVerified} ");
      }
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final formState = _formkey.currentState;
      _formKey.currentState!.save();
      print("kullanıcı oluşturuldu");
      if (mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyPageManager()));
      } else {
        showError("hatalı giriş ");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //textfielda basıldıgında ekranın tamamının yukarıya doğru sıkışmasını engeller

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width / 2,
            height: height / 7,
            child: Center(
                child: Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kCreamColor,
                border: Border.all(color: kNavyBlueColor, width: 1)),
          ),
          /* SizedBox(
              width: 100,
              height: 100,
              child: SvgPicture.asset('assets/images/justice.svg')),*/

          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height / 65,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          suffixIcon: IconButton(
                            icon: _passwordVisible
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          )),
                      obscureText: !_passwordVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PressButtonWidget(
                      buttonText: 'Login',
                      onPress: () {
                        login();
                      },
                      buttonColor: kNavyBlueColor,
                      buttonHeight: 50,
                      textColor: kWhiteColor,
                      buttonWeight: 250,
                    ),
                    SizedBox(height: 10),
                    SocialButtonWidget(
                      buttonText: "Login with Google",
                      buttonIcon: Icon(
                        MdiIcons.googlePlus,
                        color: kWhiteColor,
                      ),
                      onPress: () {},
                      buttonHeight: 40,
                      buttonWidth: width,
                    ),
                    SocialButtonWidget(
                      buttonText: "Login with phone",
                      buttonIcon: Icon(
                        MdiIcons.phone,
                        color: kWhiteColor,
                      ),
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginWithPhoneScreen()));
                      },
                      buttonHeight: 40,
                      buttonWidth: width,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationScreen()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Register",
                            style: TextStyle(
                              color: kWineRedColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> login() async {
    final formState = _formkey.currentState;

    try {
      var userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      debugPrint(userCredential.toString());
      if (mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MyPageManager()));
      }
    } catch (e) {}
  }

  Future<dynamic> showError(String message) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Close",
                    ))
              ],
              title: const Text("Hata!"),
              // contentPadding: EdgeInsets.all(10),
              content: Text(message),
            ));
  }
}
