import 'package:flutter/material.dart';

// anasayfa kartları tüm alanları parametre olarak alır ,profil url string formatında gelir
class MainCart extends StatelessWidget {
  final Text ad;
  final Text deneyim;
  final Text alan;
  final Widget randevuButtom;
  final Widget soruButton;
  final String profilUrl;

  const MainCart(
      {super.key,
      required this.ad,
      required this.deneyim,
      required this.alan,
      required this.randevuButtom,
      required this.soruButton,
      this.profilUrl =
          "https://avatars.githubusercontent.com/u/83426543?s=400&u=fb4d6b6b4aee7e33c0c65f83f6f9e5e5bf41bc56&v=4"});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      child: Card(
          elevation: 20,
          margin: EdgeInsets.all(5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          color: Colors.green.shade400,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(profilUrl),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: ad,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: alan,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: deneyim,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    randevuButtom,
                    const SizedBox(
                      width: 5,
                    ),
                    soruButton
                  ],
                )
              ],
            ),
          )),
    );
  }
}
