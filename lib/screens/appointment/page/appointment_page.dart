import 'package:avukapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant/app_bar_widget.dart';
import '../../../manager/navigator_manager.dart';
import '../../home/constant/const_clock.dart';
import 'pay/payment_page.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final String _appointmentIcon = "assets/icons/profile_date.svg";
  final String _editIcon = "assets/icons/profile_design.svg";
  final String _clockIcon = "assets/icons/profile_clock.svg";

  // randevu tipi seçimi için kullanılıyor bunu daha sonra -1 yapabilirsin.
  int randevuTipi = 0;
  bool? acceptTerms = false;
  String? selectedClock;

  // randevu tipi değişimi için kullanılıyor.
  void changeType() {
    setState(() {
      if (randevuTipi == 0) {
        randevuTipi = 1;
      } else {
        randevuTipi = 0;
      }
    });
  }

  // Tarih Seçimi
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2024, 12);

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "Randevu Al",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const PagePadding.symtcHrztHigh(),
          child: SizedBox(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                            _appointmentIcon,
                          ),
                        ),
                        const Expanded(
                          flex: 3,
                          child: Text(
                            "Randevu tarihlerini inceleyiniz",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kNavyBlueColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Divider(
                    thickness: 2.5,
                    color: kNavyBlueColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 20),
                  customSubjectTitle(titlee: "Randevu Tipini Seçin"),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: pageWidth,
                    height: pageHeight * 0.1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (randevuTipi != 0) {
                                changeType();
                              }
                            },
                            child: appntmntTypeSelection(
                              buttonName: "Arama ile Görüşme",
                              selectedIndex: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              if (randevuTipi != 1) {
                                changeType();
                              }
                            },
                            child: appntmntTypeSelection(
                              buttonName: "Video ile Görüşme",
                              selectedIndex: 1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  customSubjectTitle(
                    titlee: "Randevu Tarihini ve Saatini Seçin",
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                            label: Text(
                              "Tarih Seçin",
                              style: customTextStyle(textSize: 16),
                            ),
                            icon: SvgPicture.asset(
                              _appointmentIcon,
                              width: 28,
                              height: 28,
                            ),
                            onPressed: () => _openDatePicker(context),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton.icon(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                              ),
                            ),
                            label: Text(
                              "Saat Seçin",
                              style: customTextStyle(textSize: 16),
                            ),
                            icon: SvgPicture.asset(
                              _clockIcon,
                              width: 26,
                              height: 26,
                            ),
                            onPressed: () => _openClock(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: acceptTerms == true
                        ? () {
                            NavigatorManager().navigatToWidget(
                              context,
                              const PaymentPage(),
                            );
                          }
                        : null,
                    child: Container(
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
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                color: kNavyBlueColor.withOpacity(0.4),
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$selectedDate".split(" ")[0],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: kCreamColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "$selectedClock",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: kCreamColor,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          _openTerms(context);
                        },
                        child: const Text(
                          "Şartları Oku",
                          style: TextStyle(
                            color: kNavyBlueColor,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Checkbox(
                        value: acceptTerms,
                        activeColor: kNavyBlueColor,
                        checkColor: kCreamColor,
                        onChanged: (value) {
                          setState(() {
                            acceptTerms = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _openTerms(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("Buradaki şartlar kabul ediliyor."),
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  kNavyBlueColor,
                ),
              ),
              child: const Text("Kapat"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  // todo: Aynı olan konu başlıkları.
  Row customSubjectTitle({required String titlee}) {
    return Row(
      children: [
        SvgPicture.asset(
          _editIcon,
          width: 25,
          height: 25,
        ),
        const SizedBox(width: 15),
        Text(
          titlee,
          style: customTextStyle(textSize: 16),
        ),
      ],
    );
  }

  // todo: Randevu tarihinin seçilmesi
  _openDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  // todo: Randevu Saatinin seçilmesi
  _openClock(BuildContext context) async {
    String? mySaat = await showDialog(
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
                    itemCount: clockItems.length,
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
                            clockItems[index],
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
                          clockItems[selectedClock],
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
    if (mySaat != null) {
      // print(mySaat);

      setState(() {
        selectedClock = mySaat;
      });
    } else {
      mySaat == "Boş";
      // print(mySaat);
    }
  }

  // todo: Randevu tipinin seçilmesi
  Container appntmntTypeSelection({
    required String buttonName,
    required int selectedIndex,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: kCreamColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 2.2,
          color: randevuTipi == selectedIndex
              ? Colors.green
              : kNavyBlueColor.withOpacity(0.6),
        ),
      ),
      child: Text(
        buttonName,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: randevuTipi == selectedIndex
              ? Colors.green
              : kNavyBlueColor.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  TextStyle customTextStyle({required double textSize}) {
    return TextStyle(
      color: kNavyBlueColor,
      fontSize: textSize,
      fontWeight: FontWeight.w500,
    );
  }
}
/*



 */