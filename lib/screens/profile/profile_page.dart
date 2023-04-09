import 'package:avukapp/screens/profile/lawyer_profile_page.dart';
import 'package:avukapp/screens/profile/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/lawyer.dart';
import '../../viewmodel/user_view_model.dart';

class MyUserProfilePage extends StatefulWidget {
  const MyUserProfilePage({super.key});

  @override
  State<MyUserProfilePage> createState() => _MyUserProfilePageState();
}

class _MyUserProfilePageState extends State<MyUserProfilePage> {
  late LawyerModel lawyerModel;
  late int isLawyer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context, listen: false);
    isLawyer = user.user!.isLawyer!;
    return Scaffold(
        body: isLawyer == 0
            ? const LawyerProfilePage()
            : const UserProfilePage());
  }
}
