// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../constant/app_bar_widget.dart';
import '../../../../../manager/navigator_manager.dart';
import '../../../../../model/lawyer.dart';
import '../../../../../viewmodel/lawyer_view_model.dart';
import '../../../../../viewmodel/user_view_model.dart';
import '../../../../../widgets/my_custom_list_tile.dart';
import 'screens/place_an_ad_list_page.dart';
import 'screens/place_an_ad_page.dart';

class PlaceAnAdBody extends StatefulWidget {
  const PlaceAnAdBody({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _PlaceAnAdBodyState extends State<PlaceAnAdBody> {
  bool showAlert = false;
  bool disableButton = true;

  final String _shareIcon = "assets/icons/share.svg";
  final String _listIcon = "assets/icons/list.svg";

  Future<void> controlIsLayerAndOk() async {
    final userProvider = Provider.of<UserViewModel>(context, listen: false);
    final lawyerProvider = Provider.of<LawyerViewModel>(context, listen: false);

    if (userProvider.user != null && userProvider.user!.isLawyer == 1) {
      print("user nul değil ve avukat okey");

      LawyerModel model = await lawyerProvider.readLawyer(
        userProvider.user!.userID!,
      );

      if (model.isActive == true) {
        print("avukat onaylandı");

        showAlert = true;
        disableButton = false;
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    controlIsLayerAndOk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appTitle: "İlan Ayarları"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            if (showAlert == false)
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red.shade500,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        "Avukat onaylama sürecinde....",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                ],
              ),
            GestureDetector(
              onTap: disableButton == false
                  ? () {
                      NavigatorManager().navigatToWidget(
                        context,
                        const PlaceAnAdPage(),
                      );
                    }
                  : null,
              child: MyCustomListTileWidget(
                backgroundUrl: _shareIcon,
                titleName: "İlan Ver",
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: disableButton == false
                  ? () {
                      NavigatorManager().navigatToWidget(
                        context,
                        const PlaceAnAdList(),
                      );
                    }
                  : null,
              child: MyCustomListTileWidget(
                backgroundUrl: _listIcon,
                titleName: "İlanlarım",
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
