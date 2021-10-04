import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;

class ChatListScreen extends StatefulWidget {
  // const ChatListScreen({ Key? key }) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatListScreen(),
    );
  }
}

class ChatListStream extends StatefulWidget {
  // const ChatListStream({ Key? key }) : super(key: key);

  @override
  _ChatListStreamState createState() => _ChatListStreamState();
}

class _ChatListStreamState extends State<ChatListStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("message_list").snapshots(),
      builder: (context, snapshot) {
        final myChatList = snapshot.data!.docs;

        List<Text> xList = [];

        for (var x in myChatList) {
          xList.add(Text(x.toString()));
        }

        return Expanded(
            child: ListView(
          children: xList,
        ));
      },
    );
  }
}
