import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/widgets/social_button.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneScreen extends StatefulWidget {
  const LoginWithPhoneScreen({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneScreen> createState() => _LoginWithPhoneScreenState();
}

class _LoginWithPhoneScreenState extends State<LoginWithPhoneScreen> {
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
                onPress: () {})
          ],
        ),
      ),
    );
  }
}
