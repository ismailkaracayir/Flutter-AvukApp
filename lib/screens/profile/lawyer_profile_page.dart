import 'package:avukapp/screens/profile/profile_detail/about_detail/about.dart';
import 'package:avukapp/screens/profile/profile_detail/language_detail/language_settings.dart';
import 'package:avukapp/screens/profile/profile_detail/notification_detail/notification.dart';
import 'package:avukapp/screens/profile/profile_detail/place_an_ad_detail/place_an_ad.dart';
import 'package:avukapp/screens/profile/profile_detail/profile_pages/profile_appointment_page/my_appointments.dart';
import 'package:avukapp/screens/profile/profile_detail/profile_pages/profile_edit_page/edit_profile.dart';
import 'package:avukapp/screens/profile/profile_detail/terms_conditions_detail/terms_conditions.dart';
import 'package:avukapp/screens/profile/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/constant.dart';
import '../../dummy/avukat_model.dart';
import '../../manager/navigator_manager.dart';
import '../../viewmodel/user_view_model.dart';
import '../../widgets/my_custom_list_tile.dart';

class LawyerProfilePage extends StatefulWidget {
  @override
  State<LawyerProfilePage> createState() => _LawyerProfilePageState();
}

class _LawyerProfilePageState extends State<LawyerProfilePage> {
  final String _iconProfile = "assets/icons/profile_design.svg";

  final String _iconAppointMent = "assets/icons/profile_date.svg";

  final String _iconLanguage = "assets/icons/profile_language.svg";

  final String _iconAbout = "assets/icons/profile_about.svg";

  final String _iconTermsCndton = "assets/icons/profile_terms_conditions.svg";

  final String _iconNotification = "assets/icons/notification.svg";

  final String _iconPlaceAnAd = "assets/icons/announcement.svg";

  final String _iconLogout = "assets/icons/logout.svg";
  late LawyerModel lawyerModel;
  late int isLawyer;
  @override
  void initState() {
    super.initState();
    final user = Provider.of<UserViewModel>(context, listen: false);

    lawyerModel = LawyerModel(
      email: user.user!.email,
      userName: user.user!.userName,
      pass: "bu bir şifredir benim şifremdir",
      lawyerRegistrationNumber: "0001",
      profilImgURL:
          "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
      alani: user.user!.isLawyer != 1 ? user.user!.email : user.user!.userName,
      content:
          "deneyim aawawdawdladl lawdladla lawdladl wldaldl lw ladlwald l lawdalwdl awdll wadlldawldalwdawldldawdldl adwlawdladeneyim aawawdawdladl lawdladla lawdladl wldaldl lw ladlwald l lawdalwdl awdll wadlldawldalwdawldldawdldl adwlawdla   wdlwlda utku",
      isLawyer: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.symtcHrztNormal(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          lawyerModel.profilImgURL ?? _iconProfile,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            lawyerModel.userName ?? "NULL",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: kNavyBlueColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: Text(
                            lawyerModel.alani ?? "NULL",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              color: kNavyBlueColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          child: Text(
                            lawyerModel.content ?? "NULL",
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              color: kNavyBlueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: MyCustomListTileWidget(
                backgroundUrl: _iconProfile,
                titleName: "Profil Düzenle",
              ),
              onTap: () {
                NavigatorManager().navigatToWidget(
                  context,
                  const EditProfile(
                    name: "utku",
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: MyCustomListTileWidget(
                backgroundUrl: _iconAppointMent,
                titleName: "Randevularım",
              ),
              onTap: () {
                NavigatorManager().navigatToWidget(
                  context,
                  const MyAppointmentPage(),
                );
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: MyCustomListTileWidget(
                backgroundUrl: _iconPlaceAnAd,
                titleName: "İlanlarım",
              ),
              onTap: () {
                NavigatorManager().navigatToWidget(
                  context,
                  const PlaceAnAd(),
                );
              },
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            textContext(),
            const SizedBox(height: 10),
            GestureDetector(
              child: MyCustomListTileWidget(
                backgroundUrl: _iconNotification,
                titleName: "Bildirim Ayarları",
              ),
              onTap: () {
                NavigatorManager().navigatToWidget(
                  context,
                  const NotificationPage(),
                );
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: MyCustomListTileWidget(
                backgroundUrl: _iconLanguage,
                titleName: "Dil Ayarları",
              ),
              onTap: () {
                NavigatorManager().navigatToWidget(
                  context,
                  const LanguageSettingsPage(),
                );
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: MyCustomListTileWidget(
                backgroundUrl: _iconAbout,
                titleName: "Hakkında",
              ),
              onTap: () {
                NavigatorManager().navigatToWidget(
                  context,
                  const AboutPage(),
                );
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              child: MyCustomListTileWidget(
                backgroundUrl: _iconTermsCndton,
                titleName: "Koşullar & Şartlar",
              ),
              onTap: () {
                NavigatorManager().navigatToWidget(
                  context,
                  const TermsConditionsPage(),
                );
              },
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: MyCustomListTileWidget(
                backgroundUrl: _iconNotification,
                titleName: "Profil Düzenle",
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            GestureDetector(
              child: MyCustomListTileWidget(
                backgroundUrl: _iconLogout,
                titleName: "Çıkış Yap",
              ),
              onTap: () {
                _singOutUser(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _singOutUser(BuildContext context) async {
    final usermodel = Provider.of<UserViewModel>(context, listen: false);
    usermodel.singOut();
  }

  Row textContext() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Genel Ayarlar",
          style: TextStyle(
            color: kNavyBlueColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
