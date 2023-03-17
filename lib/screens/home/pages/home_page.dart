import 'package:avukapp/screens/home/constant/my_constant.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: Column(
          children: [
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
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                    color: kMyPrimaryColor,
                  ),
                  gapPadding: 10,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(
                    color: kMyPrimaryTextColor,
                    width: 1.5,
                  ),
                  gapPadding: 10,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const Text("Utku");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
