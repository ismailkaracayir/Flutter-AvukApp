import 'package:flutter/material.dart';

import 'constant/my_constant.dart';
import 'pages/home_page.dart';
import 'pages/message_page.dart';
import 'pages/notification_page.dart';
import 'pages/profile_page.dart';

class MyPageManager extends StatefulWidget {
  const MyPageManager({super.key});

  @override
  State<MyPageManager> createState() => _MyPageManagerState();
}

class _MyPageManagerState extends State<MyPageManager> {
  int selectinIndex = 0;
  final double _bottomBarHeight = 60;
  final int _duration = 600;
  final double _animateContainerWitdth = 74;

  @override
  Widget build(BuildContext context) {
    PageController myPage = PageController(initialPage: selectinIndex);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        toolbarHeight: 70,
        title: const Text("AvukApp"),
        backgroundColor: kMyBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          size: 32,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.person_2,
              size: 32,
            ),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: myPage,
        children: const [
          MyHomePage(),
          MyMessagePage(),
          MyNotificationPage(),
          MyUserProfilePage(),
        ],
      ),
      bottomNavigationBar: homeBottomBar(myPage),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: kMyBackgroundColor,
      //   child: const Text("+"),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
          color: kMyBackgroundColor,
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
                    color: selectinIndex == 0 ? Colors.purple : null,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectinIndex = 0;
                        myPage.jumpToPage(selectinIndex);
                      });
                    },
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: selectinIndex == 1 ? Colors.purple : null,
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
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
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
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "1",
                              style: TextStyle(color: Colors.white),
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
                    color: selectinIndex == 2 ? Colors.purple : null,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectinIndex = 2;
                        myPage.jumpToPage(selectinIndex);
                      });
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: _duration),
                  width: _animateContainerWitdth,
                  decoration: BoxDecoration(
                    color: selectinIndex == 3 ? Colors.purple : null,
                    borderRadius: BorderRadius.circular(36),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        selectinIndex = 3;
                        myPage.jumpToPage(selectinIndex);
                      });
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
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
