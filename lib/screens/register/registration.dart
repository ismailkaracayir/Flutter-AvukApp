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
  final String logoUrl = "assets/images/justice.svg";

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
                    logoUrl,
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
                        padding: const EdgeInsets.all(16),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height / 90,
                              ),
                              Wrap(
                                runSpacing: height / 65,
                                children: [
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: inputDecoration(
                                      labelTextS: "Adınız",
                                      hintTextS: "Adınızı Girin",
                                      icon: const Icon(
                                        Icons.person,
                                        color: kNavyBlueColor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Lütfen adınızı giriniz';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: inputDecoration(
                                      labelTextS: "E-Posta",
                                      hintTextS: "E-Posta Adresiniz",
                                      icon: const Icon(
                                        Icons.email,
                                        color: kNavyBlueColor,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Lütfen e-posta adresinizi girin';
                                      } else if (!RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(value)) {
                                        return 'lütfen geçerli bir e-posta girin';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: !_passwordVisible,
                                    decoration: inputDecoration(
                                      hintTextS: "Şifre Girin",
                                      labelTextS: "Şifre",
                                      icon: const Icon(
                                        Icons.password,
                                        color: kNavyBlueColor,
                                      ),
                                      suffuxIcon: IconButton(
                                        icon: _passwordVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: kNavyBlueColor,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: kNavyBlueColor,
                                              ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Lütfen şifre girin';
                                      } else if (value.length < 6) {
                                        return 'Şifre uzunluğu 6 karakterden uzun olmalı';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: height / 25),
                                  PressButtonWidget(
                                    buttonColor: kNavyBlueColor,
                                    buttonHeight: height / 15,
                                    buttonWeight: width,
                                    buttonText: 'Kayıt Ol',
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
            ],
          ),
        ),
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
      labelStyle: const TextStyle(
        color: kNavyBlueColor,
      ),
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
        gapPadding: 16,
      ),
    );
  }
}
