import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.buttonName,
  });
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: kNavyBlueColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            buttonName,
            textAlign: TextAlign.center,
            style: GoogleFonts.cutiveMono(
              color: kCreamColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
