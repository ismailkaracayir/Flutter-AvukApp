// ignore_for_file: avoid_print

import 'package:avukapp/manager/navigator_manager.dart';
import 'package:avukapp/model/declare.dart';
import 'package:avukapp/viewmodel/declare_view_model.dart';
import 'package:avukapp/viewmodel/lawyer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constant/constant.dart';
import '../../constant/hukuk_category.dart';
import '../../model/lawyer.dart';
import '../../viewmodel/user_view_model.dart';
import '../appointment/page/appointment_page.dart';
import '../../widgets/custom_card_widget.dart';
import '../../widgets/custom_card_widget_button.dart';
import '../profile/profile_detail/profile_pages/place_an_ad/screens/place_an_ad_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double removeHeight = 240;
  bool loading = false;
  bool showFloatButton = false;
  late List<DeclareModel> allDeclare = [];
  late List<DeclareModel> resoultSerchDeclare = [];
  late List<String> butunHukukKategorileri;

  TextEditingController kotegoriController = TextEditingController();

  Future<void> change() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = !loading;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    change();
    butunHukukKategorileri = hukukAlanlari;
    controlIsLayerAndOk();
    getAllDeclare();
    debugPrint('HOMEPAGE İNİT STATE ÇALIŞTI');
  }

  void kategoriArama(String value) {
    resoultSerchDeclare = [];
    for (var ilan in allDeclare) {
      if (ilan.declareCategory!.toUpperCase().contains(value.toUpperCase())) {
        resoultSerchDeclare.add(ilan);
        setState(() {});
      }
    }
  }

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

        showFloatButton = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentuser = Provider.of<UserViewModel>(context, listen: false);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: showFloatButton == true
            ? FloatingActionButton(
                backgroundColor: kNavyBlueColor,
                onPressed: () {
                  NavigatorManager().navigatToWidget(
                    context,
                    const PlaceAnAdPage(),
                  );
                },
                child: const Icon(
                  Icons.add,
                ),
              )
            : null,
        body: Padding(
          padding: const PagePadding.symtcHrztNormal(),
          child: SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  controller: kotegoriController,
                  decoration: homeTextFieldDecoration(),
                  onChanged: (value) {
                    kategoriArama(value);
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: height - removeHeight,
                  child: loading == true
                      ? ListView.builder(
                          itemCount: resoultSerchDeclare.isNotEmpty
                              ? resoultSerchDeclare.length
                              : allDeclare.length,
                          itemBuilder: (context, index) {
                            DeclareModel declareModel =
                                resoultSerchDeclare.isNotEmpty
                                    ? resoultSerchDeclare[index]
                                    : allDeclare[index];

                            return GestureDetector(
                                onTap: () async {
                                  print("$index no lu avukata tıklandı");
                                },
                                child: CustomCardWidget(
                                  moodel: declareModel,
                                  url: currentuser.user!.profilImgURL,
                                  sagButton: GestureDetector(
                                    onTap: () {},
                                    child: const CustomCardWidgetButton(
                                      buttonTitle: "Kaydet",
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
                                ));
                          },
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: kNavyBlueColor,
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration homeTextFieldDecoration() {
    return InputDecoration(
      hintText: "Kategori Aram",
      labelText: "Ara",
      prefixIcon: const Padding(
        padding: EdgeInsets.only(left: 12.0, right: 6),
        child: Icon(
          Icons.search,
          color: kNavyBlueColor,
        ),
      ),
      hintStyle: const TextStyle(color: kNavyBlueColor),
      labelStyle: const TextStyle(color: kNavyBlueColor),
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
    );
  }

  Future<void> getAllDeclare() async {
    var declare = Provider.of<DeclareViewModel>(context, listen: false);
    var resoult = await declare.getAllDeclare();
    allDeclare = resoult;
    resoultSerchDeclare = resoult;
    setState(() {});
  }

  TextStyle customTextStyle({
    required double textSize,
    Color? colorx = kNavyBlueColor,
  }) {
    return TextStyle(
      color: colorx,
      fontSize: textSize,
      fontWeight: FontWeight.w500,
    );
  }
}
