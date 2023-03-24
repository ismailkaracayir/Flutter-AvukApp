import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constant/app_bar_widget.dart';
import '../../../../constant/constant.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final String _editIcon = "assets/icons/notification.svg";
  bool _remember = false;
  bool _remember2 = false;
  bool _remember3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCreamColor,
      appBar: const CustomAppBar(appTitle: "Bildirim Ayarları"),
      body: Padding(
        padding: const PagePadding.symtcHrztHigh(),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      _editIcon,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "Bildirimleri hatırlat.",
                      style: customTextStyle(textSize: 20),
                    ),
                  ],
                ),
                Checkbox(
                  value: _remember,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _remember = value;
                      });
                    }
                  },
                  activeColor: kNavyBlueColor,
                  checkColor: kCreamColor,
                  splashRadius: 5,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      _editIcon,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "Bildirimleri hatırlat.",
                      style: customTextStyle(textSize: 20),
                    ),
                  ],
                ),
                Checkbox(
                  value: _remember2,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _remember2 = value;
                      });
                    }
                  },
                  activeColor: kNavyBlueColor,
                  checkColor: kCreamColor,
                  splashRadius: 5,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      _editIcon,
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 220,
                      child: Text(
                        "Mesaj bildirimlerini göster.",
                        style: customTextStyle(textSize: 20),
                      ),
                    ),
                  ],
                ),
                Checkbox(
                  value: _remember3,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _remember3 = value;
                      });
                    }
                  },
                  activeColor: kNavyBlueColor,
                  checkColor: kCreamColor,
                  splashRadius: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle customTextStyle({required double textSize}) {
    return TextStyle(
      color: kNavyBlueColor,
      fontSize: textSize,
      fontWeight: FontWeight.w500,
    );
  }
}
