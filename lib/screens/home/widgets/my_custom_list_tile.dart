import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/my_constant.dart';

class MyCustomListTileWidget extends StatelessWidget {
  final String backgroundUrl;
  final String titleName;

  const MyCustomListTileWidget({
    super.key,
    required this.backgroundUrl,
    required this.titleName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kNavyBlueColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 74,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SvgPicture.asset(backgroundUrl, height: 46),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleName,
                    style: const TextStyle(
                      color: kNavyBlueColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 32,
                color: kWineRedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
