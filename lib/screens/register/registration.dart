import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/screens/login/login.dart';
import 'package:avukapp/widgets/social_button.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../model/user.dart';
import '../../viewmodel/user_view_model.dart';
import 'lawyer_register_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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

  void _formSubmit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        var userModel = Provider.of<UserViewModel>(context, listen: false);
        final UserModel user = await userModel.createWithUserEmailAndPass(
          _emailController.text,
          _passwordController.text,
          _nameController.text,
        );
        debugPrint('EMAİL İLE KAYIT OLMA BAŞARILI');
        // ignore: use_build_context_synchronously
        await CoolAlert.show(
            backgroundColor: kNavyBlueColor,
            barrierDismissible: false,
            title: 'Başarılı!',
            context: context,
            type: CoolAlertType.success,
            text: 'Kayıt İşleminiz Tamamlandı...\n Anasayfaya Gidiliyor',
            autoCloseDuration: const Duration(seconds: 4),
            confirmBtnText: ' ',
            confirmBtnColor: Colors.white);
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      } catch (e) {
        debugPrint('register işleminde hata : ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  radius: 50,
                  child: SvgPicture.asset(
                    'assets/images/justice.svg',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    const Text(
                      "AvukApp",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text("Hukuki Danışmanlık Servisi"),
                    SizedBox(
                      height: height / 30,
                    ),
                    const Text(
                      "Kayıt Ol",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
////////////////////////////////////////////////////////////////////////////////
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Container(
                              //   width: width / 2,
                              //   height: height / 7,
                              //   child: Center(
                              //       child: Text(
                              //     "Sign Up",
                              //     style: TextStyle(fontWeight: FontWeight.bold),
                              //   )),
                              //   decoration: BoxDecoration(
                              //       shape: BoxShape.circle,
                              //       color: kCreamColor,
                              //       border: Border.all(
                              //           color: kNavyBlueColor, width: 1)),
                              // ),
                              SizedBox(
                                height: height / 90,
                              ),
                              Wrap(
                                runSpacing: height / 65,
                                children: [
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter your email';
                                      } else if (!RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(value)) {
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
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: _passwordVisible
                                              ? Icon(Icons.visibility)
                                              : Icon(Icons.visibility_off),
                                          onPressed: () {
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
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
                                      _formSubmit(context);
                                    },
                                    textColor: kWhiteColor,
                                  ),
                                ],
                              ),
                              Center(
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  },
                                  child: const Text(
                                    'Oturum aç',
                                    style: TextStyle(color: kWineRedColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height / 60,
                              ),
                              PressButtonWidget(
                                  buttonText:
                                      "Avukat mısın?\nHemen bize katıl!",
                                  buttonColor: kNavyBlueColor,
                                  textColor: kWhiteColor,
                                  buttonHeight: height / 10,
                                  buttonWeight: width,
                                  onPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LawyerRegisterPage()));
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),

///////////////////////////////////////////////////////////////////////////////////
                  ],
                ),
              ),
              // SocialButtonWidget(
              //   buttonText: "Mail ile kayıt ol",
              //   buttonIcon: Icon(MdiIcons.gmail),
              //   buttonHeight: height / 15,
              //   onPress: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => RegisterWithMailScreen()),
              //     );
              //   },
              //   buttonWidth: width,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
