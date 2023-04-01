import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/screens/login/login.dart';
import 'package:avukapp/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../service/firebase_service.dart';
import '../home/pages/home_page.dart';
import 'lawyer_register_screen.dart';

class RegisterWithMailScreen extends StatefulWidget {
  const RegisterWithMailScreen({super.key});

  @override
  State<RegisterWithMailScreen> createState() => _RegisterWithMailScreenState();
}

class _RegisterWithMailScreenState extends State<RegisterWithMailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Submit the form data to the server
      _formKey.currentState!.save();
      print("kullanıcı oluşturuldu");
      if (mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    }
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width / 2,
                  height: height / 7,
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kCreamColor,
                      border: Border.all(color: kNavyBlueColor, width: 1)),
                ),
                SizedBox(
                  height: height / 20,
                ),
                Wrap(
                  runSpacing: height / 65,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
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
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: height / 25),
                    PressButtonWidget(
                      buttonColor: kNavyBlueColor,
                      buttonHeight: height / 15,
                      buttonWeight: width,
                      buttonText: 'Sign up',
                      onPress: () {
                        _submit();
                      },
                      textColor: kWhiteColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 10,
                ),
                PressButtonWidget(
                    buttonText: "Avukat mısın?\nHemen bize katıl!",
                    buttonColor: kNavyBlueColor,
                    textColor: kWhiteColor,
                    buttonHeight: height / 10,
                    buttonWeight: width,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LawyerRegisterPage()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
