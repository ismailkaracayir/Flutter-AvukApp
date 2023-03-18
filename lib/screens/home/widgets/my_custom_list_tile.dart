import 'package:flutter/material.dart';

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
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 74,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  backgroundUrl,
                ),
              ),
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
                      color: Colors.green,
                      fontSize: 18,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
