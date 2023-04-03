import 'package:avukapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/app_bar_widget.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  final String _editIcon = "assets/icons/profile_design.svg";
  final String _loremText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "Hakkında",
      ),
      body: Padding(
        padding: const PagePadding.symtcHrztHigh(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              customSubjectTitle(titlee: "Biz Kimiz"),
              const SizedBox(height: 10),
              customTextContent(content: _loremText),
              const SizedBox(height: 30),
              customSubjectTitle(titlee: "Ne Yapıyoruz"),
              const SizedBox(height: 10),
              customTextContent(content: _loremText),
              const SizedBox(height: 30),
              customSubjectTitle(titlee: "Nasıl Yapıyoruz"),
              const SizedBox(height: 10),
              customTextContent(content: _loremText),
              const SizedBox(height: 30),
              customSubjectTitle(titlee: "Neden Yapıyoruz"),
              const SizedBox(height: 10),
              customTextContent(content: _loremText),
              const SizedBox(height: 30),
              customSubjectTitle(titlee: "Nasıl Yapıyoruz"),
              const SizedBox(height: 10),
              customTextContent(content: _loremText),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Container customTextContent({required String content}) {
    return Container(
      color: kCreamColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          content,
          style: textStyle(),
        ),
      ),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontSize: 16,
      color: kNavyBlueColor,
    );
  }

  Row customSubjectTitle({required String titlee}) {
    return Row(
      children: [
        SvgPicture.asset(
          _editIcon,
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 15),
        Text(
          titlee,
          style: customTextStyle(textSize: 20),
        ),
      ],
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
