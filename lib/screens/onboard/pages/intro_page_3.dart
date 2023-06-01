import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../widgets/align_onbord_button.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        buildBackgroundImage(width, height),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: width,
            height: height,
            color: kNavyBlueColor.withOpacity(0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   "assets/icons/logo.svg",
                //   height: 120,
                //   width: 200,
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                  child: Column(
                    children: const [
                      Text(
                        "Hoşgeldiniz",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46,
                        ),
                      ),
                      Text(
                        "Randevu al ve görüşmeye başla",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: kMyFontSizelow,
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    "Barınaklara yardımlar yapmaya devam ediyoruz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: kMyFontSizeNormal,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    child: Text(
                      "Gelirlerimizden biz biraz para kazanıyoruz ve kazandığımız bu paranın %10’luk kısmını sevgili arkadaşlarımızın maması için ayırıyoruz. Sizin sayenizde :)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: kMyFontSizelow,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const OnboardAligmenButtons(),
      ],
    );
  }

  Widget buildBackgroundImage(
    double widthSize,
    double heightSize,
  ) =>
      SizedBox(
        width: widthSize,
        height: heightSize,
        child: Image.asset(
          "assets/images/el_tutusma2.png",
          fit: BoxFit.cover,
        ),
      );
}
