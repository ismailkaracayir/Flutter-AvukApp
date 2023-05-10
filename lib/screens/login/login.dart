import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/manager/navigator_manager.dart';
import 'package:avukapp/model/user.dart';
import 'package:avukapp/screens/login/login_with_phone.dart';
import 'package:avukapp/screens/register/registration.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../admin/admin_login/admin_page.dart';
import '../../viewmodel/user_view_model.dart';
import '../../widgets/social_button.dart';
import '../landing_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
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
      resizeToAvoidBottomInset: false,
      //textfielda basıldıgında ekranın tamamının yukarıya doğru sıkışmasını engeller

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width / 2,
            height: height / 7,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kCreamColor,
              border: Border.all(color: kNavyBlueColor, width: 1),
            ),
            child: const Center(
                child: Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: inputDecoration(
                        labelTextS: "E-posta",
                        hintTextS: "",
                        icon: const Icon(
                          Icons.email,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'E-posta adresinizi giriniz';
                        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Geçerli bir e-posta giriniz';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height / 65,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: inputDecoration(
                        labelTextS: "Şifre",
                        hintTextS: "",
                        icon: const Icon(
                          Icons.password,
                        ),
                        suffuxIcon: IconButton(
                          icon: _passwordVisible
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_passwordVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Lütfen şifre giriniz';
                        } else if (value.length < 6) {
                          return 'Şifre 6 karakterden büyük olmalı';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PressButtonWidget(
                      buttonText: 'Giriş Yap',
                      onPress: () {
                        userLogin();
                        //login();
                      },
                      buttonColor: kNavyBlueColor,
                      buttonHeight: 50,
                      textColor: kWhiteColor,
                      buttonWeight: 250,
                    ),
                    const SizedBox(height: 10),
                    SocialButtonWidget(
                      buttonText: "Google ile Giriş Yap",
                      buttonIcon: const Icon(
                        MdiIcons.googlePlus,
                        color: kWhiteColor,
                      ),
                      onPress: () {
                        singInWithGoogle();
                      },
                      buttonHeight: 40,
                      buttonWidth: width,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegistrationScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Kayıt Ol",
                            style: TextStyle(
                              color: kNavyBlueColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        NavigatorManager()
                            .navigatToWidget(context, const AdminLoginPage());
                      },
                      child: const Text(
                        "Yönetici Giriş",
                        style: TextStyle(
                          color: kNavyBlueColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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

  InputDecoration inputDecoration({
    required String hintTextS,
    required String labelTextS,
    required Widget icon,
    Widget suffuxIcon = const SizedBox(),
  }) {
    return InputDecoration(
      hintText: hintTextS,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(10.0),
        child: icon,
      ),
      suffixIcon: suffuxIcon,
      labelText: labelTextS,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: kNavyBlueColor,
        ),
        gapPadding: 10,
      ),
      errorStyle: const TextStyle(
        color: kWineRedColor,
        decoration: TextDecoration.underline,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
        gapPadding: 20,
      ),
    );
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
                    child: const Text(
                      "Kapat",
                    ))
              ],
              title: const Text("Hata!"),
              // contentPadding: EdgeInsets.all(10),
              content: Text(message),
            ));
  }

  void userLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        var userModel = Provider.of<UserViewModel>(context, listen: false);
        final UserModel user = await userModel.singInWithEmailAndPass(
            emailController.text, passwordController.text);
        debugPrint('EMAİL İLE GİRİŞ YAPMA BAŞARILI');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LandingPage(),
          ),
        );
      } catch (e) {
        debugPrint('LOGİN İŞLEMİNDE HATA  : ${e.toString()}');
      }
    }
  }

  void singInWithGoogle() async {
    try {
      final usermodel = Provider.of<UserViewModel>(context, listen: false);
      UserModel user = await usermodel.singInWithGoogle();
      debugPrint(
          'GOOGLE GMAİL İLE OTURUM ACAN KULLANICI ${user.userID.toString()}');
    } catch (e) {
      debugPrint('GOOGLE GİRİŞ YAPMA SEÇENEGİ HATA CIKTI ${e.toString()}');
    }
  }
}