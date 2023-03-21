import 'package:avukapp/constant/constant.dart';
import 'package:flutter/material.dart';

class AppBarLeadingWidget extends StatelessWidget {
  const AppBarLeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 17,
        right: 17,
        top: 17,
        bottom: 17,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kCreamColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: kCreamColor,
            width: 2,
          ),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
