import 'package:flutter/material.dart';
import '../../../constant/constant.dart';
import '../../appointment/page/appointment_page.dart';

class MyProfileCard extends StatelessWidget {
  final String ad;
  final String deneyim;
  final String alan;
  final Widget randevuButtom;
  final Widget soruButton;
  final String profilUrl;

  const MyProfileCard({
    super.key,
    required this.ad,
    required this.deneyim,
    required this.alan,
    required this.randevuButtom,
    required this.soruButton,
    this.profilUrl = "h",
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
        elevation: 2,
        margin: const DefaultPadding.allLow(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: kNavyBlueColor.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        for (int i = 0; i < 5; i++)
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.amber,
                          ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      ad,
                      style: newTextStyleMethod(textSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 150,
                    child: Text(
                      alan,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: newTextStyleMethod(textSize: 16),
                    ),
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    width: 150,
                    child: Text(
                      deneyim,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AppointmentPage(),
                              ));
                        },
                        child: newCardStyleMethod(question: "Randevu Al"),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: newCardStyleMethod(question: "Soru Sor"),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

  Container newCardStyleMethod({required String question}) {
    return Container(
      height: 30,
      width: 84,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Center(
        child: Text(
          question,
          style: const TextStyle(
            color: kNavyBlueColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  TextStyle newTextStyleMethod({required double textSize}) {
    return TextStyle(
      fontSize: textSize,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }
}
