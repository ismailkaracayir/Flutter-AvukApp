import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constant/app_bar_widget.dart';
import '../../../../../constant/constant.dart';
import '../../../widgets/my_custom_list_tile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.name});
  final String name;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final String _editIcon = "assets/icons/profile_design.svg";

  bool confirm = false;

  late String editedName = "-";
  late String editedPassword = "-";
  late String editedMail = "-";

  void changeConfirm() {
    setState(() {
      confirm = !confirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "Profil Düzenle",
      ),
      body: Padding(
        padding: const PagePadding.symtcHrztHigh(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  editedName = await openTheChangeButton(
                    context,
                    hintText: "Adınız - Soyadınızı Girin",
                    labelText: "Ad - Soyad",
                  );
                  setState(() {});
                },
                child: MyCustomListTileWidget(
                  titleName: "İsim Güncelle",
                  backgroundUrl: _editIcon,
                ),
              ),
              Text(editedName),
              GestureDetector(
                onTap: () async {
                  editedPassword = await openTheChangeButton(
                    context,
                    hintText: "Şifrenizi Girin",
                    labelText: "Şifre",
                  );
                  setState(() {});
                },
                child: MyCustomListTileWidget(
                  titleName: "Şifre Güncelle",
                  backgroundUrl: _editIcon,
                ),
              ),
              Text(editedPassword),
              GestureDetector(
                onTap: () async {
                  editedMail = await openTheChangeButton(
                    context,
                    hintText: "Mail Güncelleme",
                    labelText: "Mail",
                  );
                  setState(() {});
                },
                child: MyCustomListTileWidget(
                  titleName: "E-posta Güncelle",
                  backgroundUrl: _editIcon,
                ),
              ),
              Text(editedMail),
              GestureDetector(
                onTap: () async {
                  // editedMail = await openTheChangeButton(
                  //   context,
                  //   hintText: "-",
                  //   labelText: "-",
                  // );
                  // setState(() {});

                  //! SİLİNECEK
                  // ignore: avoid_print
                  print("Eklenecek");
                },
                child: MyCustomListTileWidget(
                  titleName: "Alan Güncelle",
                  backgroundUrl: _editIcon,
                ),
              ),
              const Text("-"),
              GestureDetector(
                onTap: () async {
                  // editedMail = await openTheChangeButton(
                  //   context,
                  //   hintText: "-",
                  //   labelText: "-",
                  // );
                  // setState(() {});

                  //! SİLİNECEK
                  // ignore: avoid_print
                  print("Eklenecek");
                },
                child: MyCustomListTileWidget(
                  titleName: "İçerik Güncelle",
                  backgroundUrl: _editIcon,
                ),
              ),
              const Text("-"),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: kCreamColor,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: kNavyBlueColor.withOpacity(0.6),
                    width: 2,
                  ),
                ),
                child: confirm == true
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kNavyBlueColor,
                        ),
                      )
                    : Center(
                        child: GestureDetector(
                          onTap: () {
                            print("Onayla");
                            changeConfirm();
                            Future.delayed(const Duration(seconds: 5), () {
                              changeConfirm();
                            });
                          },
                          child: Text(
                            "Onayla",
                            style: TextStyle(
                              color: kNavyBlueColor.withOpacity(0.6),
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

  Future<String> openTheChangeButton(
    BuildContext context, {
    required String hintText,
    required String labelText,
  }) async {
    String? edited = await showDialog(
      context: context,
      builder: (BuildContext context) {
        String? editName;
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          icon: const Text(
            "Güncelle",
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 400,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: inputDecoration(
                            hintTextS: hintText,
                            labelTextS: labelText,
                          ),
                          onChanged: (value) {
                            editName = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Adınızı soyadınızı 14 gün içinde sadece 2 defa değiştirebilirsiniz",
                        )
                      ],
                    ),
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
                      Navigator.pop(context, editName);
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
    print("object 1 ");
    if (edited != null) {
      print("object 2 ");
      return edited;
    } else {
      print("object 3 ");
      return "Düzeltilemedi";
    }
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
}
/*

TextFormField(
                decoration: inputDecoration(
                  hintTextS: "Adınız - Soyadınızı Girin",
                  labelTextS: "Ad - Soyad",
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: inputDecoration(
                  hintTextS: "Adınız - Soyadınızı Girin",
                  labelTextS: "Ad - Soyad",
                ),
              ),

 */