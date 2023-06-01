import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../widgets/align_onbord_button.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int newHeight = height.round();

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
              children: const [
                // SvgPicture.asset(
                //   "assets/icons/logo.svg",
                //   height: 120,
                //   width: 200,
                // ),
                SizedBox(height: 20),
                Text(
                  "AvukApp'e\nHoşgeldiniz",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
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
          "assets/images/ana_1.jpeg",
        ),
      );
}















// Widget buildBackgroundImage(double heighContainer) => Column(
  //       children: [
          // Container(
          //   height: heighContainer,
          //   alignment: Alignment.topCenter,
          //   child: Image.asset(
          //     "assets/images/app1a.png",
          //   ),
          // ),
          // const Spacer(),
          // Container(
          //   height: heighContainer,
          //   alignment: Alignment.centerLeft,
          //   child: Image.asset(
          //     "assets/images/meal1b.png",
          //   ),
          // ),
          // const Spacer(),
  //         Container(
  //           height: heighContainer,
  //           alignment: Alignment.bottomRight,
  //           child: Image.asset(
  //             "assets/images/ana_1.jpeg",
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ],
  //     );