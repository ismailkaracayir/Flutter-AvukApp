import 'package:avukapp/model/user.dart';
import 'package:avukapp/screens/home/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/constant.dart';
import '../screens/home/home_page.dart';
import '../screens/message/message_page.dart';
import '../screens/notification/notification_page.dart';
import '../screens/profile/profile_page.dart';

class MyPageManager extends StatefulWidget {
  UserModel? user;
  MyPageManager({required this.user, super.key});

  @override
  State<MyPageManager> createState() => _MyPageManagerState();
}

class _MyPageManagerState extends State<MyPageManager> {
  int selectinIndex = 0;
  final double _bottomBarHeight = 60;
  final int _duration = 600;
  final double _animateContainerWitdth = 74;

  String getAppName(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return "Ana Sayfa";

      case 1:
        return "Mesajlar";

      case 2:
        return "Bildirimler";

      case 3:
        return "Profil Sayfası";
      default:
        return "-";
    }
  }

  @override
  Widget build(BuildContext context) {
    PageController myPage = PageController(initialPage: selectinIndex);
    return Scaffold(
      drawer: selectinIndex == 0 ? const NavBar() : null,
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: 70,
        title: Text(
          getAppName(selectinIndex),
          // style: const TextStyle(
          //   fontSize: 24,
          //   fontWeight: FontWeight.bold,
          //   color: kCreamColor,
          // ),
          style: GoogleFonts.cutiveMono(
            color: kCreamColor,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: kNavyBlueColor,
        centerTitle: true,
      ),
      // drawer: Drawer(),
      body: PageView(
        // physics: const NeverScrollableScrollPhysics(),
        controller: myPage,
        onPageChanged: (value) {
          setState(() {
            selectinIndex = value;
          });
        },
        children: const [
          MyHomePage(),
          MyMessagePage(),
          MyNotificationPage(),
          MyUserProfilePage(),
        ],
      ),
      bottomNavigationBar: homeBottomBar(myPage),
    );
  }

  Padding homeBottomBar(PageController myPage) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          color: kNavyBlueColor,
        ),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: _bottomBarHeight,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: selectinIndex == 0 ? kCreamColor : null,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectinIndex = 0;
                        myPage.jumpToPage(selectinIndex);
                      });
                    },
                    icon: Icon(
                      Icons.home,
                      color: selectinIndex == 0 ? kNavyBlueColor : kCreamColor,
                      size: 32,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: selectinIndex == 1 ? kCreamColor : null,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            selectinIndex = 1;
                            myPage.jumpToPage(selectinIndex);
                          });
                        },
                        icon: Icon(
                          Icons.message,
                          color:
                              selectinIndex == 1 ? kNavyBlueColor : kCreamColor,
                          size: 32,
                        ),
                      ),
                      Positioned(
                        bottom: 26,
                        left: 50,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            color: kWineRedColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "1",
                              style: TextStyle(color: kCreamColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: selectinIndex == 2 ? kCreamColor : null,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectinIndex = 2;
                        myPage.jumpToPage(selectinIndex);
                      });
                    },
                    icon: Icon(
                      Icons.notifications,
                      color: selectinIndex == 2 ? kNavyBlueColor : kCreamColor,
                      size: 32,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: selectinIndex == 3 ? kCreamColor : null,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectinIndex = 3;
                        myPage.jumpToPage(selectinIndex);
                      });
                    },
                    icon: Icon(
                      Icons.person,
                      color: selectinIndex == 3 ? kNavyBlueColor : kCreamColor,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
