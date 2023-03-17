import 'package:avukapp/screens/home/constant/my_constant.dart';
import 'package:flutter/material.dart';

import '../../../widgets/main_cart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const PagePadding.symtcHrztNormal(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
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
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: _width * 0.65,
                height: _height * 0.15,
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 450,
                width: _width,
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return MainCart(
                      ad: Text("Utku"),
                      alan: Text("Bilgin"),
                      deneyim: Text("Bilgisayar Mühendisi"),
                      profilUrl: "",
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
}



/*

Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          width: _width * 0.4,
                          height: 300,
                          color: Colors.green,
                          child: const Text("data"),
                        ),
                      ),
                    );

 */