import 'package:flutter/material.dart';
import '../constant/constant.dart';
import '../model/declare.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    required this.moodel,
    required this.solButton,
    required this.sagButton,
  });

  final DeclareModel moodel;
  final Widget solButton;
  final Widget sagButton;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 0.9,
        height: height * 0.3,
        decoration: BoxDecoration(
          color: kNavyBlueColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://imgs.search.brave.com/RU0yRHJk_pU92g_cE88XYWs-HrLaxwScJqMBD1t_Sz8/rs:fit:844:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC55/b0haN09DTWZyWkc5/WGVWak42Q1dRSGFF/SyZwaWQ9QXBp",
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                          const Icon(
                            Icons.star,
                            size: 19,
                            color: Colors.amber,
                          ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "NULL UB",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: newTextStyleMethod(textSize: 20),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              moodel.declareCategory ?? "NULL Kategori",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: newTextStyleMethod(textSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: solButton,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: sagButton,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle newTextStyleMethod({required double textSize}) {
    return TextStyle(
      fontSize: textSize,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }
}
