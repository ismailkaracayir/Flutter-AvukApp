import 'package:flutter/material.dart';

// ! const Color
const kMyBackgroundColor = Colors.green;
const kMyPrimaryColor = Color.fromARGB(255, 166, 19, 127);
const kMyPrimaryTextColor = Color(0xFFD0BED4);
const kMyPrimaryBlack = Color(0xFF0B0B11);

// ! const Font Size

const double kMyFontSizeSoLow = 15;
const double kMyFontSizelow = 18;
const double kMyFontSizeNormal = 22;
const double kMyFontSizeHigh = 28;

// ! const Page Paddin
class PagePadding extends EdgeInsets {
  const PagePadding.allLow() : super.all(15);
  const PagePadding.allNormal() : super.all(20);
  const PagePadding.allHigh() : super.all(25);
  const PagePadding.allSoHigh() : super.all(30);
  const PagePadding.symtcHrztHigh() : super.symmetric(horizontal: 26);
  const PagePadding.symtcHrztNormal() : super.symmetric(horizontal: 20);
  const PagePadding.symtcHrztLow() : super.symmetric(horizontal: 16);
}
