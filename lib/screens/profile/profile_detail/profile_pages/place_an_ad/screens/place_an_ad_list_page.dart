import 'package:avukapp/viewmodel/declare_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../constant/app_bar_widget.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../../model/declare.dart';
import '../../../../../../widgets/custom_card_widget.dart';
import '../../../../../../widgets/custom_card_widget_button.dart';

class PlaceAnAdList extends StatefulWidget {
  const PlaceAnAdList({super.key});

  @override
  State<PlaceAnAdList> createState() => _PlaceAnAdListState();
}

class _PlaceAnAdListState extends State<PlaceAnAdList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appTitle: "İlanlarım"),
      body: Padding(
        padding: const PagePadding.symtcHrztNormal(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCardWidget(
              moodel: DeclareModel(),
              sagButton: GestureDetector(
                onTap: () {
                  // ignore: avoid_print
                  print("Düzenleme işlemi");
                  _submit();
                },
                child: const CustomCardWidgetButton(
                  buttonTitle: "Düzenle",
                ),
              ),
              solButton: GestureDetector(
                onTap: () {
                  // ignore: avoid_print
                  print("ilandan kaldır");
                },
                child: const CustomCardWidgetButton(
                  buttonTitle: "İlandan Kaldır",
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
