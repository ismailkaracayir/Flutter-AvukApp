import 'package:avukapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class MyMessagePage extends StatefulWidget {
  const MyMessagePage({super.key});

  @override
  State<MyMessagePage> createState() => _MyMessagePageState();
}

class _MyMessagePageState extends State<MyMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const PagePadding.allNormal(),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ChatPage()));
            },
            child: Card(
              color: Colors.grey.shade200,
              shadowColor: Colors.deepOrange,
              margin: const EdgeInsets.all(7),
              child: const ListTile(
                title: Text("İsmail Karaçayır"),
                subtitle: Text('Sigorta Avukatı'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://st.depositphotos.com/1779253/5140/v/950/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg'),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
