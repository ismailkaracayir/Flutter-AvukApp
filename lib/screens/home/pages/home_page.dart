import 'package:avukapp/screens/home/constant/my_constant.dart';
import 'package:flutter/material.dart';
import '../widgets/my_profile_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const PagePadding.symtcHrztNormal(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                decoration: homeTextFieldDecoration(),
              ),
              const SizedBox(height: 10),
              Container(
                width: width * 0.65,
                height: height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 450,
                width: width,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.8,
                  ),
                  itemBuilder: (context, index) {
                    return MyProfileCard(
                      ad: "Utku Bilgin",
                      alan: "Cezaaa Hukukuku",
                      deneyim:
                          "Sakarya Üniversitesi Hukuku dnakd njkadwjb kwaj",
                      profilUrl: "yok",
                      randevuButtom: Container(),
                      soruButton: Container(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration homeTextFieldDecoration() {
    return InputDecoration(
      hintText: "Aramak istediğiniz kelimeyi yaz...",
      labelText: "Ara",
      prefixIcon: const Padding(
        padding: EdgeInsets.only(left: 12.0, right: 6),
        child: Icon(
          Icons.search,
          color: kMyBackgroundColor,
        ),
      ),
      hintStyle: const TextStyle(color: kMyBackgroundColor),
      labelStyle: const TextStyle(color: kMyBackgroundColor),
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kMyPrimaryTextColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kMyBackgroundColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
    );
  }
}
