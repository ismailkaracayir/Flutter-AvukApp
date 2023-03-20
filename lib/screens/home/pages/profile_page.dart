import 'package:flutter/material.dart';
import '../constant/my_constant.dart';
import '../widgets/my_custom_list_tile.dart';

class MyUserProfilePage extends StatefulWidget {
  const MyUserProfilePage({super.key});

  @override
  State<MyUserProfilePage> createState() => _MyUserProfilePageState();
}

class _MyUserProfilePageState extends State<MyUserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.black12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            child: Text(
                              "Utku Bilgin",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            child: Text(
                              "Ceza Hukuku hukuk",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            child: Text(
                              "deneyim aawawdawdladl lawdladla lawdladl wldaldl lw ladlwald l lawdalwdl awdll wadlldawldalwdawldldawdldl adwlawdla wdlwlda utku",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
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
                onTap: () {},
                child: const MyCustomListTileWidget(
                  backgroundUrl:
                      "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                  titleName: "Profil Düzenle",
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: const MyCustomListTileWidget(
                  backgroundUrl:
                      "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                  titleName: "Randevularım",
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 10),
              Row(
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
              ),
              const SizedBox(height: 10),
              const MyCustomListTileWidget(
                backgroundUrl:
                    "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                titleName: "Profil Düzenle",
              ),
              const SizedBox(height: 10),
              const MyCustomListTileWidget(
                backgroundUrl:
                    "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                titleName: "Dil Ayarları",
              ),
              const SizedBox(height: 10),
              const MyCustomListTileWidget(
                backgroundUrl:
                    "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                titleName: "Hakkında",
              ),
              const SizedBox(height: 10),
              const MyCustomListTileWidget(
                backgroundUrl:
                    "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                titleName: "terms & conditions",
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {},
                child: const MyCustomListTileWidget(
                  backgroundUrl:
                      "https://avatars.githubusercontent.com/u/61207150?s=400&u=11f6bd41453a4ce6432b0effcf1a11417b5fded7&v=4",
                  titleName: "Profil Düzenle",
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
