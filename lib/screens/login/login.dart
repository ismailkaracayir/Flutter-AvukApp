import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/screens/login/login_with_phone.dart';
import 'package:avukapp/screens/register/registration.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../widgets/social_button.dart';
import '../home/manager/page_manager.dart';
import '../home/pages/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;
  late bool _passwordVisible;
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
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
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    SizedBox(
                      height: height / 65,
                    ),
                    TextFormField(
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
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PressButtonWidget(
                      buttonText: 'Login',
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyPageManager()));
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
}
