import 'package:flutter/material.dart';
import '../../../../constant/app_bar_widget.dart';
import '../../../../constant/constant.dart';
import '../../constant/terms_conditions.dart';

class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({
    super.key,
  });

  @override
  State<TermsConditionsPage> createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
  late final List<TermCondition> _termsAndConditionRules;

  @override
  void initState() {
    super.initState();
    _termsAndConditionRules = termsAndConditionItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appTitle: "Koşullar ve Şartlar",
      ),
      body: Padding(
        padding: const PagePadding.symtcHrztNormal(),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: _termsAndConditionRules.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: kWineRedColor.withOpacity(0.15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                _termsAndConditionRules[index].title,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: kNavyBlueColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                child: Text(
                                  _termsAndConditionRules[index].content,
                                  maxLines: 6,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: kNavyBlueColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: kCreamColor,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: kNavyBlueColor.withOpacity(0.6),
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          color:
                                              kNavyBlueColor.withOpacity(0.4),
                                          child: Center(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  " !! ",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: kCreamColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: Text(
                                          "Oku",
                                          style: TextStyle(
                                            color:
                                                kNavyBlueColor.withOpacity(0.6),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
