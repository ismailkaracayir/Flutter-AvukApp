import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../constant/app_bar_widget.dart';
import '../../../../../../constant/constant.dart';
import '../../../../../../model/ilan_model.dart';

class PlaceAnAdPage extends StatefulWidget {
  const PlaceAnAdPage({super.key});

  @override
  State<PlaceAnAdPage> createState() => _PlaceAnAdPageState();
}

class _PlaceAnAdPageState extends State<PlaceAnAdPage> {
  final String _editIcon = "assets/icons/profile_design.svg";

  String? ilanAdi = "";
  bool confirm = false;
  void changeConfirm() {
    setState(() {
      confirm = !confirm;
    });
  }

  late DeclareModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "İlan Ver",
      ),
      body: Padding(
        padding: const PagePadding.allHigh(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              textCustomTitle(title: "İlan Adını Yazın"),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(
                  hintTextS: "İlan Adını yazınız",
                  labelTextS: "İlan Adı",
                ),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 30),
              textCustomTitle(title: "İlan İçeriğini Yazın"),
              const SizedBox(height: 10),
              TextFormField(
                decoration: inputDecoration(
                  hintTextS: "İlan İçeriğini yazınız",
                  labelTextS: "İlan İçeriği",
                ),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 30),
              textCustomTitle(title: "İlan Kategorisini Seçiniz"),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  _openSelectCategory(context);
                },
                child: const Text("Seçim Yap"),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: kNavyBlueColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: confirm == true
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kCreamColor,
                        ),
                      )
                    : Center(
                        child: GestureDetector(
                          onTap: () {
                            // print("Onayla");
                            changeConfirm();
                            Future.delayed(const Duration(seconds: 5), () {
                              changeConfirm();
                            });
                          },
                          child: const Text(
                            "Onayla",
                            style: TextStyle(
                              color: kCreamColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row textCustomTitle({required String title}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/bookmark.svg",
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: kNavyBlueColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  InputDecoration inputDecoration({
    required String hintTextS,
    required String labelTextS,
  }) {
    return InputDecoration(
      hintText: hintTextS,
      prefixIcon: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SvgPicture.asset(
          _editIcon,
          width: 20,
          height: 20,
        ),
      ),
      labelText: labelTextS,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: kNavyBlueColor,
        ),
        gapPadding: 10,
      ),
      errorStyle: const TextStyle(
        color: Colors.white,
        decoration: TextDecoration.underline,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: kNavyBlueColor,
          width: 1.5,
        ),
        gapPadding: 20,
      ),
    );
  }

  Future<String> _openSelectCategory(BuildContext context) async {
    String? selectCategory = await showDialog(
      context: context,
      builder: (BuildContext context) {
        int selectedClock = -1;

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          icon: Text(
            "Saat Seçiniz",
            style: customTextStyle(textSize: 20),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 400,
                  height: 200,
                  child: GridView.builder(
                    itemCount: alanCategory.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 6,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedClock = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kCreamColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: selectedClock == index
                                  ? kWineRedColor
                                  : Colors.grey.shade500,
                              width: 2,
                            ),
                          ),
                          child: Center(
                              child: Text(
                            alanCategory[index],
                          )),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          actions: [
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        kNavyBlueColor,
                      ),
                    ),
                    child: const Text("Çıkış"),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        kNavyBlueColor,
                      ),
                    ),
                    child: const Text("Onayla"),
                    onPressed: () {
                      if (selectedClock != -1) {
                        Navigator.pop(
                          context,
                          alanCategory[selectedClock],
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(width: 20),
              ],
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
    // print(selectCategory);
    if (selectCategory != null) {
      return selectCategory;
    } else {
      selectCategory = "Boş";
      return selectCategory;
    }
  }

  TextStyle customTextStyle({required double textSize}) {
    return TextStyle(
      color: kNavyBlueColor,
      fontSize: textSize,
      fontWeight: FontWeight.w500,
    );
  }
}

List<String> alanCategory = [
  "Ceza Hukuku",
  "Kamu Hukuku",
  "Mal Hukuku",
  "Ceza Hukuku",
  "Kamu Hukuku",
  "Mal Hukuku",
];
