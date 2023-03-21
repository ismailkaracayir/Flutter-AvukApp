import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/screens/login/login.dart';
import 'package:avukapp/screens/register/register_with_mail.dart';
import 'package:avukapp/screens/register/register_with_phone.dart';
import 'package:avukapp/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
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
                    Text(
                      "AvukApp",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Hukuki Danışmanlık Servisi"),
                    SizedBox(
                      height: height / 30,
                    ),
                    Text(
                      "Kayıt Ol",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height / 30,
                    )
                  ],
                ),
              ),
              SocialButtonWidget(
                buttonText: "Mail ile kayıt ol",
                buttonIcon: Icon(MdiIcons.gmail),
                buttonHeight: height / 15,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterWithMailScreen()),
                  );
                },
                buttonWidth: width,
              ),
              SizedBox(
                height: height / 70,
              ),
              SocialButtonWidget(
                buttonText: "Telefon ile Kayıt ol",
                buttonIcon: Icon(MdiIcons.phone),
                buttonHeight: height / 15,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterWithPhoneScreen()),
                  );
                },
                buttonWidth: width,
              ),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    'Oturum aç',
                    style: TextStyle(color: wineRedColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
