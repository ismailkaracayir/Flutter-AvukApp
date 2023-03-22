import 'package:flutter/material.dart';

import '../../../../constant/app_bar_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.name});
  final String name;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "Profil Düzenle",
      ),
      body: Column(
        children: [
          Text(widget.name),
        ],
      ),
    );
  }
}
