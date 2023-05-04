import 'package:avukapp/viewmodel/declare_view_model.dart';
import 'package:avukapp/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../constant/app_bar_widget.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../../manager/navigator_manager.dart';
import '../../../../../../model/declare.dart';
import '../../../../../../widgets/custom_card_widget.dart';
import '../../../../../../widgets/custom_card_widget_button.dart';
import '../ilan_duzenle/ilan_duzenle.dart';

class PlaceAnAdList extends StatefulWidget {
  const PlaceAnAdList({super.key});

  @override
  State<PlaceAnAdList> createState() => _PlaceAnAdListState();
}

class _PlaceAnAdListState extends State<PlaceAnAdList> {
  late List<DeclareModel> declareList;
  bool loading = false;
  Future<void> change() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        loading = !loading;
      });
    });
  }

  Future<void> getDeclareForLawyer() async {
    final lawyer = Provider.of<UserViewModel>(context, listen: false);
    final declare = Provider.of<DeclareViewModel>(context, listen: false);
    declareList = await declare.getForIdDeclare(lawyer.user!.userID!);

    for (var i = 0; i < declareList.length; i++) {
      print("$i declare");
    }
  }

  @override
  void initState() {
    super.initState();
    change();
    declareList = [];
    getDeclareForLawyer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appTitle: "İlanlarım"),
      body: Padding(
        padding: const PagePadding.symtcHrztNormal(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: loading == true
                    ? ListView.builder(
                        itemCount: declareList.length,
                        itemBuilder: (context, index) {
                          DeclareModel declareModel = declareList[index];
                          return CustomCardWidget(
                            moodel: declareModel,
                            solButton: GestureDetector(
                              onTap: () {},
                              child: const CustomCardWidgetButton(
                                buttonTitle: "Sil",
                              ),
                            ),
                            sagButton: GestureDetector(
                              onTap: () {
                                NavigatorManager().navigatToWidget(
                                  context,
                                  IlanDuzenle(
                                    model: declareModel,
                                  ),
                                );
                              },
                              child: const CustomCardWidgetButton(
                                buttonTitle: "Düzenle",
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: kNavyBlueColor,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    final temp = Provider.of<DeclareViewModel>(context, listen: false);
    temp.getAllDeclare();
  }
}
