import 'package:avukapp/constant/constant.dart';
import 'package:avukapp/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
              titleWidget: const Text(
                "Hoşgeldiniz",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              body:
                  "AvukApp mobil uygulamasına hoşgeldiniz. Küçük bir tura çıkmak istiyorsan yana kaydır.",
              image: Lottie.asset(
                "assets/law.json",
                height: 200,
                width: 300,
              )),
          PageViewModel(
              titleWidget: const Text(
                "Anasayfa",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              body:
                  "Anasayfada aktif avukat ilanlarını görebilir, arama yapabilirsiniz. ",
              image: Image.asset(
                "assets/images/page2.png",
                height: 200,
                width: 200,
              )),
          PageViewModel(
              titleWidget: const Text(
                "Profil Sayfası",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              body: "Bu sayfada profiliniz özelleştirebilirsiniz.",
              image: Image.asset(
                "assets/images/profil.png",
                height: 200,
                width: 200,
              )),
          PageViewModel(
              titleWidget: const Text(
                "Randevu Sayfası",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              body: "Bu sayfada randevu durumunuzu görebilrisiniz.",
              image: Image.asset(
                "assets/images/page3.png",
                height: 200,
                width: 200,
              )),
          PageViewModel(
              titleWidget: const Text(
                "Randevu Detay Sayfası",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              body:
                  "Bu sayfada randevularınıza katılabiilir veya iptal edebilirsiniz.",
              image: Image.asset(
                "assets/images/page4.png",
                height: 200,
                width: 200,
              )),
          PageViewModel(
              titleWidget: const Text(
                "Hazırsanız başlayalım!",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              body: "Hadi avukatını bul!",
              image: Lottie.asset(
                "assets/ready.json",
                height: 300,
                width: 300,
              )),
        ],
        onDone: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
          await _storeOnboardInfo();
        },
        onChange: (value) {},
        onSkip: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
          await _storeOnboardInfo();
        },
        showSkipButton: true,
        skip: const Text(
          "Atla",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: kNavyBlueColor),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: kNavyBlueColor,
        ),
        done: const Text(
          "Bitti",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: kNavyBlueColor),
        ),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10),
            activeSize: const Size(20, 10),
            color: Colors.black26,
            activeColor: kNavyBlueColor,
            spacing: const EdgeInsets.symmetric(horizontal: 3),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
