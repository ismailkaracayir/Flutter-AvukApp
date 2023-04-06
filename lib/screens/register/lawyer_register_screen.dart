import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LawyerRegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController baroNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LawyerRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 140,
              height: 140,
              child: SvgPicture.asset(
                "assets/images/justice.svg",
              ),
            ),
            Wrap(
              runSpacing: 15,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: inputDecoration(lblText: "Adınızı Girin"),
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  controller: surnameController,
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(lblText: "Soyadınızı Girin"),
                ),
                TextFormField(
                  controller: baroNumberController,
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(lblText: "Baro sicil numarası"),
                ),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: inputDecoration(lblText: "E-postanızı girin"),
                ),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: inputDecoration(lblText: "Şifrenizi Girin"),
                ),
                const SizedBox(height: 16.0),
                PressButtonWidget(
                  buttonText: "Register",
                  buttonColor: kNavyBlueColor,
                  textColor: kWhiteColor,
                  buttonHeight: height / 20,
                  buttonWeight: width,
                  onPress: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration({required String lblText}) {
    return InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      labelText: lblText,
    );
  }
}
