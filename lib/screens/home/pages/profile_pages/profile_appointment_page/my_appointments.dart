import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../constant/app_bar_widget.dart';
import '../../../../../constant/constant.dart';

import '../../../../../model/appointment_model.dart';

class MyAppointmentPage extends StatefulWidget {
  const MyAppointmentPage({super.key});

  @override
  State<MyAppointmentPage> createState() => _MyAppointmentPageState();
}

class _MyAppointmentPageState extends State<MyAppointmentPage> {
  final List<AppointmentModel> items = [
    AppointmentModel(
      id: "utku",
      idAvukat: "000",
      idMusteri: "111",
      randevuTarihi: "01.01.2023",
      radevuSaat: "9.30",
      randevuUcret: 500,
      isActive: true,
    ),
    AppointmentModel(
      id: "utku",
      idAvukat: "000",
      idMusteri: "111",
      randevuTarihi: "01.01.2023",
      radevuSaat: "9.30",
      randevuUcret: 500,
      isActive: false,
    ),
    AppointmentModel(
      id: "utku",
      idAvukat: "000",
      idMusteri: "111",
      randevuTarihi: "01.01.2022",
      radevuSaat: "10.30",
      randevuUcret: 180,
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double scrnHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "Randevularım",
      ),
      body: Padding(
        padding: const PagePadding.symtcHrztHigh(),
        child: SizedBox(
          height: scrnHeight - 100,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey.shade200,
                  ),
                  width: double.infinity,
                  height: scrnHeight * 0.20,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: items[index].isActive == true
                                  ? Colors.green
                                  : Colors.red,
                              height: scrnHeight * 0.20,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Container(
                              height: scrnHeight * 0.20,
                              color: Colors.black12,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/profile_language.svg",
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    "id: ${items[index].idAvukat.toString()}",
                                    style: const TextStyle(
                                      color: kNavyBlueColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "Avukat Adı",
                                    style: TextStyle(
                                      color: kNavyBlueColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: SizedBox(
                              height: scrnHeight * 0.20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      items[index].randevuTarihi.toString(),
                                      style: const TextStyle(
                                        color: kNavyBlueColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      items[index].radevuSaat.toString(),
                                      style: const TextStyle(
                                        color: kNavyBlueColor,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          "${items[index].randevuUcret.toString()} TL",
                                          style: const TextStyle(
                                            color: kNavyBlueColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: SizedBox(
                              height: scrnHeight * 0.20,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  "assets/icons/profile_design.svg",
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*





Row customSubjectTitle({required String titlee}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/profile_design.svg",
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 20),
        Text(
          titlee,
          style: customTextStyle(textSize: 22),
        ),
      ],
    );
  }

  TextStyle customTextStyle({required double textSize}) {
    return TextStyle(
      color: kNavyBlueColor,
      fontSize: textSize,
      fontWeight: FontWeight.w500,
    );
  }



 */
// bottomNavigationBar: BottomNavigationBar(
//   currentIndex: selectinIndex,
//   selectedFontSize: 18,
//   unselectedFontSize: 16,
//   selectedItemColor: kCreamColor,
//   unselectedItemColor: kCreamColor.withOpacity(0.5),
//   items: const [
//     BottomNavigationBarItem(
//       icon: SizedBox(),
//       label: "Aktif Randevularım",
//     ),
//     BottomNavigationBarItem(
//       icon: SizedBox(),
//       label: "Geçmiş Randevularım",
//     ),
//   ],
//   onTap: (value) {
//     setState(() {
//       selectinIndex = value;
//       myPage.jumpToPage(selectinIndex);
//     });
//   },
//   backgroundColor: kNavyBlueColor,
//   showSelectedLabels: true,
// ),


