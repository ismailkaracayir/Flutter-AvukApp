// ignore_for_file: avoid_print

import 'package:avukapp/constant/app_bar_widget.dart';
import 'package:avukapp/viewmodel/lawyer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../model/appointment.dart';
import '../../../model/lawyer.dart';

class MemberMeetingDetailScreen extends StatefulWidget {
  const MemberMeetingDetailScreen({
    super.key,
    required this.model,
  });
  final AppointmentModel model;

  @override
  State<MemberMeetingDetailScreen> createState() =>
      _MemberMeetingDetailScreenState();
}

class _MemberMeetingDetailScreenState extends State<MemberMeetingDetailScreen> {
  late LawyerModel _lawyerModel;
  bool loading = false;
  @override
  void initState() {
    super.initState();

    getLawyer();
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(appTitle: "Randevu Detay"),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: loading == true
            ? Container(
                width: pageWidth,
                height: pageHeight * .8,
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
                      flex: 4,
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
                              const SizedBox(height: 16),
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
                              const SizedBox(height: 20),
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
                                              "https://st.depositphotos.com/1779253/5140/v/950/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg",
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }

                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            children: [
                                              Text(
                                                _lawyerModel.userName
                                                    .toString(),
                                              ),
                                              Text(
                                                _lawyerModel.lawyerField
                                                    .toString(),
                                              ),
                                              Text(
                                                _lawyerModel.lawyerExperience
                                                    .toString(),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  print(_lawyerModel.profilImgURL);
                                },
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
                              if (widget.model.isActive == false)
                                Container(
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
                                        "Sil",
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

  Future<void> getLawyer() async {
    print("getLawyer girdi");
    loading = false;
    final lawyer = Provider.of<LawyerViewModel>(context, listen: false);
    _lawyerModel = await lawyer.readLawyer(widget.model.lawyerID!);
    loading = true;

    setState(() {});
    print("getLawyer çıktı");
    print(_lawyerModel.userName);
  }
}
