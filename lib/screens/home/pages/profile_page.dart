import 'package:flutter/material.dart';
import '../constant/my_constant.dart';

class MyUserProfilePage extends StatefulWidget {
  const MyUserProfilePage({super.key});

  @override
  State<MyUserProfilePage> createState() => _MyUserProfilePageState();
}

class _MyUserProfilePageState extends State<MyUserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: Column(
          children: const [
            Text("Profil Sayfası"),
          ],
        ),
      ),
    );
  }
}
