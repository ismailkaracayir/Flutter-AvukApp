import 'package:avukapp/constant/app_bar_widget.dart';
import 'package:avukapp/model/user.dart';
import 'package:avukapp/viewmodel/declare_view_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constant/const_clock.dart';
import '../../../constant/constant.dart';
import '../../../model/appointment.dart';
import '../../exception/login-exception.dart';

// UTKU BEN BURDA selectedDate DEĞİŞKENİNİN KULLANDIM , SENDEN BEKLEDİGİM SECTİRDİGİN TARİH VE SAATİ ONUN İÇİNE KATMAN

class LawyerMeetRequestDetailScreen extends StatefulWidget {
  const LawyerMeetRequestDetailScreen(
      {super.key, required this.model, required this.userModel});
  final AppointmentModel model;
  final UserModel userModel;
  @override
  State<LawyerMeetRequestDetailScreen> createState() =>
      _LawyerMeetRequestDetailScreenState();
}

class _LawyerMeetRequestDetailScreenState
    extends State<LawyerMeetRequestDetailScreen> {
  late String selectedClockx;
  DateTime selectedDate = DateTime.now();
  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2024, 12);

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(appTitle: "Randevu Detayları"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Container(
          width: pageWidth,
          height: pageHeight - 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: kNavyBlueColor,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 0.5,
              ), //BoxShadow
            ],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.model.isActive!
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Randevu isteğiniz var",
                              style: TextStyle(
                                color: Colors.white.withOpacity(.6),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  widget.model.createDate
                                      .toString()
                                      .split(' ')[0],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.model.isActive == true
                                  ? "Onaylandı"
                                  : "Onaylanmadı",
                              style: TextStyle(
                                color: Colors.white.withOpacity(.8),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Randevu görüşmelerini geciktirmeyin.",
                          style: greyTextStyle(fntSize: 12),
                        ),
                        Text(
                          "Değerlendirmeyi unutmayın.",
                          style: greyTextStyle(fntSize: 12),
                        ),
                        Text(
                          "Hakaret söylemlerinde bulunmayın.",
                          style: greyTextStyle(fntSize: 12),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          color: Colors.black12,
                          height: 100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: 100,
                                      child: Image.network(
                                        widget.userModel.profilImgURL!,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }

                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.userModel.userName!,
                                            style: greyTextStyle(
                                              fntSize: 14,
                                              colorCustm: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            widget.userModel.email!,
                                            style: greyTextStyle(
                                              fntSize: 14,
                                              colorCustm: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.model.description.toString() * 5,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (widget.model.isActive == false)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _openDatePicker(context);
                                },
                                child: const Text("GÜn Seç"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await _openClock(context);
                                  print(selectedClockx);
                                },
                                child: const Text("Saat Seç"),
                              ),
                            ],
                          ),
                        const Spacer(),
                        Row(
                          children: [
                            if (widget.model.isActive == false)
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    debugPrint('onaylaaaaa');
                                    submitAppointment(context);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: double.infinity,
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: kNavyBlueColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Onayla",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.cutiveMono(
                                            color: kCreamColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  debugPrint('iptal tıklandı');
                                  deleteAppointment(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: kNavyBlueColor,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "İptal",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.cutiveMono(
                                          color: kCreamColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: kNavyBlueColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Görüşmeye Katıl",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cutiveMono(
                                    color: kCreamColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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

  TextStyle greyTextStyle({
    required double fntSize,
    Color colorCustm = Colors.grey,
  }) {
    return TextStyle(
      letterSpacing: 0.8,
      wordSpacing: 2,
      color: colorCustm,
      fontSize: fntSize,
      fontWeight: FontWeight.w600,
    );
  }

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
        selectedClockx = mySaat;
      });
    } else {
      mySaat == "Boş";
      // print(mySaat);
    }
  }

  TextStyle customTextStyle({required double textSize}) {
    return TextStyle(
      color: kNavyBlueColor,
      fontSize: textSize,
      fontWeight: FontWeight.w500,
    );
  }

  void deleteAppointment(BuildContext context) async {
    try {
      await CoolAlert.show(
          backgroundColor: kNavyBlueColor,
          barrierDismissible: false,
          title: 'Randevı İsteği Siliniyor',
          context: context,
          type: CoolAlertType.info,
          text: 'Randevu isteğini silemk istediğinizden emin misiniz?',
          confirmBtnText: 'Onayla',
          showCancelBtn: true,
          cancelBtnText: 'Vazgeç',
          onConfirmBtnTap: () async {
            final appointment =
                Provider.of<DeclareViewModel>(context, listen: false);
            bool temp = await appointment
                .deleteAppointment(widget.model.appointmentID!);
            if (temp) {
              // ignore: use_build_context_synchronously
              Navigator.pop(context, temp);
            }
          },
          confirmBtnColor: kNavyBlueColor);
    } on FirebaseAuthException catch (e) {
      String temp = LoginException.exception(e.toString());
      Fluttertoast.showToast(
          msg: temp,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void submitAppointment(BuildContext context) async {
    try {
      await CoolAlert.show(
          backgroundColor: kNavyBlueColor,
          barrierDismissible: false,
          title: 'Randevı İsteği Onaylanıyor...',
          context: context,
          type: CoolAlertType.info,
          text: 'Randevu isteğini onaylamak istediğinizden emin misiniz?',
          confirmBtnText: 'Onayla',
          showCancelBtn: true,
          cancelBtnText: 'Vazgeç',
          onConfirmBtnTap: () async {
            final appointment =
                Provider.of<DeclareViewModel>(context, listen: false);
            bool temp = await appointment.confirmAppointmentLawyer(
                widget.model.appointmentID!, selectedDate);
            if (temp) {
              // ignore: use_build_context_synchronously
              Navigator.pop(context, temp);
            }
          },
          confirmBtnColor: kNavyBlueColor);
    } on FirebaseAuthException catch (e) {
      String temp = LoginException.exception(e.toString());
      Fluttertoast.showToast(
          msg: temp,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
