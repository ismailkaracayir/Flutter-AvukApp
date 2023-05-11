import 'package:avukapp/constant/constant.dart';
import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  // GİRİŞ YÖNTEMLERİ İÇİN KULLANILACAK BUTTON (GOOGLE ,EMAİL VS.)
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Widget buttonIcon;
  final double buttonHeight;
  final VoidCallback onPress;
  final double buttonWidth;

  const SocialButtonWidget(
      {super.key,
      required this.buttonText,
      required this.buttonIcon,
      this.buttonColor = kNavyBlueColor,
      this.textColor = kWhiteColor,
      required this.buttonHeight,
      required this.buttonWidth,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
          iconSize: MaterialStateProperty.all(20),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.black38),
            ),
          ),
          alignment: Alignment.center,
          fixedSize: MaterialStateProperty.all(Size(buttonWidth, buttonHeight)),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          overlayColor: MaterialStateProperty.all(
            textColor.withOpacity(0.3),
          ),
          // elevation: MaterialStateProperty.all(20),
        ),
        onPressed: onPress,
        icon: buttonIcon,
        label: Text(
          buttonText,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 15),
        ));
  }
}

class PressButtonWidget extends StatelessWidget {
  // NORMAL PRESS İŞLEMLERİ İÇİN KULLANILAC BUTTON( OTURUM AÇ VS İÇİN  )
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double buttonHeight;
  final double buttonWeight;
  final VoidCallback onPress;

  const PressButtonWidget(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.buttonHeight,
      required this.buttonWeight,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          iconSize: MaterialStateProperty.all(buttonHeight),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
          backgroundColor: MaterialStateProperty.all(buttonColor),
          fixedSize:
              MaterialStateProperty.all(Size(buttonWeight, buttonHeight)),
        ),
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(
              color: textColor, fontSize: 12, fontWeight: FontWeight.bold),
        ));
  }
}

class WhiteSmallPressButton extends StatelessWidget {
  // KÜÇÜK BEYAZ RENKLİ BUTTON CARD SINIFININ İÇİNDE RANDEVU AL VE SORU SOR İÇİN KULLANILABİLİR )
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double buttonHeight;
  final VoidCallback onPress;

  const WhiteSmallPressButton(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      required this.buttonHeight,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: buttonHeight,
      child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.black38))),
            backgroundColor: MaterialStateProperty.all(buttonColor),
            fixedSize: MaterialStateProperty.all(const Size(150, 20)),
            // elevation: MaterialStateProperty.all(20),
          ),
          onPressed: onPress,
          child: Text(
            buttonText,
            style: TextStyle(
                color: textColor, fontSize: 14, fontWeight: FontWeight.bold),
          )),
    );
  }
}
