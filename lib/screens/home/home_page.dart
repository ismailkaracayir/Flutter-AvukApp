import 'package:avukapp/manager/navigator_manager.dart';
import 'package:avukapp/model/ilan_model.dart';
import 'package:avukapp/model/user.dart';
import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../appointment/page/appointment_page.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_card_widget_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> categories = [
    "Ceza Hukuku uufufuuf ufuuf",
    "Mal Hukuku",
    "Kamu Hukuku",
    "Ceza Hukuku",
    "Mal Hukuku",
    "Kamu Hukuku",
  ];

  int selectedCategory = -1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const PagePadding.symtcHrztNormal(),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                decoration: homeTextFieldDecoration(),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: width,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: kNavyBlueColor.withOpacity(0.7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: const TextStyle(
                                color: kCreamColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: height * 0.7,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // ignore: avoid_print
                        print("$index no lu avukata tıklandı");
                      },
                      child: CustomCardWidget(
                        moodel: DeclareModel(
                          declareCategory: "KAMUUU HKUUKUKU",
                          lawyerName: "UTKU BİLGİN SAÜÜÜÜ",
                        ),
                        sagButton: GestureDetector(
                          onTap: () {},
                          child: const CustomCardWidgetButton(
                            buttonTitle: "Soru Sor",
                          ),
                        ),
                        solButton: GestureDetector(
                          onTap: () {
                            NavigatorManager().navigatToWidget(
                              context,
                              const AppointmentPage(),
                            );
                          },
                          child: const CustomCardWidgetButton(
                            buttonTitle: "Randevu Al",
                          ),
                        ),
                      ),
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
          color: kNavyBlueColor,
        ),
      ),
      hintStyle: const TextStyle(color: kWineRedColor),
      labelStyle: const TextStyle(color: kWineRedColor),
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kWineRedColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kWineRedColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
    );
  }
}
/*




 */