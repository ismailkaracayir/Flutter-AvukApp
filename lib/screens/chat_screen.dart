import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 60,
          elevation: 40,
          title: const Text(
            "deneme",
            style: TextStyle(fontSize: 18),
          ),
          actions: const [
            CircleAvatar(
              radius: 25,
            ),
            SizedBox(
              width: 20,
            ),
          ]),
      body: Center(
          child: Column(
        children: [
          Expanded(child: StreamBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Text("deneme");
                },
              );
            },
          )),
          Row(
            children: [
              Expanded(
                child: TextField(
                  cursorColor: Colors.blueGrey,
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Mesajınızı Yazın",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              IconButton(
                  iconSize: 30,
                  onPressed: (() {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 250,
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera),
                                title: const Text('Kamera'),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: const Icon(Icons.image),
                                title: const Text('Galeri'),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: const Icon(Icons.video_call),
                                title: const Text('Video Çek'),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: const Icon(Icons.video_camera_front),
                                title: const Text('Video Yükle'),
                                onTap: () {},
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                  icon: const Icon(CupertinoIcons.paperclip)),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    child: const Icon(
                      Icons.navigate_next,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ),
            ],
          )
        ],
      )),
    );
  }
}
