import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class MyNotificationPage extends StatefulWidget {
  const MyNotificationPage({super.key});

  @override
  State<MyNotificationPage> createState() => _MyNotificationPageState();
}

class _MyNotificationPageState extends State<MyNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: Column(children: const [Text("Notification")]),
      ),
    );
  }
}
