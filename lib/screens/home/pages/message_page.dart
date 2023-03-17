import 'package:flutter/material.dart';

import '../constant/my_constant.dart';

class MyMessagePage extends StatefulWidget {
  const MyMessagePage({super.key});

  @override
  State<MyMessagePage> createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: Column(
          children: const [Text("Message")],
        ),
      ),
    );
  }
}
