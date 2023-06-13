import 'package:avukapp/admin/admin_onay/admin_panel.dart';
import 'package:avukapp/manager/page_manager.dart';
import 'package:avukapp/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/user_view_model.dart';

// BU SAYFA YÖNLENDİRME SAYFASI , OTURUM AÇAN YADA KAYIT OLAN KULLANICIYI YÖNLENDİRİR
class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _usermodel = Provider.of<UserViewModel>(context);

    if (_usermodel.state == ViewState.Idle) {
      if (_usermodel.user != null) {
        if (_usermodel.user!.email == "avukap@avukap.com") {
          return const AdminPanelPage();
        } else {
          return const MyPageManager();
        }
      } else {
        return const LoginScreen();
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
