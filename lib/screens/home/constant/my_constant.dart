import 'package:flutter/material.dart';

// ! const Color
const kNavyBlueColor = Color(0xFF0A2A5E);
const kCreamColor = Color(0xFFF5F5DC);
const kWineRedColor = Color(0xFF800000);
const kBlackColor = Color(0xFF000000);
const kWhiteColor = Color(0xFFFFFFFF);

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

// ! const General Paddin
class DefaultPadding extends EdgeInsets {
  const DefaultPadding.allLow() : super.all(16);
  const DefaultPadding.allNormal() : super.all(20);
  const DefaultPadding.allHigh() : super.all(24);
  const DefaultPadding.allSoHigh() : super.all(32);
  const DefaultPadding.symtcHrztHigh() : super.symmetric(horizontal: 26);
  const DefaultPadding.symtcHrztNormal() : super.symmetric(horizontal: 20);
  const DefaultPadding.symtcHrztLow() : super.symmetric(horizontal: 16);
}
