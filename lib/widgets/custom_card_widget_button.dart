import 'package:flutter/material.dart';

import '../constant/constant.dart';

class CustomCardWidgetButton extends StatelessWidget {
  const CustomCardWidgetButton({
    super.key,
    required this.buttonTitle,
  });

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Center(
        child: Text(
          buttonTitle,
          style: const TextStyle(
            color: kNavyBlueColor,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
