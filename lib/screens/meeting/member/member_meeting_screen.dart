// ignore_for_file: avoid_print

import 'package:avukapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constant/app_bar_widget.dart';
import '../../../model/appointment.dart';
import '../../../viewmodel/declare_view_model.dart';
import '../../../viewmodel/user_view_model.dart';
import 'member_meet_detail_screen.dart';

class MemberMeetingScreen extends StatefulWidget {
  const MemberMeetingScreen({super.key});

  @override
  State<MemberMeetingScreen> createState() => _MemberMeetingScreenState();
}

class _MemberMeetingScreenState extends State<MemberMeetingScreen> {
  bool loading = false;
  late List<AppointmentModel> allAppointment = [];

  @override
  void initState() {
    super.initState();
    change();
    getAllMeeting();
  }

  Future<void> change() async {
    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        loading = !loading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(appTitle: "Randevularım"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: loading == true
            ? ListView.builder(
                itemCount: allAppointment.length,
                itemBuilder: (context, index) {
                  AppointmentModel randevuIndex = allAppointment[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: pageWidth,
                      height: pageHeight * .35,
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
                                color: randevuIndex.isActive!
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.date_range_outlined,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(width: 20),
                                            Text(
                                              randevuIndex.createDate
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
                                          randevuIndex.isActive == true
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
                                      style: greyTextStyle(),
                                    ),
                                    Text(
                                      "Değerlendirmeyi unutmayın.",
                                      style: greyTextStyle(),
                                    ),
                                    Text(
                                      "Hakaret söylemlerinde bulunmayın.",
                                      style: greyTextStyle(),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MemberMeetingDetailScreen(
                                              model: randevuIndex,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        height: 40,
                                        width: double.infinity,
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: kNavyBlueColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
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
    );
  }

  TextStyle greyTextStyle() {
    return const TextStyle(
      letterSpacing: 0.75,
      wordSpacing: 2,
      color: Colors.grey,
      fontSize: 13,
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
/*

Text(
                            randevuIndex.description.toString(),
                            style: const TextStyle(
                              color: kCreamColor,
                            ),
                          ),
                          Text(
                            randevuIndex.isActive.toString(),
                            style: const TextStyle(
                              color: kCreamColor,
                            ),
                          ),
                          Text(
                            randevuIndex.appointmentDate.toString(),
                            style: const TextStyle(
                              color: kCreamColor,
                            ),
                          ),

 */
