// ignore_for_file: avoid_print

import 'package:avukapp/constant/app_bar_widget.dart';
import 'package:avukapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../model/appointment.dart';
import '../../../viewmodel/declare_view_model.dart';
import '../../../viewmodel/user_view_model.dart';

class LawyerMeetRewuestScreen extends StatefulWidget {
  const LawyerMeetRewuestScreen({super.key});

  @override
  State<LawyerMeetRewuestScreen> createState() =>
      _LawyerMeetRewuestScreenState();
}

class _LawyerMeetRewuestScreenState extends State<LawyerMeetRewuestScreen> {
  bool loading = false;
  late List<AppointmentModel> allAppointment = [];

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(appTitle: "Randevu Istekleri"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tekrar Hoşgeldiniz", style: greyTextStyle(fntSize: 20)),
                const Icon(
                  Icons.info_outline,
                  color: kNavyBlueColor,
                  size: 30,
                )
              ],
            ),
            Container(
              width: pageWidth,
              height: pageHeight * .5,
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
                        color: Colors.green.shade700,
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
                                  "Randevu İsteği Oluşturuldu",
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
                            const SizedBox(height: 5),
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
                                      "randevuIndex.createDate"
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
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
                              style: greyTextStyle(fntSize: 13),
                            ),
                            Text(
                              "Değerlendirmeyi unutmayın.",
                              style: greyTextStyle(fntSize: 13),
                            ),
                            Text(
                              "Hakaret söylemlerinde bulunmayın.",
                              style: greyTextStyle(fntSize: 13),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: double.infinity,
                                margin: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: kNavyBlueColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Detaylar",
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle greyTextStyle({required double fntSize}) {
    return TextStyle(
      letterSpacing: 0.8,
      wordSpacing: 2,
      color: Colors.grey,
      fontSize: fntSize,
      fontWeight: FontWeight.w600,
    );
  }

  Future<void> getAllMeeting() async {
    var user = Provider.of<UserViewModel>(context, listen: false);
    var declare = Provider.of<DeclareViewModel>(context, listen: false);

    if (user.user != null) {
      print("if e GİRDİ");
      var resoult = await declare.getForIdAppointment(user.user!.userID!);
      print(resoult.length);

      allAppointment = resoult;
      print("if ten çıktı");
    } else {
      print("if e GİRMEDİ");
    }
  }
}
